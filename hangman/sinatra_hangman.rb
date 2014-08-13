require 'haml'
require 'sinatra'
require 'pry'


enable :sessions

before do
  session[:blackjack] ||= {}
end

#Index
get '/blackjack' do
  @game = session[:blackjack]
  haml :'hangman/index'
end

post '/blackjack' do
  @names  
