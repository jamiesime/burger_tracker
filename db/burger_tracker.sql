DROP TABLE IF EXISTS applydeal;
DROP TABLE IF EXISTS burgers;
DROP TABLE IF EXISTS eateries;
DROP TABLE IF EXISTS days;
DROP TABLE IF EXISTS deals;


CREATE TABLE eateries (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE days (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE deals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  deal_type VARCHAR(255)
);

CREATE TABLE burgers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  price INT8,
  eatery_id INT8 REFERENCES eateries(id) ON DELETE CASCADE,
  veg VARCHAR(255),
  spice VARCHAR(255)
);

CREATE TABLE applydeal (
  id SERIAL8 PRIMARY KEY,
  burger_id INT8 REFERENCES burgers(id) ON DELETE CASCADE,
  deal_id INT8 REFERENCES deals(id) ON DELETE CASCADE,
  day_id INT8 REFERENCES days(id) ON DELETE CASCADE,
  eatery_id INT8 REFERENCES eateries(id) ON DELETE CASCADE
);
