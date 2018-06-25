require "pry"

class Makers
  attr_accessor :name, :stock_name, :stock_price, :url, :location, :corp_info

  @@all = []

  def initialize(makers_hash)
    makers_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self

  end

    def self.create_collection(makers_array)
      makers_array.each do |makers_hash|
        self.new(makers_hash)
    end
  end

  def self.all
    @@all
  end
end
