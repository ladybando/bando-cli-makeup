class MakeupMaker::Makers
  attr_accessor :name, :stock_name, :stock_price, :url, :city_state, :corp_info


  def self.scraper
    makers = []
    makers << self.scrape_yahoo
    #makers << self.scrape_nasdaq
  end

  def self.scrape_yahoo
    #go to site
    #extract information
    #instantiate makers
    doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
    binding.pry
  end

end
