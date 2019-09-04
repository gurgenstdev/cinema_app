class AddTheaterIdToAuditoriums < ActiveRecord::Migration[6.0]
  def change
    add_column :auditoriums, :theater_id, :integer
    add_index :auditoriums, :theater_id
  end
end
