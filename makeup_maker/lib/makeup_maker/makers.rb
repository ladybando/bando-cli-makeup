class MakeupMaker::Makers
  attr_accessor :name, :stock_name, :stock_price, :url, :city_state, :corp_info

  def self.all
    makers_1 = self.new
    makers_1.stock_price = "$38"
    makers_1.name = "Revlon"
    makers_1.stock_name = "REV"
    makers_1.url = "yahoo.com"
    makers_1.city_state = "NY,NY"
    makers_1.corp_info = "largest manufacturer in US"

    makers_2 = self.new
    makers_2.name = "covergirl"
    makers_2.stock_name = "COTY"
    makers_2.stock_price = "$28"
    makers_2.url = "yahoo.com"
    makers_2.city_state = "NY,NY"
    makers_2.corp_info = "second largest manufacturer in US"
    [makers_1, makers_2]
  end

end
