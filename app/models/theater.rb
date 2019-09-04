class Theater < ApplicationRecord
  has_many :theater_movies, dependent: :delete_all
  has_many :auditoriums, dependent: :delete_all
  has_many :movies, through: :theater_movies

  accepts_nested_attributes_for :theater_movies, allow_destroy: true
  accepts_nested_attributes_for :auditoriums, allow_destroy: true
end