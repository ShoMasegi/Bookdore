class CreateRegisterHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :register_histories do |t|
      t.integer :from, null: false, default: 0
      t.integer :to, null: false, default: 0

      t.timestamps
    end
  end
end
