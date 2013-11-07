class RemoveWhoColumnFromBookings < ActiveRecord::Migration
  def change
    change_table :bookings do |t|
      t.remove :who
    end
  end
end

