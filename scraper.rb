require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :todays_news

  def scrape_morning_shift
    index_url = "https://jalopnik.com/c/the-morning-shift"
    doc = Nokogiri::HTML(open(index_url))

    article_link = doc.css("div.item__content.item__content--thumb").first.css("a.js_link")[0]["href"]

    article_page = Nokogiri::HTML(open(article_link))

    binding.pry
    # New link =
    # doc.css("div.item__content.item__content--thumb").first
    # doc.css("div.item__content.item__content--thumb").first.css("a.js_link")[0]["href"]

    # Morning shift page
  end
end
