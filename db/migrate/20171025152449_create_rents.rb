class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.date :return_date, null: false
      t.boolean :return?, default: false

      t.timestamps
    end
  end
end
