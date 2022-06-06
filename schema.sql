/* Database schema to keep the structure of entire database. */

CREATE TABLE IF NOT EXISTS animals (
    id INT,
    name VARCHAR(80),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg NUMERIC
);

-- Update made the id column not null
ALTER TABLE animals ALTER COLUMN id SET NOT NULL;

-- Update made the id column the primary key for the table
ALTER TABLE animals ADD PRIMARY KEY(id);

-- Update made the id of animals table be auto incremented
ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

--Update Add a column species of type string to your animals table.
ALTER TABLE animals ADD COLUMN species VARCHAR(80);

-- Day 3 query multiple table day
-- Update drop table to make sure it does not exist
DROP TABLE IF EXISTS owners;

-- Update create the owners table now
CREATE TABLE IF NOT EXISTS owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY(id)
);

-- Update drop table to make sure it does not exist
DROP TABLE IF EXISTS species;

-- Update create species table
CREATE TABLE IF NOT EXISTS species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(40),
    PRIMARY KEY(id)
);

-- Update remove the species column from the animals table
ALTER TABLE animals DROP COLUMN species CASCADE;

-- Update started the transaction for creating specied_id column to table
BEGIN;

-- Update Add column species_id to animals table
ALTER TABLE animals ADD COLUMN species_id INT;

-- Update made the species_id column a foreign key referencing species table
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);

-- Update commited changes after making sure everything is fine
COMMIT;

-- Update started the transaction for creating owner_id column to table
BEGIN;

-- Update add a column called owber_id to animals table
ALTER TABLE animals ADD COLUMN owner_id INT;

-- Update made the owner_id a foreign key referencing the owners table
ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES owners(id);

-- Update commited changes after making sure everything is fine
COMMIT;

-- DAY 4 Week 1 challenges
-- Update create table called vets
-- Start the trsnsaction
BEGIN;

-- Update create the table vets with 4 columns
CREATE TABLE IF NOT EXISTS vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

-- Update commit to make sure transaction persists
COMMIT;

-- Update created the specialization table to satisfy many to many relationship
-- Update start transaction for specialization table
BEGIN;

-- Update create the specialization table with two columns and foreign key constraints
CREATE TABLE IF NOT EXISTS specializations(
    species_id INT,
    vet_id INT,
    PRIMARY KEY(species_id, vet_id),
    CONSTRAINT species_id_fk FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT vet_id_fk FOREIGN KEY(vet_id) REFERENCES vets(id)
);

-- Update commit transaction to make sure it persists
COMMIT;

-- Update create the visits table that has three columns and has two foreign keys
-- Update start the transaction
BEGIN;

-- Update create the visists table
CREATE TABLE IF NOT EXISTS visits(
    animals_id INT,
    vets_id INT,
    date_of_visit DATE,
    PRIMARY KEY(animals_id, vets_id, date_of_visit),
    CONSTRAINT animal_id_fk FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT vet_id_fk FOREIGN KEY(vets_id) REFERENCES vets(id)
);

-- Update commit the transaction to make sure it persists
COMMIT;

-- Update added emails column to owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
