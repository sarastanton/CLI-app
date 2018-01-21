require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

@@yarn_urls = []

  def self.scrape_knitpicks
    doc = Nokogiri::HTML(open('http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html'))
    @name = doc.css(".titleSmall").first.attribute("title").value
    @weight = doc.css(".yarnWeight")[1].text
    @fiber = doc.css(".yarnWeight").first.text
    @price = doc.css(".costSmall").first.text.strip
      if doc.css(".listItemStatusTags").text == "SaleSale"
        @sale = true
        else @sale = false
      end
  end

  self.scrape_knitpicks
  binding.pry

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


  end


# @weight = doc.css(".yarnWeight")[1].text
# @fiber = doc.css(".yarnWeight").first.text
# @price = doc.css(".costSmall").first.text.strip   **maybe parse to separate $ from grams?**



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


# def self.new_from_website
#   doc = Nokogiri::HTML(open('http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html'))
#
#   doc.css(".titleSmall").each do |y1|
#     y1 = Yarn.new
#     Yarn.name =
#     Yarn.weight = doc.css(".yarnWeight")[1].text
#     Yarn.fiber = doc.css(".yarnWeight").first.text
#     Yarn.price = doc.css(".costSmall").first.text.strip
#     @@yarns << y1
#     end
#     binding.pry
#
#   yarn.yarn_url = @yarn_url = "www.knitpicks.com#{doc.css(".titleSmall").first.attribute("href").value}"
# end
#
# self.new_from_website
