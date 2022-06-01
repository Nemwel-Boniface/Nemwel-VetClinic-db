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

-- Update Add column species_id to animals table
ALTER TABLE animals ADD COLUMN species_id INT;

-- Update made the species_id column a foreign key referencing species table
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);