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

    # todays_news = [ ]
    #
    # todays_news << "Today's Morning Shift: #{article_page.css("h1.headline.hover-highlight.entry-title.js_entry-title").text} \n"
    # i = 0
    # while i < 3
    #   todays_news << article_page.css(".post__content-wrapper").css("p")[i].text
    #   i += 1
    # end

    # p = article_page.css("p")
    # loop p's and find title's and build articles
    ps = article_page.css("p")

    paragraphs = [ ]
    current_p = 0
    ps.each_with_index do |p, i|
      if i == 0
        paragraphs[current_p] = {:sub_title => p.text}
        current_p = 1
      else
        if p.text.include?("1st")
          paragraphs[current_p] = {"#{current_p.to_s}_gear" => {"title" => p.text}}
          current_p = 1
        elsif p.text.include?("2nd")
          paragraphs[current_p] = {"#{current_p.to_s}_gear" => {"title" => p.text}}
          current_p = 2
        elsif p.text.include?("3rd")
          paragraphs[current_p] = {"#{current_p.to_s}_gear" => {"title" => p.text}}
          current_p = 3
        elsif p.text.include?("4th")
          paragraphs[current_p] = {"#{current_p.to_s}_gear" => {"title" => p.text}}
          current_p = 4
        elsif p.text.include?("5th")
          paragraphs[current_p] = {"#{current_p.to_s}_gear" => {"title" => p.text}}
          current_p = 5
        else
          binding.pry
          paragraphs[current_p]["#{current_p.to_s}_gear"].store("text#{i.to_s}", p.text)
        end
      end
    end
    binding.pry
    todays_news.join(" ")
  end
end
