class Location < ApplicationRecord
  geocoded_by :address
  before_validation :geocode, :if => :address_changed?
end
