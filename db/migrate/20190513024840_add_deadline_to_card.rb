class AddDeadlineToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :deadline, :datetime
  end
end
