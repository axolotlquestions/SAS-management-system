require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animal_controller')
require_relative('controllers/owner_controller')
require_relative('controllers/adoptions_controller')

get '/' do
  erb( :index )
end
