require "colorize"
class CLI

  def call
    list_makers
    menu
  end

  def list_makers
    puts "Makeup Manufacturers: USA".colorize(:green)
    @makers = Scraper.name
    @makers.each.with_index(1) do |makers, i|
      puts "#{i}. #{makers}".colorize(:green)
    end
  end


  def menu
    @the_makers = Scraper.scrape_info
    input = nil
    while input != "exit"
      puts puts "***************************************************************************************************************************************************************************************************************"
      puts "Enter the number of the manufacturer you would like more info on or type exit to leave: ".colorize(:green)
      puts "***************************************************************************************************************************************************************************************************************"
      input = gets.strip.downcase
      if input.to_i > 0
        makers = @the_makers[input.to_i - 1]
        puts "Stock Name:".colorize(:light_blue) + " #{makers.stock_name}"
        puts "Stock Price:".colorize(:light_blue)+ " $#{makers.stock_price}"
        puts "Location:".colorize(:light_blue) + " #{makers.location}"
        puts "URL:".colorize(:light_blue) + " #{makers.url}"
        puts "Corporate Info:".colorize(:light_blue) + " #{makers.corp_info}"
        puts "***************************************************************************************************************************************************************************************************************"
      elsif input != "exit"
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
