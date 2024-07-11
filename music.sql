-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

--Create separate tables for songs, artists, albums, and producers
--Create a join table to give relation to songs to artists, songs to producers

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL UNIQUE
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INT NOT NULL REFERENCES albums(id)
);

CREATE TABLE songs_to_artists (
  id SERIAL PRIMARY KEY,
  song_id INT NOT NULL REFERENCES songs(id),
  artist_id INT NOT NULL REFERENCES artists(id)
);

CREATE TABLE songs_to_producers (
  id SERIAL PRIMARY KEY,
  song_id INT NOT NULL REFERENCES songs(id),
  producer_id INT NOT NULL REFERENCES producers(id)
);

INSERT INTO artists (name)
VALUES
('Hanson'),
('Queen'),
('Mariah Carey'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO albums (album_name)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star Is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writing''s on the Wall');

INSERT INTO producers (name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO songs (title, duration_in_seconds, release_date, album_id)
VALUES
('MMMBop', 238, '1997-04-15', 1),
('Bohemian Rhapsody', 355, '1975-10-31', 2),
('One Sweet Day', 282, '1995-11-14', 3),
('Shallow', 216, '2018-09-27', 4),
('How You Remind Me', 223, '2001-08-21', 5),
('New York State of Mind', 276, '2009-10-20', 6),
('Dark Horse', 215, '2013-12-17', 7),
('Moves Like Jagger', 201, '2011-06-21', 8),
('Complicated', 244, '2002-05-14', 9),
('Say My Name', 240, '1999-11-07', 10);

INSERT INTO songs_to_artists (song_id, artist_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (3, 4),
  (4, 5),
  (4, 6),
  (5, 7),
  (6, 8),
  (6, 9),
  (7, 10),
  (7, 11),
  (8, 12),
  (8, 13),
  (9, 14),
  (10, 15);

  INSERT INTO songs_to_producers (song_id, producer_id) VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7),
  (7, 8),
  (7, 9),
  (8, 10),
  (8, 11),
  (9, 12),
  (10, 13);
