class User < ActiveRecord::Base
  belongs_to :manager, :class_name => 'User',
             :foreign_key => 'user_managed_by_id'

  has_many :bookings

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
