
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

  def self.sum_of_lift_total_of_all_lifters
    sum=0
    @@all.map { |l| l.lift_total }.each { |t| sum+=t }
    sum
  end

  def self.average_lift
    sum_of_lift_total_of_all_lifters / @@all.count
  end

  def total_cost
    total = 0
    memberships.map { |m| m.cost }.each { |c| total+=c }
    total
  end

  def self.all 
    @@all
  end

end
