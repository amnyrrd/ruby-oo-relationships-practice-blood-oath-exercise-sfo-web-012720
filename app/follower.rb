class Follower
    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(attr_hash)
        @name = attr_hash[:name]
        @age = attr_hash[:age]
        @life_motto = attr_hash[:life_motto]
        @@all << self
    end

    def self.all
        @@all
    end

    def join_cult(cult)
        BloodOath.new(self, cult)
    end

    def self.of_a_certain_age(of_age)
        self.all.select{ |follower| follower.name if follower.age >= of_age }
    end
end