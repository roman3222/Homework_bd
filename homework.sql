CREATE TABLE IF NOT EXISTS Genre(
	id serial NOT NULL PRIMARY KEY,
	NameGenre VARCHAR(30) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS Executor(
	id serial NOT NULL PRIMARY KEY,
	ExecutorName VARCHAR(30) UNIQUE NOT NULL
);



CREATE TABLE IF NOT EXISTS ExecutorGenre(
	executorid INT REFERENCES Executor(id),
	genreid INT REFERENCES Genre(id),
	CONSTRAINT pk PRIMARY KEY (executorid, genreid)
);


CREATE TABLE IF NOT EXISTS Album(
	id serial NOT NULL PRIMARY KEY,
	AlbumName VARCHAR(30) UNIQUE NOT NULL,
	year_release DATE NOT NULL
);

ALTER TABLE album
ADD CONSTRAINT check_date
CHECK(year_release >= '2000-01-01' AND year_release <= '2022-12-31');


CREATE TABLE IF NOT EXISTS ExecutorAlbum(
	executorid INT REFERENCES Executor(id),
	albumid INT REFERENCES Album(id),
	CONSTRAINT ea PRIMARY KEY (executorid, albumid)
);


CREATE TABLE IF NOT EXISTS Track(
	id serial NOT NULL PRIMARY KEY,
	TrackName VARCHAR(30) NOT NULL,
	albumid INT REFERENCES Album(id),
	track_lenght INTEGER,
	CHECK (track_lenght < 5)
);





CREATE TABLE IF NOT EXISTS Collection(
	id serial PRIMARY KEY,
	CollectionName VARCHAR(30) NOT NULL,
	year_of_release DATE NOT NULL
);


ALTER TABLE Collection
ADD CONSTRAINT check_date
CHECK(year_of_release >= '2000-01-01' AND
year_of_release <= '2022-12-31');


CREATE TABLE CollectionTrack(
	trackid INT REFERENCES Track(id),
	collectionid INT REFERENCES Collection(id),
	CONSTRAINT ct PRIMARY KEY (trackid, collectionid)
);
