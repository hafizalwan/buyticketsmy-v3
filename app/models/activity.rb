class Activity < ApplicationRecord
  enum instant: {Request: 0, Instant: 1}

  belongs_to :user
  has_many :reservations
  has_many_attached :images

  geocoded_by :location_map
  after_validation :geocode, if: :location_map_changed?

  # Resize the uploaded image in activity creation section(photos.html.erb)
  def thumbnail input
    return self.images[input].variant(resize: '300x300').processed
  end
end
