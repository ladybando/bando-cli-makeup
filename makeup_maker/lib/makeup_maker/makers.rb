class MakeupMaker::Makers
  attr_accessor :name, :stock_name, :stock_price, :url, :location, :corp_info

  @@all = []

  def initialize(makers_array)
    binding.pry
    makers_array.each do |index|
      self.send("#{index}")
    end
    @@all << self
  end

  def self.names
    @makers = MakeupMaker::Scraper.name
    @makers.each.with_index(1) do |maker, i|
      puts "#{i}. #{maker}".colorize(:green)
    end
  end

    def self.create_collection
      @makers = MakeupMaker::Scraper.scrape_info
      @makers.collect {|makers_a| self.new(makers_a)}

    end

  def self.all
    @@all
  end
end
