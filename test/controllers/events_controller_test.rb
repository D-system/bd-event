require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index and retrieve event info" do
    event = FactoryBot.create(:event)
    FactoryBot.create(:event)
    signup1 = FactoryBot.create(:signup, event: event)
    signup2 = FactoryBot.create(:signup, event: event)

    get events_url, as: :json
    assert_response :success

    parsed = JSON.parse(response.body)
    assert_equal(2, parsed.count)

    parsed_event = parsed[0]
    assert_equal(event.uid, parsed_event['uid'])
    assert_equal(event.name, parsed_event['name'])
    assert_equal(event.location, parsed_event['location'])
    assert_equal(event.start_datetime.as_json, parsed_event['start_datetime'])
    assert_equal(event.end_datetime.as_json, parsed_event['end_datetime'])
    assert_equal([signup1.email, signup2.email], parsed_event['signed_up_emails'])
  end
end
