class AddSpentTimeSecToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :spent_time_sec, :integer, default: 0, null: false
  end
end
