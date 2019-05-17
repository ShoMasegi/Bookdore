class AddUserIdToCards < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM cards'
    add_reference :cards, :user, null: false, index: true
  end

  def down
    remove_reference :cards, :user, index: true
  end
end
