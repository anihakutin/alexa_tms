require_relative "./scraper.rb"
require 'sinatra'
require 'json'

morning_shift = Scraper.new

# binding.pry

post '/' do
  {
    version: "1.0",
    response: {
      outputSpeech: {
        type: "PlainText",
        text: morning_shift.todays_news
      }
    }
  }.to_json
end
