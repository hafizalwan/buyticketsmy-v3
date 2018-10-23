class Activity < ApplicationRecord
  belongs_to :user

  has_many :reservations
  has_many :guest_reviews

  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end
end
