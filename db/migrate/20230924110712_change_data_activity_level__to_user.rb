class ChangeDataActivityLevelToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :activity_level, :float
  end
end
