class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.string :avatar
      t.integer :world_force_id
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
