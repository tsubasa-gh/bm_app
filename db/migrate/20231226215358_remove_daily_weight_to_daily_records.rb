class RemoveDailyWeightToDailyRecords < ActiveRecord::Migration[7.0]
  def change
    remove_column :daily_records, :daily_weight, :float
  end
end
