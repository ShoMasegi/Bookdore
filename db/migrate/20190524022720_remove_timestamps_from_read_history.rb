class RemoveTimestampsFromReadHistory < ActiveRecord::Migration[5.2]
  def change
    remove_column :read_histories, :created_at, :datetime, null: false
    remove_column :read_histories, :updated_at, :datetime, null: false
  end
end
