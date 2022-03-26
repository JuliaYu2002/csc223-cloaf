class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password
      t.num :total_rides
      t.time :registration_date

      t.timestamps
    end
  end
end
