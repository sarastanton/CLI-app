require 'nokogiri'
require 'open-uri'
require 'pry'

class Yarn
  attr_accessor :name, :weight, :fiber, :price, :sale

  @@yarns = []

  def initialize(sale = nil)
    @@yarns << self
    @sale = sale
  end

  def self.new_from_website
    doc = Nokogiri::HTML(open('http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html'))

    doc.css(".titleSmall").each do |y1|
      y1 = Yarn.new
      Yarn.name =
      Yarn.weight = doc.css(".yarnWeight")[1].text
      Yarn.fiber = doc.css(".yarnWeight").first.text
      Yarn.price = doc.css(".costSmall").first.text.strip
      @@yarns << y1
      end
      binding.pry

    yarn.yarn_url = @yarn_url = "www.knitpicks.com#{doc.css(".titleSmall").first.attribute("href").value}"
  end

  self.new_from_website
end
