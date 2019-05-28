class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title, null: false
      t.string :publisher
      t.string :authors, array: true, default: [], null: false
      t.text :description
      t.string :category
      t.string :thumbnail
      t.integer :page, default: 0, null: false

      t.timestamps
    end
  end
end
