class Review < ApplicationRecord
  belongs_to :restaurant
  # validates :content, :rating, allow_blank: true
  validates :rating, inclusion: { in: (0..5) }, numericality: { only_integer: true }
  validates :content, :rating, presence: true
end
