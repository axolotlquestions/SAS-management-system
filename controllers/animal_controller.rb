require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative '../models/animal'

get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end
