class AddBookIdToCards < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM cards'
    add_reference :cards, :book, null: false, index: true
  end

  def down
    remove_reference :cards, :book, index: true
  end
end
