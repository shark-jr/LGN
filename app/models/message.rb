class Message < ApplicationRecord
  # TODO: belongs_to :event
  belongs_to :user
  after_create_commit { BroadcastMessageJob.perform_later self}
end
