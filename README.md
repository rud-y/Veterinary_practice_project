# Veterinary Practice project 

The Edivet Veterinary Practice  is a vet practice app that is designed to be used by a receptionist employee at the vet practice. 


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

>'localhost:4567/'

 and you should be able to run the app.




