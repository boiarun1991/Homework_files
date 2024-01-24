-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';

-- DROP SEQUENCE public.albums_id_seq;

CREATE SEQUENCE public.albums_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.albums_id_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE public.albums_id_seq TO postgres;

-- DROP SEQUENCE public.artist_id_seq;

CREATE SEQUENCE public.artist_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.artist_id_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE public.artist_id_seq TO postgres;

-- DROP SEQUENCE public.collection_id_seq;

CREATE SEQUENCE public.collection_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.collection_id_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE public.collection_id_seq TO postgres;

-- DROP SEQUENCE public.genre_id_seq;

CREATE SEQUENCE public.genre_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.genre_id_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE public.genre_id_seq TO postgres;

-- DROP SEQUENCE public.tracks_id_seq;

CREATE SEQUENCE public.tracks_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.tracks_id_seq OWNER TO postgres;
GRANT ALL ON SEQUENCE public.tracks_id_seq TO postgres;
-- public.albums определение

-- Drop table

-- DROP TABLE public.albums;

CREATE TABLE public.albums (
	id serial4 NOT NULL,
	album_name varchar(60) NULL,
	year_of_realease int4 NULL,
	album_author varchar(60) NULL,
	CONSTRAINT albums_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.albums OWNER TO postgres;
GRANT ALL ON TABLE public.albums TO postgres;


-- public.artist определение

-- Drop table

-- DROP TABLE public.artist;

CREATE TABLE public.artist (
	id serial4 NOT NULL,
	"name" varchar(60) NULL,
	CONSTRAINT artist_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.artist OWNER TO postgres;
GRANT ALL ON TABLE public.artist TO postgres;


-- public.collection определение

-- Drop table

-- DROP TABLE public.collection;

CREATE TABLE public.collection (
	id serial4 NOT NULL,
	name_collection varchar(60) NULL,
	album_name varchar(60) NULL,
	year_for_realease int4 NULL,
	track varchar(60) NULL,
	CONSTRAINT collection_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.collection OWNER TO postgres;
GRANT ALL ON TABLE public.collection TO postgres;


-- public.genre определение

-- Drop table

-- DROP TABLE public.genre;

CREATE TABLE public.genre (
	id serial4 NOT NULL,
	music_genre varchar(60) NULL,
	CONSTRAINT genre_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.genre OWNER TO postgres;
GRANT ALL ON TABLE public.genre TO postgres;


-- public.tracks определение

-- Drop table

-- DROP TABLE public.tracks;

CREATE TABLE public.tracks (
	id serial4 NOT NULL,
	albums_id int4 NULL,
	name_track varchar(60) NULL,
	album_name varchar(60) NULL,
	duration int4 NULL,
	CONSTRAINT tracks_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.tracks OWNER TO postgres;
GRANT ALL ON TABLE public.tracks TO postgres;


-- public.united_artist_album определение

-- Drop table

-- DROP TABLE public.united_artist_album;

CREATE TABLE public.united_artist_album (
	album_id int4 NOT NULL,
	artist_id int4 NOT NULL,
	CONSTRAINT aa PRIMARY KEY (album_id, artist_id),
	CONSTRAINT united_artist_album_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(id),
	CONSTRAINT united_artist_album_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artist(id)
);

-- Permissions

ALTER TABLE public.united_artist_album OWNER TO postgres;
GRANT ALL ON TABLE public.united_artist_album TO postgres;


-- public.united_collection_tracks определение

-- Drop table

-- DROP TABLE public.united_collection_tracks;

CREATE TABLE public.united_collection_tracks (
	track_id int4 NOT NULL,
	collection_id int4 NOT NULL,
	CONSTRAINT ct PRIMARY KEY (track_id, collection_id),
	CONSTRAINT united_collection_tracks_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collection(id),
	CONSTRAINT united_collection_tracks_track_id_fkey FOREIGN KEY (track_id) REFERENCES public.tracks(id)
);

-- Permissions

ALTER TABLE public.united_collection_tracks OWNER TO postgres;
GRANT ALL ON TABLE public.united_collection_tracks TO postgres;


-- public.united_genre_artist определение

-- Drop table

-- DROP TABLE public.united_genre_artist;

CREATE TABLE public.united_genre_artist (
	genre_id int4 NOT NULL,
	artist_id int4 NOT NULL,
	CONSTRAINT pk PRIMARY KEY (genre_id, artist_id),
	CONSTRAINT united_genre_artist_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artist(id),
	CONSTRAINT united_genre_artist_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(id)
);

-- Permissions

ALTER TABLE public.united_genre_artist OWNER TO postgres;
GRANT ALL ON TABLE public.united_genre_artist TO postgres;




-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;
