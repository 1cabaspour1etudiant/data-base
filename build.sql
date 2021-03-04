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

CREATE TABLE Appointment(
    appointment_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    date Date
);

CREATE TABLE Address(
    address_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    fk_user_id INTEGER,
    fk_appointment_id INTEGER,
    number INTEGER,
    street VARCHAR(500),
    postal_code VARCHAR(10),
    city VARCHAR(64),
    date DATE,
    FOREIGN KEY(fk_user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY(fk_appointment_id) REFERENCES Appointment(appointment_id) ON DELETE CASCADE,
    CONSTRAINT CHECK(fk_user_id != NULL || fk_appointment_id != NULL)
);

CREATE TABLE Sponsorship(
    sponsorship_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    fk_user_sponsored_id INTEGER,
    fk_user_sponsor_id INTEGER,
    date Date,
    FOREIGN KEY(fk_user_sponsored_id) REFERENCES User(user_id),
    FOREIGN KEY(fk_user_sponsor_id) REFERENCES User(user_id)
);

CREATE TABLE Message(
    message_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    fk_user_receiver_id INTEGER,
    fk_user_sender_id INTEGER,
    content Text,
    date Date,
    FOREIGN KEY(fk_user_receiver_id) REFERENCES User(user_id),
    FOREIGN KEY(fk_user_sender_id) REFERENCES User(user_id)
);

CREATE TABLE Location(
    location_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    fk_user_id INTEGER,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    date Date,
    FOREIGN KEY(fk_user_id) REFERENCES User(user_id) ON DELETE CASCADE
);
