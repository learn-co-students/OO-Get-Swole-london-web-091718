class Gym
 ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self

  end

# Get a list of all gyms
  def self.all
    ALL
  end

  def memberships
    #Access all memberships => [Memberships]
    #determine wheter or not the membership belongs to this gym (self)
    Membership.all.select do |m|
      m.gym == self
    end
  end

  def lifters
    #Access all memberships
    #our gym?
    #make array of lifters from said memberships
    self.memberships.map do |m|
      m.lifter
    end
  end

  def lifter_names
    #get lifters
    #get names
    self.lifters.map do |l|
      l.name
    end
  end

  def total_lifter_liftable_weight
    lifter_liftable_weight = 0
    #get lifters
    self.lifters.each do |l|
      #add all of their weight
      lifter_liftable_weight += l.lift_total
    end
    lifter_liftable_weight
  end

# - Get a list of all memberships at a specific gym
  def gym_memberships
    Membership.all.select do |membership|
      membership.gym == self
    end
  end

# - Get a list of all the lifters that have a membership to a specific gym
  def lifters_gym
    gym_memberships.map do |membership|
      membership.lifter
    end
  end

# Get a list of the names of all lifters that have a membership to that gym
  def lifter_names_gym
    lifters_gym.map do |lifter|
      lifter.name
    end
  end

# - Get the combined lift_total of every lifter has a membership to that gym
  def total_lift
    sum = 0
    lifters_gym.map do |lifter|
    sum += lifter.lift_total
    end
  end
end
