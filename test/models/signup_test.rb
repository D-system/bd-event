require "test_helper"

class SignupTest < ActiveSupport::TestCase
  test "can signup to an event and notification email sent" do
    event = FactoryBot.create(:event)
    params = FactoryBot.attributes_for(:signup)
    params[:event_id] = event.id
    email_number = ::ActionMailer::Base.deliveries.size

    assert_difference('Signup.count', 1) do
      Signup.create!(params)
    end
    assert_equal(email_number + 1, ::ActionMailer::Base.deliveries.size)
    email = ::ActionMailer::Base.deliveries.pop
    assert_equal("from_test@example.com", email.from.first)
    assert_equal("new_signup_test@example.com", email.to.first)
    assert_includes(email.subject, "New sign up")
    assert_includes(email.subject, event.name)
    assert_includes(email.body.raw_source, event.name)
    assert_includes(email.body.raw_source, params[:email])
  end

  test "can not signup to an event twice" do
    signup = FactoryBot.create(:signup)
    params = {event_id: signup.event_id, email: signup.email}

    assert_no_difference('Signup.count') do
      assert_raises(ActiveRecord::RecordNotUnique) do
        Signup.create!(params)
      end
    end
  end

  test "can not signup if email format invalid" do
    assert_no_difference('Signup.count') do
      assert_raises(ActiveRecord::RecordInvalid) do
        FactoryBot.create(:signup, email: 'email_format_wrong')
      end
    end
  end
end
