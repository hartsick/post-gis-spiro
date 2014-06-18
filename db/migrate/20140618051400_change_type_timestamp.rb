class ChangeTypeTimestamp < ActiveRecord::Migration
  def change
  	change_column :user_locations, :timestamp, :bigint
  end
end
