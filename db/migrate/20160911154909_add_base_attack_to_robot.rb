class AddBaseAttackToRobot < ActiveRecord::Migration[5.0]
  def change
    add_column :robots, :base_attack, :integer
  end
end
