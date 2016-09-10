class CreateDivision < ActiveRecord::Migration[5.0]
  def change
    create_table :divisions do |t|
      t.string :unit_type

      t.timestamps null: false
    end
  end
end
