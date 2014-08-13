require 'sinatra'
require 'pry'

# define a route
get '/' do
  'Hello world!'
end

get "/goodbye" do
  'Goodbye world!'
end

# get is a message defined by sinatra

get('/method') {'this is just ruby'}

get '/hasthelargehadroncolliderdestroyedtheworldyet' do
  okay = [:nope, :yeah].sample
  @var ||= 0
  @var += 1
  #erb :nope, :locals => { :status => okay }
  haml :nope2, :locals => { :status => okay }
end


get '/times' do
  # params is a function from Sinatra
  # it returns a hash of values set using
  # ?key=value&key2=value2 from the web
  @max = params[:max].to_i
  @min = params[:min].to_i
  haml :table
end

get '/user/:id/profile' do
  # Key in the params is defined by the
  #  name (after :) in route
  "The passed id is: #{params[:id]}"
end

get '/echo' do
  @text = params[:text]
  haml :echo
end

post '/echo' do
  @text = "you posted #{params[:text]}"
  haml :echo
end

get '/new' do
  contents = params[:contents]
  File.open(params[:name], 'w') do |f|
    f.puts contents
  end
end

get '/search' do
  haml :search
end
post '/search' do
  words = File.read("words.txt").split("/n")
  letters =params[:q].downcase.split("")
  matches = []
  words.each do |word|
    if letters.all? {|c| word.downcase.chompinclude?(c) }
      matches << word
    end
  end

  haml :search
end
