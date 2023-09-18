class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :height
      t.integer :weight
      t.integer :body_temperture

      t.timestamps
    end
  end
end
