json.extract! event, :name, :uid, :location, :start_datetime, :end_datetime
json.signed_up_emails event.signups.map(&:email)
