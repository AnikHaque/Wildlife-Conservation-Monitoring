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