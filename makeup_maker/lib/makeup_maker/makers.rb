class MakeupMaker::Makers
  attr_accessor :name, :stock_name, :stock_price, :url, :location, :corp_info

  @@all = []

  def initialize(makers_hash)
    makers_hash.each {|key, value| self.send("#{key}=", value)}
    @@all << self
  end



  def self.names
    @makers = MakeupMaker::Scraper.name
    @makers.each.with_index(1) do |maker, i|
      puts "#{i}. #{maker}".colorize(:green)
    end
  end

  def self.create_makers
    @makers = MakeupMaker::Scraper.scrape_info
    @makers.collect {|maker| self.new(maker)}
  end

  def self.save
    @@all << self
  end

  def self.all
    @@all
    #binding.pry
  end

end
