require 'pry'

class Lifter
    attr_accessor :name, :lift_total
    @@all = []

    def initialize(name, lift_total)
        @name = name
        @lift_total = lift_total
        @@all << self
    end

    #DONE
    #Get a list of all lifters
    def self.all
        @@all
    end

    #DONE
    #Get a list of all the memberships that a specific lifter has
    def memberships
        Membership.all.select {|m| m.lifter == self}
    end

    #DONE
    #Get a list of all the gyms that a specific lifter has memberships to
    def gyms
        memberships.map {|m| m.gym}
    end

    #DONE
    #Get the average lift total of all lifters
    def self.average_lift_total
        sum = 0
        Lifter.all.each { |lift| sum += lift.lift_total }
        average = sum / Lifter.all.length
    end

    #DONE
    #Get the total cost of a specific lifter's gym memberships
    def total_cost_of_gym_memberships
        sum = 0
        self.memberships.each {|m| sum += m.cost}
        sum
    end

    #DONE
    #Given a gym and a membership cost, sign a specific lifter up for a new gym
    def new_membership(gym, membership_cost)
        Membership.new(self,gym,membership_cost)
    end
end