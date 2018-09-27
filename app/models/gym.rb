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


end#class
