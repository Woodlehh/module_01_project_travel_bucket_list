require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/city.rb')
require_relative('../models/country.rb')
also_reload('../models/*')

get '/cities' do
  @cities = City.all()
  erb(:"cities/index")
end

get '/cities/new' do
  @cities = City.all()
  @status = ["Visited", "Not Visited", "Want To Visit"]
  @countries = Country.all()
  erb(:"cities/new")
end

get '/cities/status/:status' do
  if params[:status] == 'visited'
    @city_status = City.find_by_status('Visited')
    @city_title = "Visited Cities"
  elsif params[:status] == 'not-visited'
    @city_status = City.find_by_status('Not Visited')
    @city_title = "Cities Not Visited"
  elsif params[:status] == 'want-to-visit'
    @city_status = City.find_by_status('Want To Visit')
    @city_title = "Cities To Visit"
  else
    halt 404, "Invalid City Visited Status"
  end
  erb(:"cities/visit_status")
end

post '/cities' do
  City.new(params).save()
  redirect('/cities')
end

get '/cities/delete-all-warning' do
  erb(:"/cities/delete_all_warning")
end

get '/cities/:id' do
  @city = City.find_by_id(params['id'])
  halt 404, "Invalid City" unless @city
  erb(:"cities/show")
end

get '/cities/:id/edit' do #edit city info
  @city = City.find_by_id(params['id'])
  halt 404, "Invalid City" unless @city
  @status = ["Visited", "Not Visited", "Want To Visit"]
  @countries = Country.all()
  erb(:"cities/edit")
end

post '/cities/delete-all' do
  City.delete_all()
  redirect('/cities')
end

post '/cities/:id' do
  city = City.new(params)
  city.update()
  redirect('/cities/' + params['id'].to_s)
end

post '/cities/:id/delete' do
  @city = City.find_by_id(params['id'])
  halt 404, "Invalid City" unless @city
  City.delete_by_id(params['id'])
  redirect('/cities')
end
