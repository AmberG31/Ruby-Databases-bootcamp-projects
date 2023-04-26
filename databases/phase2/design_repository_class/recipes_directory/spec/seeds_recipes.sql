TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, cooking_time, raiting) VALUES ('Stake', '10', '4');
INSERT INTO recipes (name, cooking_time, raiting) VALUES ('Soup', '30', '4.5');

-- psql -h 127.0.0.1 recipes_directory_test < seeds_recipes.sql
