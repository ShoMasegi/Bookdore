class AddCardIdReferenceToHistory < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM cards'
    add_reference :histories, :card, null: false, index: true
  end

  def down
    remove_reference :histories, :card, null: false, index: true
  end
end
