require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message, color = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color,}
end

def check_guess(guess)
  case
  when guess > (SECRET_NUMBER + 5) then message = "Way too high!", color = "#FF1612"
  when guess > SECRET_NUMBER then message = "Too high!", color = "#FFC5CC"
  when guess < (SECRET_NUMBER - 5) then message = "Way too low!", color = "#FF1612"
  when guess < SECRET_NUMBER then message = "Too low!", color = "#FFC5CC"
  when guess == SECRET_NUMBER then message = "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}", color = "#21E809"
  end
end
