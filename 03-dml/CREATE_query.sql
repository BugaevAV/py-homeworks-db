CREATE TABLE IF NOT EXISTS musical_genres (
	genre_id SERIAL primary key,
	name VARCHAR(60) not null unique
);

CREATE TABLE IF NOT EXISTS music_artists (
	artist_id SERIAL primary key,
	name VARCHAR(80) not null
);

CREATE TABLE IF NOT EXISTS albums (
	album_id SERIAL primary key,
	name VARCHAR(80) not null,
	release_year smallint check(release_year > 1900)
);

CREATE TABLE IF NOT EXISTS artists_genres(
	genre_id INTEGER not null references musical_genres (genre_id),
	artist_id INTEGER not null references music_artists (artist_id),
	constraint ag primary key (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS artists_albums(
	artist_id INTEGER not null references music_artists (artist_id),
	album_id INTEGER not null references albums (album_id),
	constraint aa primary key (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS music_tracks (
	id SERIAL primary key,
	name VARCHAR(80) not null,
	length integer not null check(length < 2400),
	album_id integer not null references albums (album_id)
);

CREATE TABLE IF NOT EXISTS music_collections (
	id SERIAL primary key,
	name VARCHAR(80) not null,
	release_year smallint check(release_year > 1900)
);

CREATE TABLE IF NOT EXISTS tracks_collections (
	track_id INTEGER not null references music_tracks(id),
	collection_id INTEGER not null references music_collections(id),
	constraint tc primary key (track_id, collection_id)
);

