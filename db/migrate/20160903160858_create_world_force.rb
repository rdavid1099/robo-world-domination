class CreateWorldForce < ActiveRecord::Migration[5.0]
  def change
    create_table :world_forces do |t|
      t.integer :total_wars_waged

      t.timestamps null: false
    end
  end
end
