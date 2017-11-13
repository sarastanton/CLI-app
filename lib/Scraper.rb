require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

@@yarn_urls = []

  def self.scrape_knitpicks
    doc = Nokogiri::HTML(open('http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html'))
    doc.css(".titleSmall").each do |url|
       @@yarn_urls << url.attribute("href").value
      end
  end

  self.scrape_knitpicks

# should it have one class scrape the "All yarns" page and then another scraping the url of each individual yarn?


  def self.scrape_details
  #   @@yarn_urls.each do |url|
  #     doc = Nokogiri::HTML(open(url)
  #    #   binding.pry
  # #   # @name = doc.css(".titleSmall").first.attribute("title").value
  #     @name = doc.css(".prodTitle").text.strip
  # #   @weight =
  # #   @fiber =
  # #   @price =
  # #   @grams =
  # #   @yardage =
  #   # sale? = nil
  #   # if ___
  #   #   sale? = true
  #   # end
  #   end
  #
  #   # @size =
    # @yardage =




  end


# @weight = doc.css(".yarnWeight")[1].text
# @fiber = doc.css(".yarnWeight").first.text
# @price = doc.css(".costSmall").first.text.strip   **maybe parse to separate $ from grams?**
