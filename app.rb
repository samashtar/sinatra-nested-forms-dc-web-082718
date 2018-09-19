require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
get '/' do
  "Welcome to the Nested Forms Lab! let's navigate to the '/new'"
end

get '/pirates' do
  @pirates = Pirate.all
erb :"pirates/index"
end

get '/new' do
  erb :"pirates/new"
end

post '/pirates' do
name = params[:pirate][:name]
weight = params[:pirate][:weight]
height = params[:pirate][:height]
pirate = Pirate.new(name,weight,height)
params[:pirate][:ships].each do |ship_hash|
  name = ship_hash["name"]
  type = ship_hash["type"]
  booty = ship_hash["booty"]
  ship = Ship.new(name, type, booty)
end
redirect '/pirates'
end

get '/pirates/:id' do
@pirate = Pirate.find(params[:id])
erb :"pirates/show"
end




end
end
