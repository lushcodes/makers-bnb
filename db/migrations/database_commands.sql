# PUT YOUR DATABSE QUERIES HERE, FOOLS!
#space_database
CREATE DATABASE bnb;
CREATE TABLE space (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(60), price VARCHAR(60), user_id VARCHAR(60), availability VARCHAR(60));
INSERT INTO space (name) VALUES ('Themse_side_test');
UPDATE space SET description = 'beautiful_testing_description' WHERE id ='1';
UPDATE space SET price = '33' WHERE id = '1';
UPDATE space SET user_id = '1' WHERE id = '1';
UPDATE space SET availability = 'true' WHERE id = '1';

#space_database_test
CREATE DATABASE bnb_test;
CREATE TABLE space (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(60), price VARCHAR(60), user_id VARCHAR(60), availability VARCHAR(60));
INSERT INTO space (name) VALUES ('Themse_side_test');
UPDATE space SET description = 'beautiful_testing_description' WHERE id ='1';
UPDATE space SET price = '33' WHERE id = '1';
UPDATE space SET user_id = '1' WHERE id = '1';
UPDATE space SET availability = 'true' WHERE id = '1';
