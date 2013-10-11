class Booking < ActiveRecord::Base
  belongs_to :user
  validates :who, presence: true, length: { minimum: 5 }
end
