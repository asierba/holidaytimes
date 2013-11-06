class Booking < ActiveRecord::Base
  validates :who, presence: true,length: { minimum: 5 }
  validate :from_date_must_be_earlier_than_to_date

  def from_date_must_be_earlier_than_to_date
    errors.add(:from, 'date must be earlier than to date') if
        from > to
  end
end
