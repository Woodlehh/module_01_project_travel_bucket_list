require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/cities_controller.rb')

get '/' do
  erb(:index)
end
