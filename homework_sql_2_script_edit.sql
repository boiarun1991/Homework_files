CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name_genre VARCHAR(40) UNIQUE
);

CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	name_artist VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(60),
	year_of_realease INT not null check (year_of_realease > 1950)
);

CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL primary KEY,
	id_album INT not null references albums(id),
	name_track VARCHAR(60),
	album_name VARCHAR(60),
	duration TIME
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	name_collection VARCHAR(60),
	album_name VARCHAR(60),
	year_of_realease INT not null check (year_of_realease > 2000)
);

CREATE TABLE IF NOT exists united_artist_album  (
	genre_id INTEGER REFERENCES genre(id),
	artist_id INTEGER REFERENCES artist(id),
	CONSTRAINT genre_artist PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT exists united_collection_tracks (
	track_id INTEGER REFERENCES tracks(id),
	collection_id INTEGER REFERENCES collection(id),
	CONSTRAINT collection_tracks PRIMARY KEY (track_id, collection_id)
);

CREATE TABLE IF NOT exists united_artist_albums (
	artist_id INTEGER REFERENCES artist(id),
	album_id INTEGER REFERENCES albums(id),
	CONSTRAINT artist_albums PRIMARY KEY (artist_id, album_id)
);




