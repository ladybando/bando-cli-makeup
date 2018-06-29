require "pry"

class Makers
  attr_accessor :name, :stock_name, :stock_price, :url, :location, :corp_info

  @@all = []

  def initialize(makers_hash)
    makers_hash.each {|key, value| self.send("#{key}=", value)}
    @@all << self
  end

    def self.create_collection(makers_array)
      makers_array.collect do |makers_a|
        self.new(makers_a)
      end
  end

  def self.all
    @@all
  end
  #binding.pry
end
