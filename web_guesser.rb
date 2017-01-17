require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  case
  when guess > (SECRET_NUMBER + 5) then "Way too high!"
  when guess > SECRET_NUMBER then "Too high!"
  when guess < (SECRET_NUMBER - 5) then "Way too low!"
  when guess < SECRET_NUMBER then "Too low!"
  when guess == SECRET_NUMBER then "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end
