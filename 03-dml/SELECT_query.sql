--название и год выхода альбомов, вышедших в 2018 году:
select name, release_year from albums
where release_year = 2018;

--название и продолжительность самого длительного трека:
select name, length from music_tracks
order by length desc limit 1;

--название треков, продолжительность которых не менее 3,5 минуты (210 секунд);
select name from music_tracks
where length >= 210;

--названия сборников, вышедших в период с 2018 по 2020 год включительно;
select name from music_collections
where release_year between 2018 and 2020;

--исполнители, чье имя состоит из 1 слова;
select name from music_artists
where name not like '% %';

--название треков, которые содержат слово "мой"/"my".
select name from music_tracks
where name like '% мой %'or name like '% my %' or name like '% Мой %' or name like '% My %' or name like '% мой'or name like '% my' or name like 'Мой %' or name like 'My %';
