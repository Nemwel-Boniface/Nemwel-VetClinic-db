/*Queries that provide answers to the questions from all projects.*/

-- Select all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

-- Select all from animals table which are neutered
SELECT * FROM animals WHERE neutered = TRUE;

-- Select all animals whose name is not Gabumon
SELECT * FROM animals WHERE name != 'Gabumon';
