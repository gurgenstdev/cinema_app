class CreateAuditoria < ActiveRecord::Migration[6.0]
  def change
    create_table :auditoriums do |t|
      t.string :name
      t.integer :capacity
      t.timestamps
    end
  end
end
