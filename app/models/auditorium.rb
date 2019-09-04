class Auditorium < ApplicationRecord
  self.table_name = 'auditoriums'
  belongs_to :theater
end
