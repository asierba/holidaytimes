class AddApproveToBooking < ActiveRecord::Migration
  def change
    change_table :bookings do |t|
      t.boolean :approved
    end
  end
end
