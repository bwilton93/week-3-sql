-- Use the database music_library for the following exercises.
-- #1 Use a JOIN query to select the id and title of all the albums from Taylor Swift.
SELECT albums.id,
      albums.title
  FROM albums
    JOIN artists
    ON albums.artist_id = artists.id
  WHERE artists.name = 'Taylor Swift';

-- #2 Use a JOIN query to find the id and title of the (only) album from Pixies released in 1988.
SELECT albums.id,
      albums.title
  FROM albums
    JOIN artists
    ON albums.artist_id = artists.id
  WHERE artists.name = 'Pixies' AND albums.release_year = 1988;

-- #3 CHALLENGE: Find the id and title of all albums from Nina Simone released after 1975.
SELECT albums.id,
      albums.title
  FROM albums
    JOIN artists
    ON albums.artist_id = artists.id
  WHERE artists.name = 'Nina Simone' AND albums.release_year > 1975;
