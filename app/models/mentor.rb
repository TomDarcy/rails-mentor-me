class Mentor < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  def average_rating
    reviews.average(:rating).to_f
  end
end
