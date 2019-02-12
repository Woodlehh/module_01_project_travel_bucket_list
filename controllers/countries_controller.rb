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

get '/countries/:id' do
  @country = Country.find(params['id'])
  erb(:"countries/show")
end

get '/countries/:id/edit' do #edit city info
  @country = Country.find(params['id'])
  erb(:"countries/edit")
end

# post '/countries/:id' do #create a new Country object and update countries db
#   @country = Country.find(params[:id])
#   @country.name = params['name']
#   @country.update()
#   redirect('/countries')
# end

post '/countries/:id' do
  country = Country.new(params)
  country.update()
  redirect('/countries')
end

post '/countries/:id/delete' do
  Country.delete(params['id'])
  redirect('/countries')
end

# get '/countries/:id/edit' do
#   @countries = Country.all
#   erb(:"/countries/edit")
# end
#
# put('/countries/:id') do
#   country = Country.find(params['id'])
#   country.name = params['name']
#   country.save
#   redirect('/countries')
# end

# post '/countries/:id' do
#   Country.find(params).edit
#   redirect("/countries/#{params['id']}")
# end
