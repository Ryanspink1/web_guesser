require 'sinatra'
require 'sinatra/reloader'

Number = rand(100)

get '/' do
  chosen_number = params['guess'].to_i
  message = check_guess(chosen_number)
  erb :index, :locals => {:number => Number,
                          :message => message}
end

def check_guess(chosen_number)
  if chosen_number > Number + 5
    "Way too high!"
  elsif chosen_number > Number
    "Too high!"
  elsif chosen_number < Number - 5
    "Way too low!"
  elsif chosen_number < Number
    "Too low!"
  else
    "You got it right! The secret number is #{Number}."
  end
end