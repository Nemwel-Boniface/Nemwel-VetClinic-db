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