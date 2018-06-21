class MakeupMaker::CLI
  def call
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
