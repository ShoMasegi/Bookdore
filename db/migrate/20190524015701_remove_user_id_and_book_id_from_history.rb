class RemoveUserIdAndBookIdFromHistory < ActiveRecord::Migration[5.2]
  def change
    remove_reference :histories, :user, null: false, index: true
    remove_reference :histories, :book, null: false, index: true
  end
end
