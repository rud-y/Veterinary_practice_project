DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS vets;
DROP TABLE IF EXISTS customers;


CREATE TABLE vets(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number VARCHAR(255),
    e_mail VARCHAR (255)
);

CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number VARCHAR(255),
    e_mail VARCHAR(255),
    registered BOOLEAN 
);

CREATE TABLE pets(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    date_of_birth VARCHAR(255),
    treatment_notes VARCHAR(255),
    vet_id INT REFERENCES vets(id) ON DELETE CASCADE,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE
);

CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    date DATE,
    time TIME,
    pet_id INT REFERENCES pets(id) ON DELETE CASCADE,
    vet_id INT REFERENCES vets(id) ON DELETE CASCADE
);