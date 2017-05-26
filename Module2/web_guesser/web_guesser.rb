require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)
@@number_of_guesses = 5

def check_guess(guess, number)
  difference = guess - number
  @@number_of_guesses -= 1  
  if(difference > 5)
    output = "Way too high!"
  elsif(difference > 0)
    output = "Too high!"
  elsif(difference < -5)
    output = "Way too low!"
  elsif(difference < 0)
    output = "Too low!"
  else
    output = "You got it right!"
  end

  output
end

get '/' do
#if you have & comes back as another parameter we can use conditional erbs to display the text
  strGuess =  params['guess']
  guess = strGuess.to_i
  message = check_guess(guess, settings.number )
  erb :index, :locals => {:number => settings.number, :message => message, :numberOfGuesses => @@number_of_guesses }
end
