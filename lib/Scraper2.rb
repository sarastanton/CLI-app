require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper


@@all_yarn = []
@@yarn_names = []

  def initialize(url = 'http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html?showAll=yes')
    @url = url
  end

  def self.yarns
    @doc = Nokogiri::HTML(open('http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html?showAll=yes'))
    all_yarns = @doc.css("div.listItem.book")
    binding.pry
    id = 0

    all_yarns.collect do |yarn|
      id += 1
      y = yarns.new(yarn.css.attribute("title").value)
      y.id = id
      # @@yarn_names << yarn.css.attribute("title").value
      # y.name = yarn.attribute("title").value
      y.name = yarn.css(".titleSmall").first.attribute("title").value
      y.weight = yarn.css(".yarnWeight")[1].text
      y.fiber = yarn.css(".yarnWeight").first.text
      y.price = yarn.css(".costSmall").first.text.strip
      y.sale = nil
        if yarn.css(".listItemStatusTags").text == "SaleSaleNew"
           y.sale = true
        end
      # if yarn.search(".listItemStatusTags").text == "SaleSale"
      #   @sale = true
      # end
      # @@all_yarn << self

    end
  end

self.yarns
end

  # def self.scrape_knitpicks
  #   doc = Nokogiri::HTML(open('http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html?showAll=yes'))
  #   all_yarns = doc.css('.titleSmall')
  #   all_yarns.each do |yarn|
  #     @@yarn_names << yarn.attribute("title").value
  #   # @name = doc.css(".titleSmall").first.attribute("title").value
  #   # @weight = doc.css(".yarnWeight")[1].text
  #   # @fiber = doc.css(".yarnWeight").first.text
  #   # @price = doc.css(".costSmall").first.text.strip
  # end
    #   if doc.css(".listItemStatusTags").text == "SaleSale"
    #     @sale = true
    #     else @sale = false
    #   end
# puts "Which yarn would you like to learn more about?"
#     @@yarn_names.each.with_index(1) do |name, number|
#       puts "#{number}. #{name}"
#     end
#     puts "Enter a number:"
#     input = gets.chomp.to_i
#   end
#
#   Scraper.new
#   self.scrape_knitpicks

# should it have one class scrape the "All yarns" page and then another scraping the url of each individual yarn?


  # def self.scrape_details
  #   doc = Nokogiri::HTML(open("http://www.knitpicks.com/yarns/Swish_Worsted_Yarn__D5420153.html")) #***CHANGE BACK!**
  #     # @name = doc.css(".prodTitle").text.strip
  #     # @weight = doc.css(".prodTitle").attribute("href").value
  #     # @fiber = doc.css("")
  # # #   @price =
  # # #   @grams =
  # # #   @yardage =
  # #   # sale? = nil
  # #   # if ___
  # #   #   sale? = true
  # binding.pry

#     end
#   #
#   #   # @size =
#     # @yardage =
#
# self.scrape_details
# end

  # end


# @weight = doc.css(".yarnWeight")[1].text
# @fiber = doc.css(".yarnWeight").first.text
# @price = doc.css(".costSmall").first.text.strip   **maybe parse to separate $ from grams?**
