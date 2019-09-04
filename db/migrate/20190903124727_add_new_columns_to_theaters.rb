class AddNewColumnsToTheaters < ActiveRecord::Migration[6.0]
  def change
    add_column :theaters, :email, :string
    add_column :theaters, :address, :string
    add_column :theaters, :phone_number, :string
  end
end
