class Review < ApplicationRecord
  belongs_to :booking
  has_one :mentor, through: :booking
end
