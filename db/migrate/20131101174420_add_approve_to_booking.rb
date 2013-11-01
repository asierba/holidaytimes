class AddApproveToBooking < ActiveRecord::Migration
  def change
    alter_table :bookings do |t|
      t.boolean :approved
    end
  end
end
