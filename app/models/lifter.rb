
class Lifter
  @@all = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end
  def sign_up(cost, gym)
    #Create membership
    Membership.new(cost, self, gym)
  end

  # - Get a list of all lifters
  def self.all
    @@all
  end

  # - Get a list of all the memberships that a specific lifter has
  def lifter_memberships
    Membership.all.select do |membership|
      membership.lifter == self
    end
  end

# - Get a list of all the gyms that a specific lifter has memberships to
  def lifter_gyms
    lifter_memberships.map do |membership|
      membership.gym
    end
  end
end

  # - Get the average lift total of all lifters
  #
  # - Get the total cost of a specific lifter's gym memberships
  #
  # - Given a gym and a membership cost, sign a specific lifter up for a new gym
