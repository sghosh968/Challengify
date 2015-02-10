class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  scope :confirmed, -> { where(status: "Accepted") }
  scope :unconfirmed, -> { where(:status => "RequestSent") }
  scope :pending_received_friend_requests, ->(friend_id) { where(:friend_id => friend_id, :status => "RequestSent") }
  #scope :pending_sent_friend_requests, -> { where(:status => "RequestSent") }
end
