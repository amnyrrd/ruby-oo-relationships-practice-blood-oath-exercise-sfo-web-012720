class Cult
    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        BloodOath.new("2020-02-02", self, follower)
    end

    def cult_population
        all_blood_oaths = BloodOath.all.select {|blood_oath| blood_oath.cult == self}
        all_blood_oaths.size
    end

    def self.find_by_name(name)
        self.all.select{ |cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select{ |cult| cult.location == location}
    end

    def self.least_popular
        self.all.min_by{|a| a.cult_population}
    end

    def self.find_by_founding_year(founding_year)
        self.all.select{ |cult| cult.founding_year == founding_year}
    end
end