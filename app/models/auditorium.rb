class Auditorium < ApplicationRecord
  self.table_name = 'auditoriums'
  validates :name, presence: true, length: {maximum: 15}
  validates :capacity, presence: true, inclusion: {:in => 32..500}
  belongs_to :theater
end
