require 'pry'
require 'open-uri'
require 'nokogiri'

require_relative "../knitpickr/yarn.rb"


class Scraper

  attr_accessor :yarn, :doc

  @@all_names = []
  @@all_fibers = []
  @@all_weights = []
  @@all_yarns = []
  @@sale_items = []

  # def initialize
  #   @yarn = Yarn.new
  #   @doc = Nokogiri::HTML(open("http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html?showAll=yes"))
  # end

  def self.scrape_yarns
    @doc = Nokogiri::HTML(open("http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html?showAll=yes"))
  end

  def self.make_yarns
    self.scrape_yarns
    all_yarns = @doc.css("div.listItem.book")

    all_yarns.each do |yarn|
      y = Yarn.new(yarn.css(".titleSmall").first.attribute("title").value)
        @@all_yarns << y
      y.name = yarn.css(".titleSmall").first.attribute("title").value
        @@all_names << y.name
      y.weight = yarn.css(".yarnWeight")[1].text
        @@all_weights << y.weight
      y.fiber = yarn.css(".yarnWeight").first.text
        @@all_fibers << y.fiber
      y.price = yarn.css(".costSmall").first.text.strip
        if yarn.css(".listItemStatusTags").text == "SaleSaleNew"
           y.sale = trues
        end
      y.id += 1
      y
    end
  end

  def self.all_names
    @@all_names.uniq
  end

  def self.all_fibers
  @@all_fibers.uniq
    end

  def self.all_weights
    @@all_weights.uniq
  end

  def self.all_yarns
    @@all_yarns.uniq
  end

  def self.sale_items
    @@sale_items.uniq
  end


  make_yarns

  # binding.pry

end
