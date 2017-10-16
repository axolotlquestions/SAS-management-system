require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative '../models/owner'

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

get '/owners/:id' do
  @owner = Owner.find(params['id'])
  erb(:"owners/show")
end
