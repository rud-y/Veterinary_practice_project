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




