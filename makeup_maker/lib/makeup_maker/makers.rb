class MakeupMaker::Makers
  attr_accessor :name, :stock_name, :stock_price, :url, :location, :corp_info


  def self.name
    #go to site
    #extract information
    #instantiate makers
    makers = []
    the_makers = self.new
    doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
    the_makers.name = doc.search("div tbody td a[title]")[19].values[1].strip
    makers << the_makers.name
    #binding.pry
  end

  def self.info
    makers_a = []
    makers_1 = self.new
    doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
    docs = Nokogiri::HTML(open("https://finance.yahoo.com/quote/EL/profile?p=EL"))
    #binding.pry
    stock_name = doc.search("div tbody td a[title]")[19].text
    stock_price = doc.search("div tbody td span")[19].values[1]
    city_state = docs.search("div p").text
    url = docs.search("div p").text
    corp_info = docs.search("div p").text
    makers_a << {name: stock_name, location: city_state, url: url, corp_info: corp_info}
    #binding.pry
  end

end
