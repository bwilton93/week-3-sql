-- # 1

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

-- # 2
-- We added an alias for artists.id using the "AS" keyword.

SELECT albums.id,
       albums.title,
       artists.id AS artist_id,
       artists.name
  FROM albums
    JOIN artists
    ON artists.id = albums.artist_id;

--  id |        title         | artist_id |     name     
-- ----+----------------------+-----------+--------------
--   1 | Doolittle            |         1 | Pixies
--   2 | Surfer Rosa          |         1 | Pixies
--   3 | Waterloo             |         2 | ABBA
--   4 | Super Trouper        |         2 | ABBA
--   5 | Bossanova            |         1 | Pixies
--   6 | Lover                |         3 | Taylor Swift
--   7 | Folklore             |         3 | Taylor Swift
--   8 | I Put a Spell on You |         4 | Nina Simone
--   9 | Baltimore            |         4 | Nina Simone

-- # 3
-- Find the album ID, artist ID, album title and artist name
-- of all the albums.

SELECT albums.id AS album_id,
       artists.id AS artist_id,
       albums.title,
       artists.name
  FROM artists
    JOIN albums
    ON albums.artist_id = artists.id;

--  id | artist_id |         title        |     name     
-- ----+-----------+----------------------+--------------
--   1 |	   1	   |       Doolittle	    |     Pixies
--   2 |	   1	   |       Surfer Rosa    |  	  Pixies
--   3 |	   2	   |        Waterloo	    |     ABBA
--   4 |	   2	   |      Super Trouper   |      ABBA
--   5 |     1	   |        Bossanova     |     Pixies
--   6 |     3	   |          Lover	      |  Taylor Swift
--   7 |	   3	   |        Folklore	    |  Taylor Swift
--   8 |     4	   | I Put a Spell on You |	 Nina Simone
--   9 |	   4	   |       Baltimore	    |  Nina Simone
--  10 |	   4	   |   Here Comes the Sun |	 Nina Simone
--  11 |	   4     |	 Fodder on My Wings |	 Nina Simone
--  12 |	   5     |	     Mezzanine	    | Massive Attack
--  13 |	   6	   |    Nonagon Infinity	| King Gizzard and the Lizard Wizard

-- Find the album ID, artist ID, album title and artist name
-- of all the albums
-- where the associated artist is ABBA.
--
-- (in other words, only albums by ABBA).
SELECT albums.id AS album_id,
       artists.id AS artist_id,
       albums.title,
       artists.name
  FROM artists
    JOIN albums
    ON albums.artist_id = artists.id
  WHERE artists.name = 'ABBA';