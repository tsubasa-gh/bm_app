class CreateDailyRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_records do |t|
      t.float :daily_weight
      t.float :total_calorie
      t.float :total_protain
      t.float :total_fat
      t.float :total_carbo
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
