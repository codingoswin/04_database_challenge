-- CREATE TABLE recipes (
--   id SERIAL PRIMARY KEY,
--   name text,
--   time int,
--   rating int
-- );


TRUNCATE TABLE recipes RESTART IDENTITY;

INSERT INTO recipes (name, time, rating) VALUES ('Fish & chips', 30, 4);
INSERT INTO recipes (name, time, rating) VALUES ('Chicken & rice', 60,5);
