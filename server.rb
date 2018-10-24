require_relative "./scraper.rb"
require 'sinatra'
require 'json'

morning_shift = Scraper.new

article = morning_shift.scrape_morning_shift

post '/' do
  {
    version: "1.0",
    response: {
      outputSpeech: {
        type: "PlainText",
        text: article.first[:sub_title]
      }
    }
  }.to_json
end
