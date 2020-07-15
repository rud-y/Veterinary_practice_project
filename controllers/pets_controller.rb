require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/pet')
also_reload('../models/*')


get '/pets' do 
    @pets = Pet.find_all()
    erb(:"pets/index")
end

get '/pets/new' do 
    @vets = Vet.find_all()
    @customers = Customer.find_all()
    erb(:"pets/new")
end

get '/pets/:id' do 
    @pet = Pet.find(params['id'].to_i)
    erb(:"pets/show")
end

post '/pets' do #Create,save new
    Pet.new(params).save
    redirect to "/pets"
end

get '/pets/:id/edit' do 
    @pet = Pet.find(params['id'])
    @vets = Vet.find_all()
    erb(:"pets/edit")
end

post '/pets/:id' do  
    @pet = Pet.find(params['id'])
    @pet.treatment_notes = params['treatment_notes']
    @pet.vet_id = params['vet_id']
    @pet.update
    redirect to "/pets/#{params['id']}"
end
 
post '/pets/:id/delete' do
    @pet = Pet.find(params['id'])
    @pet.delete
    redirect to '/pets'
end
