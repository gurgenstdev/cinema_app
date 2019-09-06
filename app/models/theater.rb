class Theater < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30}
  validates :address, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 30}
  validates :phone_number, presence: true, length: {minimum: 6}

  has_many :theater_movies, dependent: :delete_all
  has_many :auditoriums, dependent: :delete_all
  has_many :movies, through: :theater_movies

  accepts_nested_attributes_for :theater_movies, allow_destroy: true
  accepts_nested_attributes_for :auditoriums, allow_destroy: true
end
