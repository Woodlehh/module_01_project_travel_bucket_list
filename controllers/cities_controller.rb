require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/city.rb')
require_relative('../models/country.rb')
also_reload('../models/*')

get '/cities' do
  @cities = City.all
  erb(:"cities/index")
end

get '/cities/new' do
  @cities = City.all
  erb(:"cities/new")
end

post '/cities' do
  City.new(params).save
  redirect to("/cities")
end

get '/cities/:id' do
  @city = City.find(params['id'])
  erb(:show)
end

get '/cities/:id/edit' do
  @countries = Country.all
  @cities = City.find(params['id'])
  erb(:edit)
end

post '/cities/:id' do
  city = City.find(params)
  city.edit
  redirect to "/cities/#{params['id']}"
end

post '/cities/:id/delete' do
  city = City.find(params['id'])
  city.delete
  redirect to("/cities")
end
