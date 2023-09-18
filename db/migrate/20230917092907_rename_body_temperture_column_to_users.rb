class RenameBodyTempertureColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :body_temperture, :body_temperature
  end
end
