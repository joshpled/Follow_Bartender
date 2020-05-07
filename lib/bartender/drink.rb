class Drink
    attr_accessor :name, :drink_id, :ingredient, :instructions, :ingredients, :glass, :measures

    @@all = []

    def initialize(name:, drink_id:, ingredient:)
        @name = name
        @drink_id = drink_id
        @ingredient = ingredient
        @ingredients = []
        @measures = []
        @@all << self
    end 

    def self.all
        @@all
    end

end 
