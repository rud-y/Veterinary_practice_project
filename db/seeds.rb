require_relative('../models/appointment')
require_relative('../models/vet')
require_relative('../models/pet')
require_relative('../models/customer')
require('pry-byebug')
require('date')



Appointment.delete_all()
Pet.delete_all()
Vet.delete_all()
Customer.delete_all()

vet1 = Vet.new({'first_name' => 'Daniel', 'last_name' => 'Smith', 'phone_number' => '0131 222111', 'e_mail' => 'smith@aol.com'})
vet2 = Vet.new({'first_name' => 'Jean', 'last_name' => 'Foutier', 'phone_number' => '0131 333111', 'e_mail' => 'jef@gmail.com'})
vet3 = Vet.new({'first_name' => 'Suzanne', 'last_name' => 'Dobson', 'phone_number' => '0131 444111', 'e_mail' => 'suz@aol.com'})
vet4 = Vet.new({'first_name' => 'Hao', 'last_name' => 'Ling', 'phone_number' => '0131 555111', 'e_mail' => 'hling@yahoo.com'})
vet1.save()
vet2.save()
vet3.save()
vet4.save()

customer1 = Customer.new({'first_name' => 'Norton', 'last_name' => 'Wensley', 'phone_number' => '0131 000333', 'e_mail' => 'enw@abc.com'})
customer2 = Customer.new({'first_name' => 'Maximus', 'last_name' => 'Trollus', 'phone_number' => '0131 000222', 'e_mail' => 'emt@def.com'})
customer3 = Customer.new({'first_name' => 'Clara', 'last_name' => 'Findlay', 'phone_number' => '0131 000111', 'e_mail' => 'emdee@xyz.com'})
customer1.save()
customer2.save()
customer3.save()

pet1 = Pet.new({ 'name' => 'Chichi', 'type' => 'cat', 'date_of_birth' => '10/11/2018', 'customer_id' => customer3.id, 'vet_id' => vet4.id, 'treatment_notes' => 'Trimming'})
pet2 = Pet.new({ 'name' => 'Rosie',  'type' => 'dog', 'date_of_birth' => '20/10/2019', 'customer_id' => customer2.id, 'vet_id' => vet1.id, 'treatment_notes' => 'Special supplements'})
pet3 = Pet.new({ 'name' => 'Dodo',  'type' => 'parrot', 'date_of_birth' => '30/12/2011', 'customer_id' => customer3.id, 'vet_id' => vet1.id, 'treatment_notes' => 'Digestion pills'})
pet4 = Pet.new({ 'name' => 'Zeus',  'type' => 'dog', 'date_of_birth' => '13/03/2016', 'customer_id' => customer1.id, 'vet_id' => vet3.id, 'treatment_notes' => 'Trimming'})
pet5 = Pet.new({
    'name' => 'Cali',
    'type' => 'mouse',
    'date_of_birth' => '16/10/2015',
    'customer_id' => customer3.id,
    'vet_id' => vet3.id,
    'treatment_notes' => '-'})
pet1.save()
pet2.save()
pet3.save()
pet4.save()
pet5.save()



appointment1 = Appointment.new({
'date' => Date.new(2020, 10, 31),
'time' => Time.new(2020, 10, 31, 10,30,00),
'pet_id' => pet1.id,
'vet_id' => vet3.id
})
appointment1.save()

appointment2 = Appointment.new({
'date' => Date.new(2020, 11, 15),
'time' => Time.new(2020, 11, 15, 11, 00, 00),
'pet_id' => pet2.id,
'vet_id' => vet3.id
})
appointment2.save()



binding.pry 
nil