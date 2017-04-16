-- SQL Assignment
-- Check out [W3Schools' SQL Reference](http://www.w3schools.com/sql/sql_syntax.asp) as a reference.

-- Provide one or more SQL queries that retrieve the requested data
-- below each of the following questions:

-- 1) Find the albums recorded by the artist Queen.

SELECT id
FROM artists
WHERE name='Queen'; --returns '51'

SELECT *
FROM albums
WHERE artist_id=51;

--in one command:
SELECT *
FROM albums
WHERE artist_id=(SELECT id FROM artists WHERE name='Queen')


-- 2) [Count](http://www.w3schools.com/sql/sql_func_count.asp) how many tracks belong to the media type "Protected MPEG-4 video file".

SELECT COUNT(*)
FROM tracks
WHERE media_type_id=(SELECT id FROM media_types WHERE name='Protected MPEG-4 video file');


-- 3) Find the least expensive track that has the genre "Electronica/Dance".

SELECT name, unit_price
FROM tracks
WHERE genre_id=(SELECT id FROM genres WHERE name='Electronica/Dance') ORDER BY unit_price ASC LIMIT 1;

-- 4) Find the all the artists whose names start with A.

SELECT *
FROM artists
WHERE name
LIKE 'A%';

-- 5) Find all the tracks that belong to playlist 1.

SELECT name
FROM tracks
WHERE id
IN (SELECT track_id FROM playlists_tracks WHERE playlists_tracks.playlist_id=1);
