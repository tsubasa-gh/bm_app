class ChangeDataWeightBdToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :weight, :float
    change_column :users, :body_temperture, :float
  end
end
