class RemoveWhoColumnFromBookings < ActiveRecord::Migration
  def change
    alter_table :bookings do |t|
      t.remove_column :who
    end
  end
end

