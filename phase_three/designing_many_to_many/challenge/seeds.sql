DROP TABLE IF EXISTS movies, cinemas, movies_cinemas_join;

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title text,
  release_date date
);

CREATE TABLE cinemas (
  id SERIAL PRIMARY KEY,
  city_name text
);

CREATE TABLE movies_cinemas_join (
  movie_id int,
  cinema_id int
);