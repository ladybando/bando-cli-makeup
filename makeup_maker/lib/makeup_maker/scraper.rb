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
      @makers = []
      makers_a = {}
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
      docs = Nokogiri::HTML(open("https://finance.yahoo.com/quote/EL/profile?p=EL"))
      maker = self.new
      stock_name = doc.search("div tbody td a[title]")[19].text
      stock_price = doc.search("div tbody td span")[19].values[1]
      location = docs.search("div p")[0].text[16...28]
      url = docs.search("div p a")[1].text
      corp_info = docs.search("div p")[2].text

      stock_name = maker.stock_name
      stock_price = maker.stock_price
      location = maker.location
      url = maker.url
      corp_info = maker.corp_info

      makers_a[:stock_name] = doc.search("div tbody td a[title]")[19].text
      makers_a[:stock_price] = doc.search("div tbody td span")[19].values[1]
      makers_a[:location] = docs.search("div p")[0].text[16...28]
      makers_a[:url] = docs.search("div p a")[1].text
      makers_a[:corp_info] = docs.search("div p")[2].text
      makers_a
    end

    def self.scrape_coty
      @makers = []
      makers_a = {}
      docs_1 = Nokogiri::HTML(open("https://finance.yahoo.com/quote/COTY/profile?p=COTY"))
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
      maker = self.new
      maker.stock_name = docs_1.search("div h3").first.text
      maker.stock_price = doc.search("tr td span")[189].text.to_i
      maker.location = docs_1.search("div p")[0].text[16...28]
      maker.url = docs_1.search("div p a")[1].text
      maker.corp_info = docs_1.search("div p")[2].text

      stock_name = maker.stock_name
      stock_price = maker.stock_price
      location = maker.location
      url = maker.url
      corp_info = maker.corp_info

      makers_a[:stock_name] = docs_1.search("div h3").first.text
      makers_a[:stock_price] = doc.search("tr td span")[189].text.to_i
      makers_a[:location] = docs_1.search("div p")[0].text[16...28]
      makers_a[:url] = docs_1.search("div p a")[1].text
      makers_a[:corp_info] = docs_1.search("div p")[2].text
      makers_a
    #  binding.pry
    end
end
