require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_knitpicks
    doc = Nokogiri::HTML(open('http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html'))
    binding.pry
    # @name = doc.css(".titleSmall").first.attribute("title").value
    # @weight = doc.css(".yarnWeight")[1].text
    # @fiber = doc.css(".yarnWeight").first.text
    # @price = doc.css(".costSmall").first.text.strip   **maybe parse to separate $ from grams?**
    # @size =
    # @yardage =

# should it have one class scrape the "All yarns" page and then another scraping the url of each individual yarn?

  end

  self.scrape_knitpicks


end
