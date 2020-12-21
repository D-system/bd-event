require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "can not an event with existing uid (ActiveRecord validation)" do
    event_attrs = FactoryBot.attributes_for(:event)
    Event.create!(event_attrs)

    assert_no_difference('Event.count') do
      assert_raises(ActiveRecord::RecordInvalid) do
        Event.create!(event_attrs)
      end
    end
  end

  test "can not an event with existing uid (database validation)" do
    event_attrs = FactoryBot.attributes_for(:event)
    Event.create!(event_attrs)

    assert_no_difference('Event.count') do
      assert_raises(ActiveRecord::RecordNotUnique) do
        Event.new(event_attrs).save!(validate: false)
      end
    end
  end
end
