require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer')
also_reload('../models/*')

get '/customers' do 
    @customers = Customer.find_all()
    erb(:"customers/index")
end

get '/customers/new' do 
    erb(:"customers/new")
end

get '/customers/:id' do 
    @customer = Customer.find(params['id'].to_i)
    erb(:"customers/show")
end

post '/customers' do 
    Customer.new(params).save
    redirect to '/customers'
end



