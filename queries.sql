/*Queries that provide answers to the questions from all projects.*/

-- Select all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

-- List date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals  WHERE weight_kg > 10.5;

-- Select all from animals table which are neutered
SELECT * FROM animals WHERE neutered = TRUE;

-- Select all animals whose name is not Gabumon
SELECT * FROM animals WHERE name != 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Update begin of transaction to the species column\
-- Begin of the transaction
BEGIN;

-- Update set the secies column values to unspecified
UPDATE animals SET species = 'unspecified';

-- Update confirm if changes made reflect in the database
SELECT * FROM animals;

-- Update rollback to undo the changes that have been made to the species column
ROLLBACK;

-- Update confirmation that the rollback was succesfull and no 'unspecified' text is in any row in species column
SELECT * FROM animals;

-- Update populate the species column now
-- Start of the transaction
BEGIN;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';

-- Update commit the changes to make sure they persists after the transaction
COMMIT;

-- DELETE all records and rollback in a transaction
-- Start of the transaction
BEGIN;

-- Delete the records
DELETE FROM animals;

-- Confirm all animals were deleted
SELECT * FROM animals;

-- Rollback
ROLLBACK;

-- Confirm all the information that was deleted is still present
SELECT * FROM animals;

-- Queries for third transaction
-- Start of the transaction
BEGIN;

-- Update delete all animals born after January 01 2022
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Update create a savepoint for the transaction
SAVEPOINT savePoint;

-- Update multiplied all animals weight to their weight times -1
UPDATE animals SET weight_kg = weight_kg * -1;

-- Update ROLLBACK TO savePoint
ROLLBACK TO savePoint;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- Update commit transaction
COMMIT;

-- Update queries with aggregate functions with GROUP BY clause
-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

-- Write queries (using JOIN) to answer the following questions:
-- What animals belong to Melody Pond?
SELECT name, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 4;

-- Update List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE animals.species_id = 1;

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners FULL OUTER JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species
SELECT COUNT(species_id), (species.name)  FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- Update List all Digimon owned by Jennifer Orwell.
SELECT (animals.name) AS animalName, (species.name) AS speciesName, full_name FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.id = 2 AND owner_id = 2;

-- Update List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name, full_name FROM animals
FULL OUTER JOIN owners ON animals.owner_id = owners.id
WHERE escape_attempts = 0 AND owner_id = 5;

-- Who owns the most animals?
SELECT full_name, COUNT(owner_id) AS Total_animals FROM owners
JOIN animals ON  owners.id = animals.owner_id
GROUP BY full_name
ORDER BY COUNT(name) DESC;

-- Update Day 4 week 1 queries
-- Update who was the last animal seen by William Tatcher
SELECT (animals.name) AS animalName, (vets.name) AS vetsName, (visits.date_of_visit) AS dateVisited
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets_id = 1
ORDER BY (visits.date_of_visit) DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT visits.animals_id) AS Different_animals_seen, (vets.name) AS vets_name
FROM visits
JOIN vets ON visits.vets_id = vets.id
WHERE vets.id = 3
GROUP BY vets.name;

-- uPDATE List all vets and their specialties, including vets with no specialties.
SELECT (vets.name) as vets_name, (species.name) as vets_speciality
FROM vets
FULL OUTER JOIN specializations ON vets.id = specializations.vet_id
FULL OUTER JOIN species ON species.id = specializations.species_id;

-- Update list all animals that visited Stephanie Mendez between April 1st and August 30th, 2020
SELECT (animals.name) AS animals_visited_Stephanie
FROM animals
FULL OUTER JOIN visits ON animals.id = visits.animals_id
FULL OUTER JOIN vets ON vets.id = visits.vets_id
WHERE vets.id = 3 AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT (animals.name) AS animals_name, COUNT(visits.animals_id) AS number_of_visits
FROM animals
FULL OUTER JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY COUNT(visits.animals_id) DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT (animals.name) AS animalName, (vets.name) AS vetsName, (visits.date_of_visit) AS dateVisited
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets_id = 2
ORDER BY (visits.date_of_visit)
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit
SELECT (animals.name) AS animal_information, (vets.name) AS vet_information, (visits.date_of_visit) AS date_of_Visit
FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY (visits.date_of_visit) DESC;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name AS vetsName, COUNT(vets.name) AS timesVisited FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN visits ON visits.vets_id = specializations.vet_id
WHERE specializations.species_id IS NULL
GROUP BY vets.name, specializations.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most
SELECT (species.name) AS speciesName, COUNT(species.id)
FROM animals
FULL OUTER JOIN species ON animals.species_id = species.id
JOIN visits ON animals.id = visits.animals_id
WHERE visits.vets_id = 2
GROUP BY species.name
ORDER BY COUNT DESC
LIMIT 1;

-- Use Explain Analyse to monitor query speed of finding specific animal with id 4
EXPLAIN ANALYSE SELECT COUNT(*) FROM visits where animals_id = 4;

-- Use Explain Analyse to monitor query speed of finding an email address in owners table
EXPLAIN ANALYSE SELECT * FROM owners where email = 'owner_18327@mail.com';

--  Use Explain Analyse to monitor query speed of finding the vets id in vets table
EXPLAIN ANALYSE SELECT * FROM visits where vets_id = 2;