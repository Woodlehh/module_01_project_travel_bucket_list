require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/city.rb')
require_relative('../models/country.rb')
also_reload('../models/*')

get '/countries' do
  @countries = Country.all
  erb(:"countries/index")
end

get '/countries/new' do
  @countries = Country.all
  erb(:"countries/new")
end

post '/countries' do
  Country.new(params).save
  redirect('/countries')
end

get '/countries/delete-all-warning' do
  erb(:"/countries/delete_all_warning")
end

get '/countries/:id' do
  @country = Country.find_by_id(params['id'])
  halt 404, "Invalid Country" unless @country
  @cities = City.all()
  erb(:"countries/show")
end

post '/countries/delete-all' do
  Country.delete_all
  redirect('/countries')
end

get '/countries/:id/edit' do #edit city info
  @country = Country.find_by_id(params['id'])
  halt 404, "Invalid Country" unless @country
  erb(:"countries/edit")
end

post '/countries/:id' do
  country = Country.new(params)
  country.update()
  redirect('/countries/' + params['id'].to_s)
end

post '/countries/:id/delete' do
  @country = Country.find_by_id(params['id'])
  halt 404, "Invalid Country" unless @country
  Country.delete_by_id(params['id'])
  redirect('/countries')
end
