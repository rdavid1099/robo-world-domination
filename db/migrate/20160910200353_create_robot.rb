class CreateRobot < ActiveRecord::Migration[5.0]
  def change
    create_table :robots do |t|
      t.string :name
      t.integer :health
      t.string :avatar
      t.references :division, foreign_key: true
      t.references :platoon, foreign_key: true

      t.timestamps null: false
    end
  end
end
