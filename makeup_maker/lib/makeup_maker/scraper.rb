class Scraper
  attr_accessor :name, :stock_name, :stock_price, :url, :location, :corp_info

    def self.name
      makers = []
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
      makers_name = doc.search("div tbody tr td")[191].text
      makers_1_name = doc.search("div tbody tr td")[621].text
      makers << makers_name
      makers << makers_1_name
    end

    def self.scrape_info
      makers_a = []
      makers_a << self.scrape_el
      makers_a << self.scrape_coty
    end

    def self.scrape_el
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
      docs = Nokogiri::HTML(open("https://finance.yahoo.com/quote/EL/profile?p=EL"))
      maker = self.new
      #instantiate new object
      maker.stock_name = doc.search("div tbody td a[title]")[19].text
      maker.stock_price = doc.search("div tbody td span")[19].values[1]
      maker.location = docs.search("div p")[0].text[16...28]
      maker.url = docs.search("div p a")[1].text
      maker.corp_info = docs.search("div p")[2].text
      maker
    end

    def self.scrape_coty
      docs_1 = Nokogiri::HTML(open("https://finance.yahoo.com/quote/COTY/profile?p=COTY"))
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
      #instantiate new object
      maker = self.new
      maker.stock_name = doc.search("div tbody td a[title]")[62].text
      maker.stock_price = doc.search("tr td span")[189].text.to_i
      maker.location = docs_1.search("div p")[0].text[16...28]
      maker.url = docs_1.search("div p a")[1].text
      maker.corp_info = docs_1.search("div p")[2].text
      maker
    end
end
