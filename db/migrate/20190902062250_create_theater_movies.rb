class CreateTheaterMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :theater_movies do |t|
      t.references :theater, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.timestamps
    end
  end
end
