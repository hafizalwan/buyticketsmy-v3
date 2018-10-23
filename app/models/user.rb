class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true, length: {maximum: 20}

  has_many :activities
  has_many :reservations
  has_many :guest_reviews, class_name: "GuestReview", foreign_key: "user_id"

end
