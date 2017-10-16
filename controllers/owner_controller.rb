require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative '../models/owner'

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end
