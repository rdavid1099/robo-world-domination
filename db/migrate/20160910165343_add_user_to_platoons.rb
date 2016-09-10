class AddUserToPlatoons < ActiveRecord::Migration[5.0]
  def change
    add_reference :platoons, :user, foreign_key: true
  end
end
