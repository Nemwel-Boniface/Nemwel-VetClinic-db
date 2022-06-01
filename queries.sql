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