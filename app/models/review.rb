class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :mentor # , through: :booking
end
