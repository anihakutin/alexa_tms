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
        elsif p.text.include?("2nd")
          current_p = 2
          paragraphs[current_p] = {"#{current_p.to_s}_gear" => {"title" => p.text}}
        elsif p.text.include?("3rd")
          current_p = 3
          paragraphs[current_p] = {"#{current_p.to_s}_gear" => {"title" => p.text}}
        elsif p.text.include?("4th")
          current_p = 4
          paragraphs[current_p] = {"#{current_p.to_s}_gear" => {"title" => p.text}}
        elsif p.text.include?("5th")
          current_p = 5
          paragraphs[current_p] = {"#{current_p.to_s}_gear" => {"title" => p.text}}
        else
          paragraphs[current_p]["#{current_p.to_s}_gear"].store("text#{i.to_s}", p.text)
        end
      end

    end

    paragraphs
  end
end
