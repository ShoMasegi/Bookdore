class CreateReadHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :read_histories do |t|
      t.integer :page_count, null: false, default: 0
      t.integer :time_sec, null: false, default: 0

      t.timestamps
    end
  end
end
