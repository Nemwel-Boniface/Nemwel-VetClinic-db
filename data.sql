/* Populate vet_clinic database with data. */

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(2, 'Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(3, 'Pikachu', '2021-01-7', 1, FALSE, 15.04);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(4. 'Devimon', '2017-5-12', 5, TRUE, 11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(5, 'Charmander', '2020-02-08', 0, FALSE, -11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(8, 'Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(9, 'Bourman', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(10, 'Blossom', '1995-10-13', 3, TRUE, 17);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(11, 'Bitto', '2022-05-14', 4, TRUE, 22);

-- Update insert data into the owners table
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);

-- Update insert data into the species table
INSERT INTO species(name) Values('Pokemon');
INSERT INTO species(name) Values('Digimon');

-- Modify your inserted animals so it includes the species_id value:
-- Start the transaction for modifying the species_id column in animals table
BEGIN;

-- If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

-- All other animals are Pokemon
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

-- Update commit the transaction to make sure it persists
COMMIT;