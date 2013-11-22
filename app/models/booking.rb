class Booking < ActiveRecord::Base
  validates :from, presence: true
  validates :to, presence: true

  validate :from_date_must_be_earlier_than_to_date

  def from_date_must_be_earlier_than_to_date
    errors.add(:from, 'must be earlier than to') if
        from != nil && to != nil && from > to
  end
  belongs_to :user, :class_name => 'User',
             :foreign_key => 'user_id'
end
