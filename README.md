# Veterinary Pracice project #

The Edivet Veterinary Practice  is a vet practice app that is designed to be used by a receptionist employee at the vet practice. 


For the app to be running the following must be installed:
	○ PostgreSql 
	○ Ruby  (we will need to install additional 'gems' in terminal:
		▪ 'gem install pg'
		▪ 'gem install sinatra'



How to Run:

First clone the project to the local machine.
In your machine terminal create database veterinary_practice by typing:
'create db veterinary_practice'

After that navigate to veterinary_practice directory and enter the following command to run the database and create db tables:
'psql -d veterinary_practice -f db/vet_practice.sql'

Populate the database with some data by running:
'ruby db/seeds.rb'

Finally run the app: 'ruby app.rb' 
This will generate a four digit port number, for example:
'listening on port=4567'.

Enter 'localhost:4567/' in your browser and you should be able to run the app.



Brief information can be found here: (https://github.com/codeclan/e41_classnotes/blob/master/week_04/projects/briefs/Vet_Management.md)

