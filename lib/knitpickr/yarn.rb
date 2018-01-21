require 'pry'
require 'open-uri'
require 'nokogiri'

class Yarn
  attr_accessor :name, :weight, :fiber, :price, :yardage, :sale, :id


  def initialize(name)
    @name = name
    @id = 0
    @sale = nil
  end

  def find_by_weight(weight)
  end

  def find_by_name(name)
  end

  def find_by_fiber(fiber)
  end


end
