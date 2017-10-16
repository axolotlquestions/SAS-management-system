require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative '../models/adoption'

get '/adoptions' do
  @adoptions = Adoption.all()
  erb ( :"adoptions/index" )
end
