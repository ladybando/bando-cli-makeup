class MakeupMaker::CLI
  def call
    list_makers
    menu
  end

  def list_makers
    puts "Makeup Manufacturers: USA"
    @makers = MakeupMaker::Makers.name
    @makers.each.with_index(1) do |makers, i|
      puts "#{i}. #{makers}"
    end
  end


  def menu
    @the_makers = MakeupMaker::Makers.info
    input = nil
    while input != "exit"
    puts "Enter the number of the manufacturer you would like more info on or type exit to leave: "
    input=gets.strip.downcase

    #binding.pry
    if input.to_i > 0
       puts @the_makers
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
