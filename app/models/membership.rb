require 'pry'

class Membership
    attr_accessor :lifter, :gym, :cost
    @@all = []

    def initialize(lifter, gym, cost)
        @lifter = lifter
        @gym = gym
        @cost = cost
        @@all << self
    end

    #Get a list of all memberships
    def self.all
        @@all
    end
end