require 'pry'

class Gym
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    #DONE
    #Get a list of all gyms
    def self.all
        @@all
    end

    #DONE
    #Get a list of all memberships at a specific gym
    def memberships
        Membership.all.select {|m| m.gym == self}
    end

    #DONE
    #Get a list of all the lifters that have a membership to a specific gym
    def lifters
        memberships.map {|m| m.lifter}.uniq
    end

    #DONE
    #Get a list of the names of all lifters that have a membership to that gym
    def lifter_name
        lifters.map {|lifter| lifter.name}
    end

    #DONE
    #Get the combined lift_total of every lifter has a membership to that gym
    def combined_lift_total
        sum = 0
        lifters.each {|lifter| sum += lifter.lift_total}
        sum
    end
end