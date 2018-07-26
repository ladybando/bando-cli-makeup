require "colorize"
require "pry"
class MakeupMaker::CLI

  def call
    list_makers
    menu
  end

  def list_makers
    puts "Makeup Manufacturers: USA".colorize(:green)
    @makers = MakeupMaker::Maker.names
  end


  def menu
    @the_makers = MakeupMaker::Maker.create_makers
    #binding.pry
    input = nil
    while input != "exit"
      puts "***************************************************************************************************************************************************************************************************"
      puts "Enter the number of the manufacturer you would like more info on or type exit to leave: ".colorize(:green)
      puts "*****************************************************************************************************************************************************************************************************"
      input = gets.strip.downcase
      if input.to_i > 0
        makers = @the_makers
        makers
        #binding.pry
        puts "Stock Name:".colorize(:light_blue) + " #{makers[input.to_i-1].stock_name}"
        puts "Stock Price:".colorize(:light_blue)+ " $#{makers[input.to_i-1].stock_price}"
        puts "Location:".colorize(:light_blue) + " #{makers[input.to_i-1].location}"
        puts "URL:".colorize(:light_blue) + " #{makers[input.to_i-1].url}"
        puts "Corporate Info:".colorize(:light_blue) + " #{makers[input.to_i-1].corp_info}"
        puts "***************************************************************************************************************************************************************************************************************"
      elsif input.to_i != "exit"
        puts "Invalid entry. Please enter a number or exit."
        puts "***************************************************************************************************************************************************************************************************************"
      end
    end
    goodbye
  end

  def goodbye
    puts "That's all the info I have! Hope it was helpful!"
  end
end
