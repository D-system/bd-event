def load_events_from_config
  return if Rails.env.test?

  # `config_for` loads the correct data for the current environment (dev, test, prod)
  events = Rails.application.config_for(:events)

  # `.transaction` lock the "events" table (read is still works) to avoid race condition.
  Event.transaction do
    # TODO: Optimize the queries to load all existing events.
    #       Having an admin panel to create and update events will be a better
    #       and more long term solution.
    events.each do |event_yml|
      event = Event.find_by(uid: event_yml[:uid])

      if event
        event.update(event_yml)
      else
        event = Event.new(event_yml)
      end

      event.save!
    end

    # Delete removed events from configuration
    uids = events.map { |e| e[:uid] }
    Event.where.not(uid: uids).destroy_all
  end
end
