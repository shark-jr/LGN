class Game < ApplicationRecord
  has_many :games_users
  has_many :users, through: :games_users
  has_and_belongs_to_many :events
end
