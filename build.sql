DROP DATABASE IF EXISTS helpYourNeighbour;
CREATE DATABASE helpYourNeighbour;

CREATE TABLE IF NOT EXISTS PEOPLE(
    people_id SERIAL PRIMARY KEY,
    firstname VARCHAR(32) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    password TEXT NOT NULL,
    email VARCHAR(320) NOT NULL,
    backup_email VARCHAR(320) NOT NULL
);

CREATE TABLE IF NOT EXISTS Address (
    address_id SERIAL PRIMARY KEY,
    fk_people_id INTEGER,
    number INTEGER,
    street VARCHAR(500),
    postal_code VARCHAR(10),
    city VARCHAR(64),
    date DATE,
    FOREIGN KEY(fk_people_id) REFERENCES PEOPLE(people_id)
    ON DELETE CASCADE
);