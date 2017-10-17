require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative '../models/animal'

get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end

get '/animals/new' do
  erb(:"animals/new")
end

get '/animals/admissions' do
  @animals = Animal.all()
  erb (:'animals/admissions')
end

get '/animals/:id/edit' do
  @animal = Animal.find(params['id'])
  erb(:'animals/edit')
end

get '/animals/:id' do
  @animal = Animal.find(params['id'])
  erb(:'animals/show')
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save
  redirect to ("/animals")
end

post '/animals/:id' do
  @animal = Animal.new(params)
  @animal.update
  redirect to("/animals")
end
