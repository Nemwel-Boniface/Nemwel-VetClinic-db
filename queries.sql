/*Queries that provide answers to the questions from all projects.*/

-- Select all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';

-- Select all from animals table which are neutered
SELECT * FROM animals WHERE neutered = TRUE;

-- Select all animals whose name is not Gabumon
SELECT * FROM animals WHERE name != 'Gabumon';
