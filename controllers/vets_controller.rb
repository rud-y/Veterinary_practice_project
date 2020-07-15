require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet')
also_reload('../models/*')


get '/vets' do 
    @vets = Vet.find_all()
    erb(:"vets/index")
end

get '/vets/new' do 
    erb(:"vets/new")
end

get '/vets/:id' do 
    @vet = Vet.find(params['id'].to_i)
    @pets = Pet.find_all
    erb(:"vets/show")
end


post '/vets' do 
    Vet.new(params).save
    redirect to '/vets'
end

get '/vets/:id/edit' do #Edit
    @vet = Vet.find(params['id'].to_i)
    erb(:"vets/edit")
end

post '/vets/:id' do #Update
    @vet = Vet.find(params['id'])
    @vet.last_name = params['last_name']
    @vet.phone_number = params['phone_number']
    @vet.update
    redirect to "vets/#{params['id']}"
end

post '/vets/:id/delete' do
    vet = Vet.find(params['id'])
    vet.delete
    redirect to '/vets'
end



