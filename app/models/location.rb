class Location < ApplicationRecord
  attr_accessor :address, :latitude, :longitute
  geocoded_by :address
  # turn this into method for zipcode column
  after_validation :geocode => :address_changed?
end
