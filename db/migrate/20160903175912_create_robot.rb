class CreateRobot < ActiveRecord::Migration[5.0]
  def change
    create_table :robots do |t|
      t.string :name
      t.integer :health
      t.date :creation_date
      t.string :avatar
      t.string :division
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
