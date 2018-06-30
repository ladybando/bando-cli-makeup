class CLI

  def call
    list_makers
    menu
  end

  def list_makers
    puts "Makeup Manufacturers: USA"
    @makers = Scraper.name
    @makers.each.with_index(1) do |makers, i|
      puts "#{i}. #{makers}"
    end
  end


  def menu
    @the_makers = Scraper.scrape_info
    input = nil
    while input != "exit"
      puts "Enter the number of the manufacturer you would like more info on or type exit to leave: "
      input = gets.strip.downcase
      if input.to_i > 0
        makers = @the_makers[input.to_i - 1]
        puts "Stock Name:" + " #{makers.stock_name}"
        puts "Stock Price:"+ " $#{makers.stock_price}"
        puts "Location:" + " #{makers.location}"
        puts "URL:" + " #{makers.url}"
        puts "Corporate Info:" + " #{makers.corp_info}"
      elsif input != "exit"
        puts "Invalid entry. Please enter a number or exit."
      end
    end
    goodbye
  end

  def goodbye
    puts "That's all the info I have! Hope it was helpful!"
  end
end
