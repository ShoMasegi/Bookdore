class RemoveTimestampsFromRegisterHistory < ActiveRecord::Migration[5.2]
  def change
    remove_column :register_histories, :created_at, :datetime
    remove_column :register_histories, :updated_at, :datetime
  end
end
