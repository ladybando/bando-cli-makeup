require 'pry'
class MakeupMaker::CLI
  def call
    list_makers
    menu
  end

  def list_makers
    puts "Makeup Manufacturers: USA"
    @makers = MakeupMaker::Makers.all

  end

  def menu
  input = nil
    while input != "exit"
    puts "Enter the number of the manufacturer you would like more info on or type exit to leave: "
    input=gets.strip.downcase
    if input.to_i > 0
        puts @makers[input.to_i - 1]
      elsif input == "list"
        puts list_makers
      else
        puts "Invalid entry. Please enter a number or exit"
      end
    end
    goodbye
  end

  def goodbye
    puts "That's all I have!"
  end
end
