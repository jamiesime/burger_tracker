DROP TABLE IF EXISTS eateries;
DROP TABLE IF EXISTS days;
DROP TABLE IF EXISTS burgers;
DROP TABLE IF EXISTS deals;


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
  eatery INT8 REFERENCES eateries(id)
);

CREATE TABLE deals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  burger INT8 REFERENCES burgers(id)
  eateries INT8 REFERENCES eateries(id)
  days INT8 REFERENCES days(id)
);
