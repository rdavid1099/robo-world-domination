class CreatePlatoon < ActiveRecord::Migration[5.0]
  def change
    create_table :platoons do |t|
      t.string :name
      t.integer :num_of_wins
      t.integer :num_of_losses

      t.timestamps null: false
    end
  end
end
