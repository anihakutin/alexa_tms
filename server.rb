require 'sinatra'
require 'json'

morning_shift = Scraper.new

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
