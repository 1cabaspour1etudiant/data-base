DROP DATABASE IF EXISTS helpYourNeighbour;
CREATE DATABASE helpYourNeighbour;

use helpYourNeighbour;

CREATE TABLE User(
    user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(32) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    password TEXT NOT NULL,
    email VARCHAR(320) NOT NULL,
    backup_email VARCHAR(320) NOT NULL
);

CREATE TABLE Address(
    address_id SERIAL PRIMARY KEY,
    fk_user_id INTEGER,
    number INTEGER,
    street VARCHAR(500),
    postal_code VARCHAR(10),
    city VARCHAR(64),
    date DATE,
    FOREIGN KEY(fk_user_id) REFERENCES User(user_id)
    ON DELETE CASCADE
);
