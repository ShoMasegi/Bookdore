class ChangeColumnToIntToCard < ActiveRecord::Migration[5.2]
  def up
    remove_column :cards, :status, :integer
    add_column :cards, :status, :integer, null: false, default: 0
  end

  def down
    change_column :cards, :status, :string
  end
end
