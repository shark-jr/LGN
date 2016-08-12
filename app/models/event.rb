class Event < ApplicationRecord
  has_and_belongs_to_many :users, through: :events_users
  has_and_belongs_to_many :games
  has_many :events_users

  validates :name, presence: true,length: {minimum: 3}
  validates :description, presence: true,length: {maximum: 500}
  validates :date, presence: true
  validates :time, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, numericality: {only_integer: true}
  validates :country, presence: true

  geocoded_by :zip
  after_save :geocode
  after_validation :geocode


end
