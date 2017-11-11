class Scraper

  def self.scrape_knitpicks
    doc = Nokogiri::HTML(open('http://www.knitpicks.com/yarns/All_Knit_Picks_Yarn__L300198.html'))
    binding.pry
    # @name =
    # @weight =
    # @fiber =
    # @price =
    # @size =
    # @yardage =

  end

  self.scrape_knitpicks


end
