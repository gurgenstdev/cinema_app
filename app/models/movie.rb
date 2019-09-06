class Movie < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :year, presence: true, numericality: {greater_than_or_equal_to: 1900, less_than_or_equal_to: 2019}
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :genre, presence: true, length: { maximum: 15 }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 60, less_than_or_equal_to: 360}

  has_many :theater_movies
  has_many :movies, through: :theater_movies
end
