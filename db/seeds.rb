require_relative('../models/vet')
require_relative('../models/pet')
require_relative('../models/customer')
require('pry-byebug')


Pet.delete_all()
Vet.delete_all()
Customer.delete_all()

vet1 = Vet.new('first_name' => 'Daniel', 'last_name' => 'Smith', 'phone_number' => '0131 222111')
vet2 = Vet.new('first_name' => 'Jean', 'last_name' => 'Foutier', 'phone_number' => '0131 333111')
vet3 = Vet.new('first_name' => 'Eckhart', 'last_name' => 'Dobson', 'phone_number' => '0131 444111')
vet4 = Vet.new('first_name' => 'Hao', 'last_name' => 'Ling', 'phone_number' => '0131 555111')
vet1.save()
vet2.save()
vet3.save()
vet4.save()

customer1 = Customer.new('first_name' => 'Norton', 'last_name' => 'Wensley', 'phone_number' => '0131 000333', 'e_mail' => 'enw@abc.com')
customer2 = Customer.new('first_name' => 'Maximus', 'last_name' => 'Trollus', 'phone_number' => '0131 000222', 'e_mail' => 'emt@def.com')
customer3 = Customer.new('first_name' => 'Martin', 'last_name' => 'Drobny', 'phone_number' => '0131 000111', 'e_mail' => 'emdee@xyz.com')
customer1.save()
customer2.save()
customer3.save()

pet1 = Pet.new({ 'name' => 'Chichi', 'date_of_birth' => 'February 2018', 'treatment_notes' => 'Take two pills a day with meals', 'vet_id' => vet4.id })
pet2 = Pet.new({ 'name' => 'Rosie', 'date_of_birth' => 'October 2019', 'treatment_notes' => 'All good', 'vet_id' => vet1.id })
pet3 = Pet.new({ 'name' => 'Dodo', 'date_of_birth' => 'August 2011', 'treatment_notes' => 'Eat a lot of bones and skins', 'vet_id' => vet2.id })
pet4 = Pet.new({ 'name' => 'Zeus', 'date_of_birth' => 'March 2016', 'treatment_notes' => 'Plenty of rest', 'vet_id' => vet3.id })
pet5 = Pet.new({ 'name' => 'Cali', 'date_of_birth' => 'April 2015', 'treatment_notes' => 'Take it easy', 'vet_id' => vet4.id })
pet1.save()
pet2.save()
pet3.save()
pet4.save()
pet5.save()


binding.pry 
nil