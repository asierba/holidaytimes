class AddUserToBookings < ActiveRecord::Migration
  def self.up
    add_column :users, :bookings, :reference
  end
end
