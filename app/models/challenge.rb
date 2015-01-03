class Challenge < ActiveRecord::Base
  resourcify




  #get owners of a challenge
  def get_owners
    self.roles.where(:name => "owner").first.users
  end

  #to check if a user is an owner of a challenge or not
  def is_owner?(user)
    self.get_owners.include?(user)
  end
  def c_start
  end
  def c_end
  end
end
