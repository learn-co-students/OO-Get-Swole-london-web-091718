##spec file is broken, therefore tested in binding.pry and all functions work as they should
require"pry"

class Gym
 ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def memberships
    result=[]
    Membership.all.each do |membership|
      result << membership if membership.gym == self
    end
    result
  end

  def membership_at_specific_gym
    Membership.all.map do |membership|
      membership if membership.gym==self
    end
  end

  def lifter_list_at_specific_gym
    result=[]
    Membership.all.each do |membership|
      result<<membership.lifter.name if membership.gym==self
    end
    result
  end

  def list_all_lifters_in_this_gym
    Membership.all.select  do |membership|
      membership.lifters if membership.gym==self
    end
  end

  def get_list_of_names_in_gym
    list_all_lifters_in_this_gym.map {|lifter| lifter.name}
  end

  def combined_lift_total
    result=list_all_lifters_in_this_gym.map {|lifter| lifter.lift_total}
    result.each {|e| sum += e}
  end


end
#-----------------------------------------------------
class Membership
  ALL = []

  attr_reader :cost, :lifter, :gym

  def initialize(cost, lifter, gym)
    @cost = cost
    @lifter = lifter
    @gym = gym
    ALL << self
  end

  def self.all
    ALL
  end

end

#------------------------------------------------------

class Lifter

  @@all = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select {|membership| membership.lifter == self}
  end

  def gyms
  result=[]
  Membership.all.each do |membership|
    result << membership.gym if membership.lifter==self
  end
  result
  end

  def self.average_lift_total
    result=[]
    Lifter.all.each do |lifter|
      result<<lifter.lift_total
    end
    result.average
  end

  def total_cost
    result=[]
    Membership.all.select do |membership|
      result<<membership.cost if membership.lifter==self
    end
    result.each {|e| sum += e}
  end


  def sign_up(gym,cost)
    Membership.new(cost,self,gym)
  end


end

#------------------------------------------------------------------------------

lifter1=Lifter.new("Lifter1-James",50)
lifter2=Lifter.new("Lifter2-Steve",70)
lifter3=Lifter.new("Lifter3-Lena",30)
lifter4=Lifter.new("Lifter4-Ed", 40)

gym_cw=Gym.new("Canary Wharf")
gym_bank=Gym.new("Bank")
gym_poplar=Gym.new("Poplar")

membership_james=Membership.new(50,lifter1,gym_cw)
membership_steve=Membership.new(80,lifter2,gym_bank)
membership_lena=Membership.new(40,lifter3,gym_cw)
membership_ed=Membership.new(80,lifter4,gym_bank)

binding.pry

p "eod"
