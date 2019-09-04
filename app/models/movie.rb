class Movie < ApplicationRecord
  has_many :theater_movies
  has_many :movies, through: :theater_movies

end
