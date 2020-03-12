class Game < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :title, presence: true
  validates :location, presence: true
end
