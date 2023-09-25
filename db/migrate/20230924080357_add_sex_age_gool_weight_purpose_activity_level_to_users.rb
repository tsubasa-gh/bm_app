class AddSexAgeGoolWeightPurposeActivityLevelToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sex, :integer
    add_column :users, :age, :integer
    add_column :users, :goal_weight, :float
    add_column :users, :purpose, :integer
    add_column :users, :activity_level, :integer
  end
end
