require 'pry'
require 'open-uri'
require 'nokogiri'

class Yarn
  attr_accessor :name, :weight, :fiber, :price, :yardage, :sale


  def initialize(name)
    @name = name
    @id = 0
    @sale = nil
  end

  def self.find_by_weight(weight)
    Scraper.all_yarns.collect {|yarn| yarn.weight == weight}

  end

  def self.find_by_name(name)
    Scraper.all_yarns.collect {|yarn| yarn.name == name}

  end

  def self.find_by_fiber(fiber)
    Scraper.all_yarns.collect {|yarn| yarn.fiber == fiber}
  end


end
