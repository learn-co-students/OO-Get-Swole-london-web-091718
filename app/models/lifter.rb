
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
    Membership.all.select {|membership| membership.lifter = self}
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
