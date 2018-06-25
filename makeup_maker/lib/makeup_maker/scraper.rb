class Scraper
  attr_accessor :name, :stock_name, :stock_price, :url, :location, :corp_info

    def self.name
      #go to site
      #extract information
      #instantiate makers
      makers = []
      the_makers = self.new
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
      the_makers.name = doc.search("div tbody tr td")[191].text
      makers << the_makers.name
    end

    def self.scrape_info
      makers_a = []

      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
      docs = Nokogiri::HTML(open("https://finance.yahoo.com/quote/EL/profile?p=EL"))

      stock_name = doc.search("div tbody td a[title]")[18].text
      stock_price = doc.search("div tbody td span")[19].values[1]
      city_state = docs.search("div p")[0].text[16...28]
      url = docs.search("div p a")[1].text
      corp_info = docs.search("div p")[2].text

      makers_a << {name: stock_name, stock_price: stock_price, location: city_state, url: url, corp_info: corp_info}
    end

end
