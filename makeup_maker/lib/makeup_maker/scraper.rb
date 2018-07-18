require "pry"
class MakeupMaker::Scraper
  # 1. Create a Maker class
    # -move attributes to Maker class
  # 2. Create a class variable to hold all makers
  # 3. Refer to that class variable from the CLI class rather than Scraper
  #attr_accessor :name, :stock_name, :stock_price, :url, :location, :corp_info

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

        doc.css("div tbody td").collect do |info|
          binding.pry
          stock_info = {
            :stock_name => info.css("a[title]")[19].text,
            :stock_price => info.css("span")[19].values[1]
          }
        end

        docs.css("div").collect do |info|
          stock_info = {
          :location => info.css("p")[0].text[16...28],
          :url => info.css("p a")[1].text,
          :corp_info => info.css("p")[2].text}
        end
    end

    def self.scrape_coty
      docs_1 = Nokogiri::HTML(open("https://finance.yahoo.com/quote/COTY/profile?p=COTY"))
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/sector/consumer_goods"))

      doc.css("div tbody td").collect do |info|
        stock_info = {
          :stock_name => info.css("a[title]")[62].text
        }
      end

      doc.css("tr td").collect do |info|
        stock_info = {
          :stock_price => info.css("span")[189].text.to_i
        }
      end

      docs_1.css("div").collect do |info|
        stock_info = {
          :location => docs_1.search("div p")[0].text[16...28],
          :url => docs_1.search("div p a")[1].text,
          :corp_info => docs_1.search("div p")[2].text}
      end
    end

end
