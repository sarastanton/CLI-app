module Knitpickr
end

require_relative '../config/environment'


# What I want my program to do:
#
#   Greet user
#   Ask user if they want to browse yarn by weight or fabric content
#   Scrape each line of yarn from www.knitpicks.com
#   Display these yarn lines in a numbered list and ask user to select one
#   Display additional info on selected yarn
#   Ask user to select another yarn or exit

# Classes I'll need:
# Yarn class
# An instance of Yarn has:
  # name
  # fiber content
  # yardage
  # weight
  # price
  # maybe a 'sale' flag? **not all will have sale, should be nil by default?**
  # size
# Scraper class
#CLI controller class
