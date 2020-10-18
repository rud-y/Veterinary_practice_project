# Vet Management App 

A web app designed for a veterinary practice business, and is able to perform basic CRUD operations to keep track of customers, registrations, pets, treatments as well as employees of the practice. 


For the app to be running the following must be installed:
- PostgreSql
- Ruby  (we will need to install additional 'gems' in terminal:

>'gem install pg'
>'gem install sinatra'



How to Run:

First clone the project to the local machine.
In your machine terminal create database veterinary_practice:

>'create db veterinary_practice'

After that navigate to veterinary_practice directory and enter the following command to run the database and create db tables:
>'psql -d veterinary_practice -f db/vet_practice.sql'

Populate the database with some data by running:
>'ruby db/seeds.rb'

Finally run the app: 'ruby app.rb' 
Enter the generated four digit port number ('listening on port=4567') into your browser:

>'localhost:4567/home'

 and you should be able to run the app.



# Project Brief

A veterinary practice has approached you to build a web application to help them manage their animals and vets. A vet may look after many animals at a time. An animal is registered with only one vet.

#MVP
The practice wants to be able to register / track animals. Important information for the vets to know is -
• Name

• Date Of Birth (use a VARCHAR initially)

• Type of animal

• Contact details for the owner

• Treatment notes

• Be able to assign animals to vets



CRUD actions for vets / animals - remember the user - what would they want to see on each View? What Views should there be?

#Possible Extensions
• Mark owners as being registered/unregistered with the Vet. unregistered owners won't be able to add any more animals.

• If an owner has multiple animals we don't want to keep updating contact details separately for each pet. Extend your application to reflect that an owner can have many pets and to more sensibly keep track of owners' details (avoiding repetition / inconsistencies)

• Handle check-in / check-out dates

• Let the practice see all animals currently in the practice (today's date is between the check-in and check-out?)

• Sometimes an owner does not know the DOB. Allow them to enter an age instead. Try and make sure this always up to date - ie if they visit again a year from now a 3 yr old dog is now 4.

• Add extra functionality of your choosing - assigning treatments, a more comprehensive way of maintaining treatment notes over time. Appointments.

• Pricing / billing.




