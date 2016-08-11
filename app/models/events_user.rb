class EventsUser < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def add_host
    User.find_by(username: @username).events_users.find_by(event_id: @event.id).update(is_host: true)
  end
end
