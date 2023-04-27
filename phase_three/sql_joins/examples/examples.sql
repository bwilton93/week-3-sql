SELECT albums.id,
      albums.title,
      artists.id,
      artists.name
  FROM albums
    JOIN artists
    ON artists.id = albums.artist_id;

--  id |        title         | id |     name     
-- ----+----------------------+----+--------------
--   1 | Doolittle            |  1 | Pixies
--   2 | Surfer Rosa          |  1 | Pixies
--   3 | Waterloo             |  2 | ABBA
--   4 | Super Trouper        |  2 | ABBA
--   5 | Bossanova            |  1 | Pixies
--   6 | Lover                |  3 | Taylor Swift
--   7 | Folklore             |  3 | Taylor Swift
--   8 | I Put a Spell on You |  4 | Nina Simone
--   9 | Baltimore            |  4 | Nina Simone

