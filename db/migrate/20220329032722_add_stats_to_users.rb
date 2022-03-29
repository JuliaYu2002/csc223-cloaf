class AddStatsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :total_rides, :num
  end
end
