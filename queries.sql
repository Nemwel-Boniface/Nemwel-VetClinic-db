/*Queries that provide answers to the questions from all projects.*/

-- Select all from animals table which are neutered
SELECT * FROM animals WHERE neutered = TRUE;

-- Select all animals whose name is not Gabumon
SELECT * FROM animals WHERE name != 'Gabumon';
