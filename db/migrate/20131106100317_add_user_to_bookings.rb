class AddUserToBookings < ActiveRecord::Migration
  def change
    change_table :bookings do |t|
      t.integer :user_id
    end
    add_index :bookings, :user_id
  end
end
