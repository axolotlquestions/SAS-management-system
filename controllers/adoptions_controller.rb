require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative '../models/adoption'

get '/adoptions' do
  @adoptions = Adoption.all()
  erb ( :"adoptions/index" )
end

get '/adoptions/new' do
  @owners = Owner.all
  @animals = Animal.all_adoptable
  erb(:"adoptions/new")
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoption.save
  redirect to("/adoptions")
end
