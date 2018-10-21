require_relative "./scraper.rb"
require 'sinatra'
require 'json'

morning_shift = Scraper.new

binding.pry

post '/' do
  {
    version: "1.0",
    response: {
      outputSpeech: {
        type: "PlainText",
        text: "hello world"
      }
    }
  }.to_json
end
