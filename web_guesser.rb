require 'sinatra'
require 'sinatra/reloader'

Number = rand(100)
@colorize = nil

get '/' do
  chosen_number = params['guess'].to_i
  message = check_guess(chosen_number)
  erb :index, :locals => {:number => Number,
                          :message => message,
                          :colorize => @colorize}
end

def check_guess(chosen_number)
  if chosen_number > Number + 5
    @colorize = "background: red;"
    "Way too high!"
  elsif chosen_number > Number
    @colorize = "background: lightcoral;"
    "Too high!"
  elsif chosen_number < Number - 5
    @colorize = "background: red;"
    "Way too low!"
  elsif chosen_number < Number
    @colorize = "background: lightcoral;"
    "Too low!"
  else
    @colorize = "background: #20E114;"
    "You got it right! The secret number is #{Number}."
  end
end