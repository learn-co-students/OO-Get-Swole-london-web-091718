class Membership
  ALL = []

  attr_reader :cost, :lifter, :gym

  def initialize(cost, lifter, gym)
    @cost = cost
    @lifter = lifter
    @gym = gym
    ALL << self
  end


#  Get a list of all memberships
  def self.all
    ALL
  end


end
