class User < ActiveRecord::Base
  has_many :bookings
  validates :name, presence: true
  validates :holidayDaysLeft, presence: true, :numericality => { :greater_than => 0 }
end
