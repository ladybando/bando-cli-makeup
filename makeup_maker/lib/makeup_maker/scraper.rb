require "pry"
class MakeupMaker::Scraper
  # 1. Create a Maker class
    # -move attributes to Maker class
  # 2. Create a class variable to hold all makers
  # 3. Refer to that class variable from the CLI class rather than Scraper

    def self.name
      makers = []
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
      makers_name = doc.search("div tbody tr td")[201].text
      maker_name = doc.search("div tbody tr td")[651].text
      makers << makers_name
      makers << maker_name
    end

    def self.scrape_info
      makers = []
      makers << self.scrape_el
      makers << self.scrape_coty
      #binding.pry
    end

    def self.scrape_el
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))
      docs = Nokogiri::HTML(open("https://finance.yahoo.com/quote/EL/profile?p=EL"))

      makers_hash = {}
      makers_hash[:stock_name] = doc.search("div tbody td a[title]")[20].text
      makers_hash[:stock_price] = doc.search("div tbody td span")[20].values[1]
      makers_hash[:location] = docs.search("div p")[0].text[16...28]
      makers_hash[:url] = docs.search("div p a")[1].text
      makers_hash[:corp_info] = docs.search("div p")[2].text
      makers_hash

    end

    def self.scrape_coty
      docs = Nokogiri::HTML(open("https://finance.yahoo.com/quote/COTY/profile?p=COTY"))
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))

      makers_hash = {}

      makers_hash[:stock_name] = docs.search("div h3").first.text
      makers_hash[:stock_price] = doc.search("tr td span")[189].text.to_i
      makers_hash[:location] = docs.search("div p")[0].text[16...28]
      makers_hash[:url] = docs.search("div p a")[1].text
      makers_hash[:corp_info] = docs.search("div p")[2].text
      makers_hash

    end

end
