require('sinatra')
require('sinatra/contrib/all') if development?
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

get '/customers/:id/edit' do #Edit-form
    # @pets = Pet.find_all()
    @customer = Customer.find(params['id'])
    erb(:"customers/edit")
end

post '/customers/:id' do #Update
    @customer = Customer.find(params['id']) #Customer.find(id)
    @customer.last_name = params['last_name']
    @customer.phone_number = params['phone_number']
    @customer.e_mail = params['e_mail']
    @customer.update
    redirect to "customers/#{params['id']}"
end

post '/customers/:id/delete' do
    customer = Customer.find(params['id'])
    customer.delete
    redirect to '/customers'
end



