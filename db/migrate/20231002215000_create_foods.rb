class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :calorie
      t.float :protain
      t.float :fat 
      t.float :carbo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
