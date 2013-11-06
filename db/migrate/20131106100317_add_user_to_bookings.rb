class AddUserToBookings < ActiveRecord::Migration
  def change
    alter_table :bookings do |t|
      t.integer :user_id
    end
    add_index :bookings, :user_id
  end
end
