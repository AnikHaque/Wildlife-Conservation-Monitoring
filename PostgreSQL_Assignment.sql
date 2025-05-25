-- Active: 1747575604060@@127.0.0.1@5432@assignment_2

CREATE DATABASE assignment_2;

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR (100) NOT NULL
);

INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'), 
('Bob White', 'River Delta'), 
('Carol King', 'Mountain Range');

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL, 
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE NOT NULL, 
    conservation_status VARCHAR(20) NOT NULL
)

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL,
    species_id INT NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR (200) NOT NULL,
    notes TEXT,

    Foreign Key (ranger_id) REFERENCES rangers(ranger_id),
    Foreign Key (species_id) REFERENCES species(species_id)
);

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

--  1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region) VALUES('Derek Fox', 'Coastal Plains')
