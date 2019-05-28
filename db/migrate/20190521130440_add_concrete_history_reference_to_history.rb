class AddConcreteHistoryReferenceToHistory < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM histories'
    add_reference :histories, :concrete_history, polymorphic: true, index: { name: 'index_histories_on_concrete_history' }
  end

  def down
    remove_reference :histories, :concrete_history, polymorphic: true, index: true
  end
end
