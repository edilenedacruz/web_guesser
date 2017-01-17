require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)
get '/' do
  "The secret number is #{NUMBER} ."
end
