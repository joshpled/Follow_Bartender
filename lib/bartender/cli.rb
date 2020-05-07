class Cli
def run

    puts " "
    puts "Hello and Welcome to my bartending app!"
    puts " "
    puts "Enter Ingredient"
    puts " "
    @ingredient  = gets.strip.downcase

    Api.get_drinks(@ingredient)
    print_drinks(Drink.all)

    prompt_user
    input = gets.strip.downcase

    while input != "exit"
        if input == 'list'
            drinks = Drink.select_by_ingredient(@ingredient)
            print_drinks(drinks)
        elsif input.to_i > 0 && input.to_i < Drink.select_by_ingredient(@ingredient).length
            drink = Drink.select_by_ingredient(@ingredient)[input.to_i - 1]
            Api.getDrinkDetails(drink) if !drink.instructions
            print_drink(drink)

        # elsif

        else
            puts "I do not undertstand, please try again"
        end

        prompt_user
        input = gets.strip.downcase

    end 

    puts " "
    puts "bye!"
end 

def print_drinks(drinks)
    puts " "
    puts "Here are the drinks made with #{@ingredient}"
    drinks.each.with_index(1) do |drink, index|
    puts "#{index}. #{drink.name}"
    end 
    puts " "
end 

def print_drink(drink)
    puts drink.name
    puts drink.instructions
end 

def prompt_user
    puts " "
    puts "Select a number to see the instructions for a drink; 
    type 'list to see the list again, 
    'ingredient' to select a new ingredient, or 'exit' to exit."
end 

end