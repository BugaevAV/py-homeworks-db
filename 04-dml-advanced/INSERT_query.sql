-- Исполнители/треки/сборники:
insert into music_artists(name) 
values('Schiller');

insert into music_tracks(name, length, album_id)
values('In between', 285, 2);

insert into music_tracks(name, length, album_id)
values('Midnight in Shiraz', 230, 1);

insert into music_collections(name, release_year)
values('Flora Lounge Tunes by Smooth Deluxe, Vol. 2', 2021); -- in between

insert into music_artists(name) 
values('КИНО');

insert into music_tracks(name, length, album_id)
values('Пачка сигарет', 268, 6);

insert into music_tracks(name, length, album_id)
values('Война', 240, 8);

insert into music_collections(name, release_year) --Пачка сигарет
values('Вечные хиты', 2022);

insert into music_artists(name) 
values('Скриптонит');

insert into music_tracks(name, length, album_id)
values('Потом и кровью', 241, 9);

insert into music_tracks(name, length, album_id)
values('Туда-обратно', 181, 10);

insert into music_collections(name, release_year) --Туда-обратно
values('Кара-тэ 10 лет спустя', 2014);

insert into music_artists(name) 
values('Zivert');

insert into music_tracks(name, length, album_id)
values('Зелёные волны', 223, 12);

insert into music_tracks(name, length, album_id)
values('Рокки', 177, 11);

insert into music_collections(name, release_year) --Зелёные волны
values('В сердечке', 2022);

insert into music_artists(name) 
values('Mujuice');

insert into music_tracks(name, length, album_id)
values('Underdogs', 140, 14);

insert into music_tracks(name, length, album_id)
values('Control', 337, 16);

insert into music_collections(name, release_year) --Underdogs
values('Для созерцания бренного мира', 2017);

insert into music_artists(name) 
values('The Retuses');

insert into music_tracks(name, length, album_id)
values('Loop', 102, 17);

insert into music_tracks(name, length, album_id)
values('Sagitta', 197, 18);

insert into music_collections(name, release_year) --Loop
values('Lunapark', 2012);

insert into music_artists(name) 
values('Буерак');

insert into music_tracks(name, length, album_id)
values('Я танцую сам с собой', 167, 21);

insert into music_tracks(name, length, album_id)
values('Случайность', 230, 20);

insert into music_artists(name) 
values('Rummstein');

insert into music_tracks(name, length, album_id)
values('DEUTSCHLAND', 322, 22);

insert into music_tracks(name, length, album_id)
values('Keine Lust', 222, 24);

insert into music_collections(name, release_year) --Keine Lust
values('«Нимфоманка: Часть 1» саундтрек к фильму', 2014);

insert into music_artists 
values(9,'Дельфин');

insert into music_tracks(name, length, album_id)
values('ЛЕТО', 230, 25);

insert into music_tracks(name, length, album_id)
values('660', 230, 26);

insert into music_collections(name, release_year) -- 660
values('Hip-Hop Info #6', 2019);

insert into music_artists 
values(10,'Armand Van Helden');

insert into music_tracks(name, length, album_id)
values('My My My', 186, 27);


-- Жанры:
insert into musical_genres(name)
values('Рэп');

insert into musical_genres(name)
values('Рок');

insert into musical_genres(name)
values('Поп');

insert into musical_genres(name)
values('Электронная музыка');

insert into musical_genres(name)
values('Индастриал-метал');

insert into musical_genres(name)
values('Инди-фолк');

insert into musical_genres(name)
values('Инди-рок');


-- Альбомы:
insert into albums(name, release_year) --Schiller
values('Epic', 2021);

insert into albums(name, release_year) --Schiller
values('Morgenstund', 2019);

insert into albums(name, release_year) --Schiller
values('Future', 2016);

insert into albums(name, release_year) --Schiller
values('Opus', 2014);

insert into albums(name, release_year) --КИНО
values('Лето(Песня для Цоя)', 2018);

insert into albums(name, release_year) --КИНО
values('Легенда', 2018);

insert into albums(name, release_year) --КИНО
values('Черный альбом', 1990);

insert into albums(name, release_year) --КИНО
values('Последний герой', 1989);

insert into albums(name, release_year) --Скриптонит
values('Плохие привычки', 2021);

insert into albums(name, release_year) --Скриптонит
values('Не ври, не верю', 2019);

insert into albums(name, release_year) --Zivert
values('Vinyl#2', 2021);

insert into albums(name, release_year) --Zivert
values('Сияй', 2018);

insert into albums(name, release_year) --Zivert
values('Life', 2019);

insert into albums(name, release_year) --Mujuice
values('Underdogs', 2021);

insert into albums(name, release_year) --Mujuice
values('Die Young!', 2019);

insert into albums(name, release_year) --Mujuice
values('ХАОС', 2018);

insert into albums(name, release_year) --The Retuses
values('OMYT', 2019);

insert into albums(name, release_year) --The Retuses
values('Astra', 2013);

insert into albums(name, release_year) --The Retuses
values('Waltz Baltika!', 2011);

insert into albums(name, release_year) --Буерак
values('Не станет хитом', 2020);

insert into albums(name, release_year) --Буерак
values('Репост модерн', 2018);

insert into albums(name, release_year) --Rummstein
values('Rummstein', 2019);

insert into albums(name, release_year) --Rummstein
values('Reise, Reise', 2004);

insert into albums(name, release_year) --Rummstein
values('Paris', 2019);

insert into albums(name, release_year) --Дельфин
values('КРАЙ', 2019);

insert into albums(name, release_year) --Дельфин
values('442', 2018);

insert into albums(name, release_year) --Armand Van Helden
values('My My My', 2006);

--Исполнители/альбомы:
insert into artists_albums 
values(1, 1);

insert into artists_albums 
values(1, 2);

insert into artists_albums 
values(1, 3);

insert into artists_albums 
values(1, 4);

insert into artists_albums 
values(2, 5);

insert into artists_albums 
values(2, 6);

insert into artists_albums 
values(2, 7);

insert into artists_albums 
values(2, 8);

insert into artists_albums 
values(3, 9);

insert into artists_albums 
values(3, 10);

insert into artists_albums 
values(4, 11);

insert into artists_albums 
values(4, 12);

insert into artists_albums 
values(4, 13);

insert into artists_albums 
values(5, 14);

insert into artists_albums 
values(5, 15);

insert into artists_albums 
values(5, 16);

insert into artists_albums 
values(6, 17);

insert into artists_albums 
values(6, 18);

insert into artists_albums 
values(6, 19);

insert into artists_albums 
values(7, 20);

insert into artists_albums 
values(7, 21);

insert into artists_albums 
values(8, 22);

insert into artists_albums 
values(8, 23);

insert into artists_albums 
values(8, 24);

insert into artists_albums 
values(9, 25);

insert into artists_albums 
values(9, 26);

insert into artists_albums 
values(10, 27);

--Исполнители/жанры:
insert into artists_genres  
values(1, 3);

insert into artists_genres  
values(1, 9);

insert into artists_genres  
values(2, 2);

insert into artists_genres  
values(3, 4);

insert into artists_genres  
values(4, 1);

insert into artists_genres  
values(4, 5);

insert into artists_genres  
values(6, 6);

insert into artists_genres  
values(7, 7);

insert into artists_genres  
values(4, 10);

--треки/сборники:
insert into tracks_collections
values(1, 1);

insert into tracks_collections
values(3, 2);

insert into tracks_collections
values(6, 3);

insert into tracks_collections
values(7, 4);

insert into tracks_collections
values(9, 5);

insert into tracks_collections
values(11, 6);

insert into tracks_collections
values(16, 7);

insert into tracks_collections
values(18, 8);