
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
  def memberships
    #Access membership => [memberships]
    #Select all memberships for specific member
    Membership.all.select do |m|
      #compare whether or not lifter property == this lifter
      m.lifter == self
    end

  end

  def gyms
    #Access the Memberships.all array
    #Determine whether or not the memberships are mine/lifters
    my_memberships = self.memberships
    #create array of gyms from the memberships array
    my_memberships.map do |m|
      m.gym
    end
  end

  def self.all
    @@all
  end

  def self.average_lift
    memberships.map{|membership| membership.lift_total}.inject(&:+) / self.all.count
  end

  def sign_up(gym, cost)
    Membership.new(self, gym, cost)
  end

  def total_cost
    memberships.map{|membership| membership.cost}.inject(&:+)
  end

# returns the average lift_total of all lifters

  def self.average_lift
    count = self.all.count
    self.all.map{|lifter| lifter.lift_total}.inject(&:+) / count
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

end
