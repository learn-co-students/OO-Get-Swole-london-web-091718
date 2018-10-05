class Membership
  ALL = []

  attr_reader :cost, :lifter, :gym

  def initialize(lifter, gym, cost)
    @cost = cost
    @lifter = lifter
    @gym = gym
    ALL << self
  end

  def self.all
    ALL
  end


end
