require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/country.rb')
require_relative('../models/country.rb')
also_reload('../models/*')

get '/home' do
  @countries = Country.all
  erb(:"countries/index")
end

get '/countries/new' do
  @countries = Country.all
  erb(:"countries/new")
end

post '/countries' do
  Country.new(params).save
  redirect to("/countries")
end

# get '/countries/:id' do
#   @country = Country.find(params['id'])
#   erb(:show)
# end
#
# get '/countries/:id/edit' do
#   @countries = Country.all
#   @countries = Country.find(params['id'])
#   erb(:edit)
# end
#
# post '/countries/:id' do
#   country = Country.find(params)
#   country.edit
#   redirect to "/countries/#{params['id']}"
# end

post '/countries/:id/delete' do
  country = Country.find(params['id'])
  country.delete
  redirect to("/countries")
end
