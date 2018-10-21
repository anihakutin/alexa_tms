require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def scrape_morning_shift
    index_url = "https://jalopnik.com/c/the-morning-shift"
    doc = Nokogiri::HTML(open(index_url))

    binding.pry
  end
end
