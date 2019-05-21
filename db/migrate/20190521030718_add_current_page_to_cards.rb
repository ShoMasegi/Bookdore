class AddCurrentPageToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :current_page, :integer, default: 0, null: false
  end
end
