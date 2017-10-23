class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.string :category, default: ''
      t.text :description, default: ''

      t.timestamps
    end
  end
end
