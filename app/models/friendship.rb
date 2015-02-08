class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  scope :confirmed, -> { where(status: "Accepted") }
  scope :unconfirmed, -> { where(:status => "RequestSent") }
end
