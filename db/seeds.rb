require_relative('../models/vet')
require('pry-byebug')

Vet.delete_all()

vet1 = Vet.new('first_name' => 'Daniel', 'last_name' => 'Smith', 'phone_number' => '0131 222111')
vet2 = Vet.new('first_name' => 'Jean', 'last_name' => 'Foutier', 'phone_number' => '0131 333111')
vet3 = Vet.new('first_name' => 'Eckhart', 'last_name' => 'Dobson', 'phone_number' => '0131 444111')
vet4 = Vet.new('first_name' => 'Hao', 'last_name' => 'Ling', 'phone_number' => '0131 555111')
vet1.save()
vet2.save()
vet3.save()
vet4.save()



binding.pry 
nil