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

    todays_news = [ ]

    todays_news << "Today's Morning Shift: #{article_page.css("h1.headline.hover-highlight.entry-title.js_entry-title").text} \n"
    i = 0
    while i < 3
      todays_news << article_page.css(".post__content-wrapper").css("p")[i].text
      i += 1
    end

    # article_page.css(".post__content-wrapper").css("p").each {|t| todays_news << t.text}

    # #{article_page.css(".post__content-wrapper").css("h2")[i].text} \n

    # binding.pry
    # New link =
    # doc.css("div.item__content.item__content--thumb").first
    # doc.css("div.item__content.item__content--thumb").first.css("a.js_link")[0]["href"]

    # Morning shift page
    # article = article_page.css("div.main__content.js_main__content")
    # article.title = article.css("h1.headline.hover-highlight.entry-title.js_entry-title").text
    # article_p_title = article_page.css(".post__content-wrapper").css("p")[1] etc...
    # article text = article_page.css(".post__content-wrapper").css("h2").each {|t| puts t.text}
    # binding.pry
    todays_news.join(" ")
  end
end
