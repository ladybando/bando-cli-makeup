require 'pry'
class MakeupMaker::CLI
  def call
    list_makers
    menu
  end

  def list_makers
    puts "Makeup Manufacturers: USA"
    @makers = MakeupMaker::Makers.scraper
    @makers.each.with_index(1) do |makers, i|
      puts "#{i}. #{makers.name}"
    end
  end

  def menu
  input = nil
    while input != "exit"
    puts "Enter the number of the manufacturer you would like more info on or type exit to leave: "
    input=gets.strip.downcase

    if input.to_i > 0
      the_makers = @makers[input.to_i - 1]
      puts "#{the_makers.name} - #{the_makers.stock_price} - #{the_makers.stock_name} - #{the_makers.url} - #{the_makers.city_state} - #{the_makers.corp_info}"
      elsif input == "list"
        puts list_makers
      elsif input != "exit"
        puts "Invalid entry. Please enter a number or exit"
      end
    end
    goodbye
  end

  def goodbye
    puts "That's all I have!"
  end
end
