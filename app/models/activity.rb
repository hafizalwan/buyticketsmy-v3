class Activity < ApplicationRecord
  belongs_to :user
  has_many :reservations

  geocoded_by :location_map
  after_validation :geocode, if: :location_map_changed?
end
