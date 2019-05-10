class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :book
      t.string :status

      t.timestamps
    end
  end
end
