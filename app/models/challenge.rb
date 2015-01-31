class Challenge < ActiveRecord::Base
  resourcify

  dragonfly_accessor :image
  attr_accessor :c_start , :c_end


  #get owners of a challenge
  def get_owners
    self.roles.where(:name => "owner").first.users
  end

  #to check if a user is an owner of a challenge or not
  def is_owner?(user)
    self.get_owners.include?(user)
  end

end
