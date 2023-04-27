-- Use the database music_library for the following exercises.
-- #1 Use a JOIN query to select the id and title of all the albums from Taylor Swift.
SELECT albums.id,
      albums.title
  FROM albums
    JOIN artists
    ON albums.artist_id = artists.id
  WHERE artists.name = 'Taylor Swift';

