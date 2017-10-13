DROP TABLE IF EXISTS deals;
DROP TABLE IF EXISTS burgers;
DROP TABLE IF EXISTS eateries;
DROP TABLE IF EXISTS days;


CREATE TABLE eateries (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE days (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE burgers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  price INT8,
  eatery_id INT8 REFERENCES eateries(id)
);

CREATE TABLE deals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  burger_id INT8 REFERENCES burgers(id),
  eatery_id INT8 REFERENCES eateries(id),
  day_id INT8 REFERENCES days(id)
);
