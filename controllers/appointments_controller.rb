require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/appointment')



get '/appointments' do 
    @appointments = Appointment.find_all()
    erb(:"appointments/index")
end

get '/appointments/active' do 
    @appointments = Appointment.find_all()
    erb(:"appointments/active")
end

get '/appointments/new' do 
    @vets = Vet.find_all()
    @pets = Pet.find_all()
    erb(:"appointments/new")
end

post '/appointments' do 
    @appointment = Appointment.new(params)
    @appointment.save
    erb(:"appointments/create")
end

# get '/appointments/:id' do 
#     @appointment = Appointment.find(params['id'].to_i)
#     erb(:"appointments/show")
# end

get '/appointments/:id/edit' do 
    @appointment = Appointment.find(params['id'].to_i)
    @pets = Pet.find_all
    @vets = Vet.find_all
    erb(:"appointments/edit")
end

#UPDATE
post '/appointments/:id' do
    @appointment = Appointment.find(params['id'])
    @appointment.date = params['date']
    @appointment.time = params['time']
    @appointment.pet_id = params['pet_id']
    @appointment.vet_id = params['vet_id']
    @appointment.update
    redirect to '/appointments'
end

# DELETE
get '/appointments/:id/delete' do
    @appointment = Appointment.find(params['id'])
    @appointment.delete
    redirect to '/appointments'
end
