class RemoveBookFromCards < ActiveRecord::Migration[5.2]
  def up
    remove_column :cards, :book, :string
  end
  def down
    add_column :cards, :book, :string
  end
end
