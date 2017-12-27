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
