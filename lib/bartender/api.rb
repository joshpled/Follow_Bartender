class Api

    def self.get_drinks(ingredient)
        ##what is my endpoint
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        ##how I get what I need
        response = Net::HTTP.get(URI(url))
        ##how do I hanle that json
        drinks = JSON.parse(response)['drinks']
        ##how to make a drink object
        drinks.each do |drink_details|
            name = drink_details['strDrink']
            drink_id = drink_details['idDrink']
            Drink.new(name: name, drink_id: drink_id, ingredient: ingredient)
        end

    end 

    def self.getDrinkDetails(drink)
        url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink.drink_id}"
        response = Net::HTTP.get(URI(url))
        drink_details = JSON.parse(response)['drinks'].first
        drink.instructions = drink_details["strInstructions"]
        binding.pry
    end 

end 