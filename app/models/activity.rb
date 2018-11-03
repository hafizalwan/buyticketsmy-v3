class Activity < ApplicationRecord
  enum instant: {Request: 0, Instant: 1}

  belongs_to :user
  has_many :reservations
  has_many_attached :images

  geocoded_by :location_map
  after_validation :geocode, if: :location_map_changed?
end
