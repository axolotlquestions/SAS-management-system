DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  breed VARCHAR(255),
  adoptable BOOLEAN,
  admission_date DATE
);

CREATE TABLE owners (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE adoptions (
  id SERIAL4 PRIMARY KEY,
  animal_id INT4 REFERENCES animals(id) ON DELETE CASCADE,
  owner_id INT4 REFERENCES owners(id) ON DELETE CASCADE
);
