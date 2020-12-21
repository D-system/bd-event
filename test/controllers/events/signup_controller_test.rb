require "test_helper"

class Events::SignupControllerTest < ActionDispatch::IntegrationTest
  test "should create a new signup" do
    event = FactoryBot.create(:event)
    params = FactoryBot.attributes_for(:signup)

    assert_difference('Signup.count', 1) do
      post events_signup_url(event_uid: event.uid, email: params[:email])
    end
    assert_response :success
  end

  test "should not create a signup on non-existing UID event" do
    params = FactoryBot.attributes_for(:signup)

    assert_no_difference('Signup.count') do
      post events_signup_url(event_uid: 'fake_uid', email: params[:email])
    end
    assert_response :unprocessable_entity
  end

  test "should not create a signup that is already in the signup list" do
    signup = FactoryBot.create(:signup)

    assert_no_difference('Signup.count') do
      post events_signup_url(event_uid: signup.event.uid, email: signup.email)
    end
    assert_response :unprocessable_entity
  end
end
