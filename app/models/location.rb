class Location < ApplicationRecord
  # has many :events

  geocoded_by :address
  before_validation :geocode, :if => :address_changed?
end
