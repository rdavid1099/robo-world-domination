class CreateRecord < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.integer :num_of_wins
      t.integer :num_of_losses

      t.timestamps null: false
    end
  end
end
