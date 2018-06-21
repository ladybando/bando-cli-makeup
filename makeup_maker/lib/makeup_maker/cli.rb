class MakeupMaker::CLI
  def welcome
    puts "Makeup Manufacturers: USA"
    list_makers
    menu
  end

  def list_makers
    puts <<-DOC
    1. Revlon
    2. Cover Girl
    DOC
  end

  def menu
  input = nil
    while input != "exit"
    puts "Enter the number of the manufacturer you would like more info on or type exit to leave:   "
    input=gets.strip.downcase
    case input
      when "1"
        puts "More info on maker 1"
      when "2"
        puts "More info on maker 2"
      else input != "exit"
        puts "Invalid number. Please enter a number or exit"
      end
    end
    goodbye
  end

  def goodbye
    puts "That's all I have!"
  end
end
