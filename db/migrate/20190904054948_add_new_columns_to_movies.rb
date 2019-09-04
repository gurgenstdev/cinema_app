class AddNewColumnsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :rating, :integer
    add_column :movies, :genre, :string
    add_column :movies, :duration, :integer
  end
end
