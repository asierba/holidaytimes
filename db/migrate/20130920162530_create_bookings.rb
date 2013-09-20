class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :who
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
