class AddUserIdReferenceToHistory < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM histories'
    execute 'DELETE FROM read_histories'
    execute 'DELETE FROM register_histories'
    add_reference :histories, :user, null: false, index: true
  end

  def down
    remove_reference :histories, :user, null: false, index: true
  end
end
