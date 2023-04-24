DROP TABLE IF EXISTS albums, artists;

CREATE TABLE albums(
    "id" serial, 
    "title" text, 
    "release_year" int4,
    "artist_id" int4,
    PRIMARY KEY ("id")
    );

CREATE TABLE artists(
    "id" serial,
    "name" text,
    "genre" text,
    PRIMARY KEY ("id")
    );

TRUNCATE TABLE albums RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY; 

INSERT INTO artists (name, genre) VALUES
('Artist 1', 'Genre'),
('Artist 2', 'Genre');

INSERT INTO albums (title, release_year, artist_id) VALUES 
('Album 1', 2022, 1),
('Album 2', 2023, 2);
