-- 1. количество исполнителей в каждом жанре;
SELECT  name artist, COUNT(mg.genre_id) 
  FROM musical_genres mg 
  JOIN artists_genres ag ON ag.genre_id = mg.genre_id
 GROUP BY artist;

-- 2. количество треков, вошедших в альбомы 2019-2020 годов;
SELECT  a.name album, COUNT(mt.name) traks_quantity 
  FROM albums a
  JOIN music_tracks mt ON a.album_id = mt.album_id
 WHERE release_year BETWEEN 2019 AND 2020
 GROUP BY album;

-- 3. средняя продолжительность треков по каждому альбому;
SELECT a.name, AVG(mt.length) seconds
  FROM albums a 
  JOIN music_tracks mt ON a.album_id = mt.album_id
 GROUP BY a.name;

-- 4. все исполнители, которые не выпустили альбомы в 2020 году;
SELECT DISTINCT ma.name not_2020
  FROM music_artists ma
  JOIN artists_albums aa ON ma.artist_id = aa.artist_id
  JOIN albums a ON aa.album_id = a.album_id
 WHERE ma.name NOT IN (SELECT ma.name
	  FROM music_artists ma
	  JOIN artists_albums aa ON ma.artist_id = aa.artist_id
	  JOIN albums a on aa.album_id = a.album_id
	 WHERE a.release_year = 2020);
 
-- 5. названия сборников, в которых присутствует конкретный исполнитель (Rummstein);
SELECT mc.name colletction, ma.name artist
  FROM music_artists ma 
  JOIN artists_albums aa ON ma.artist_id = aa.artist_id 
  JOIN albums a on aa.album_id = a.album_id 
  JOIN music_tracks mt ON a.album_id = mt.album_id
  JOIN tracks_collections tc ON mt.id = tc.track_id 
  JOIN music_collections mc ON tc.collection_id = mc.id
 WHERE ma.name = 'Rummstein';

-- 6. название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT a.name album, COUNT(*) genres_of_artist
  FROM albums a
  JOIN artists_albums aa ON a.album_id = aa.album_id 
  JOIN music_artists ma ON aa.artist_id = ma.artist_id 
  JOIN artists_genres ag ON ma.artist_id = ag.artist_id
 GROUP BY album
HAVING COUNT(*) > 1;

-- 7. наименование треков, которые не входят в сборники;
SELECT mt.name not_in_collections
  FROM music_tracks mt
  FULL JOIN tracks_collections tc on mt.id = tc.track_id
 WHERE track_id IS NULL;

-- 8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT ma.name shortest_track, length seconds
  FROM music_artists ma 
  JOIN artists_albums aa ON ma.artist_id = aa.artist_id 
  JOIN albums a ON aa.album_id = a.album_id 
  JOIN music_tracks mt ON a.album_id = mt.album_id
 WHERE length = (SELECT MIN(length) FROM music_tracks);

-- 9. название альбомов, содержащих наименьшее количество треков.
SELECT a.name album, count(mt.name) the_least_num 
FROM albums a 
JOIN music_tracks mt ON a.album_id = mt.album_id 
GROUP BY album
HAVING count(mt.name) = (SELECT COUNT(*) tracks_num
			               FROM music_tracks mt 
						   JOIN albums a ON mt.album_id = a.album_id
						  GROUP BY a.name
						  ORDER BY tracks_num
			              LIMIT 1);	
			              