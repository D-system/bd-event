require "test_helper"

class SignupTest < ActiveSupport::TestCase
  test "can signup to an event" do
    event = FactoryBot.create(:event)
    params = FactoryBot.attributes_for(:signup)
    params[:event_id] = event.id

    assert_difference('Signup.count', 1) do
      Signup.create!(params)
    end
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
