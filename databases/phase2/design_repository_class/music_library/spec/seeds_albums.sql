TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY;

INSERT INTO artists (name, genre) VALUES ('ABBA', 'Rock');
INSERT INTO artists (name, genre) VALUES ('Bob Jon', 'Rock');

INSERT INTO albums (title, release_year, artist_id) VALUES ('ABBA', '1990', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Bob Jon', '1997', '2');