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

--  1. Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region) VALUES('Derek Fox', 'Coastal Plains')

--  2.  Count unique species ever sighted.
SELECT  count(DISTINCT species_id) FROM sightings;

-- 3. Find all sightings where the location includes "Pass".
SELECT * FROM sightings WHERE location ILIKE '%Pass%'


-- 4. List each ranger's name and their total number of sightings.
SELECT name, count(*) FROM sightings s
    INNER JOIN rangers r on s.ranger_id = r.ranger_id
        GROUP BY name

-- 5. List species that have never been sighted.
SELECT common_name FROM sightings 
    RIGHT JOIN species ON sightings.species_id = species.species_id
        WHERE sightings.sighting_id IS NULL;

-- 6. Show the most recent 2 sightings.
SELECT common_name, sighting_time, name FROM sightings 
    JOIN species ON sightings.species_id = species.species_id
        JOIN rangers ON sightings.ranger_id = rangers.ranger_id
            ORDER BY sightings.sighting_time DESC
                LIMIT 2;


-- 7. Update all species discovered before year 1800 to have status 'Historic'.
UPDATE  species set conservation_status ='Historic' WHERE  extract(year FROM discovery_date) < 1800;


/*
8. Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.

Morning: before 12 PM
Afternoon: 12 PM–5 PM
Evening: after 5 PM
*/
SELECT 
  sighting_id,
  CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;


-- 9. Delete rangers who have never sighted any species
DELETE FROM rangers 
    WHERE ranger_id not in (
            SELECT DISTINCT ranger_id FROM sightings 
            WHERE sighting_id is not NULL
            );
