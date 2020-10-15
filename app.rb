require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/vets_controller')
require_relative('controllers/pets_controller')
require_relative('controllers/customers_controller')
require_relative('controllers/appointments_controller')

get '/home' do
  erb(:"home")
end
