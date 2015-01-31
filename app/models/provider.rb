class Provider < ActiveRecord::Base
  belongs_to :user
  validates :uid , uniqueness: true , presence: true
end
