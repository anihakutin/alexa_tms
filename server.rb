require 'sinatra'
require 'json'


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
