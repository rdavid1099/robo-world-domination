class CreateWar < ActiveRecord::Migration[5.0]
  def change
    create_table :wars do |t|
      t.integer :user_id
      t.integer :opponent_id
      t.integer :wins
      t.integer :losses

      t.timestamps null: false
    end
  end
end
