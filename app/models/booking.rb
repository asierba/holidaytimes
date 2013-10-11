class Booking < ActiveRecord::Base
  validates :who, presence: true, length: { minimum: 5 }
end
