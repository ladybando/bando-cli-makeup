class MakeupMaker::Maker
  attr_accessor :name, :stock_name, :stock_price, :url, :location, :corp_info

  @@all = []

  def initialize(makers_hash)
    #binding.pry
      makers_hash.each do |key, value|
        self.send("#{key}=", value)
      end
      @@all << self
    end

  def self.names
    makers = MakeupMaker::Scraper.name
    makers.each.with_index(1) do |maker, i|
      puts "#{i}. #{maker}".colorize(:green)
    end
  end

  def self.create_makers
    makers_array = MakeupMaker::Scraper.scrape_info
    makers_array.collect do |makers_hash|
      self.new(makers_hash)
    end
  end

end
