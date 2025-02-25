SHOW DATABASES;

CREATE SCHEMA  Store_exercise ;

USE Store_exercise;

CREATE TABLE `store` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Data_apertura` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
);

CREATE TABLE `region` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Citta` varchar(45) NOT NULL,
  `Regione` varchar(45) NOT NULL,
  `Area georgrafica` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ;

ALTER TABLE `store_exercise`.`store` 
ADD COLUMN `RegionID` INT NOT NULL AFTER `Data_apertura`;

INSERT INTO store (Nome, Data_apertura, RegionID)
VALUES
('Gigli','2014-05-12', '1'),
('Lema', '2019-08-28', '5'),
('Sister', '2000-02-02', '4'),
('Music', '2002-01-14', '2'),
('Leone', '2007-11-22', '6'),
('Gori', '2011-05-18', '1'),
('Stella', '2022-08-26', '3'),
('Domingo', '2017-09-28', '2'),
('Layla', '2016-11-21', '6');

DELETE z.*
	FROM store AS w
    JOIN store as z ON z.Nome = w.Nome
    AND z.ID > w.ID;

INSERT INTO region (Citta, Regione, Area_geografica)
VALUES
('Torino', 'Piemonte', 'Nord'),
('Palermo', 'Sicilia', 'Sud'),
('Olbia', 'Sardegna', 'Sud'),
('Firenze', 'Toscana', 'Centro'),
('Venezia', 'Veneto', 'Nord'),
('Siena', 'Toscana', 'Centro'),
('Napoli', 'Campania', 'Sud'),
('Genova', 'Liguria', 'Nord');

SELECT * FROM Store;

SELECT * FROM Region;

UPDATE store
SET Nome = 'Alex', Data_apertura = '2025-02-18'
WHERE id = 2;

UPDATE region 
SET citta = 'Perugia', regione = 'Umbria', area_geografica = 'Centro' 
WHERE id = 6;

DELETE FROM store 
	WHERE regionid IN ( 
		SELECT id FROM region WHERE area_geografica = 'Nord');
        
DELETE FROM store
	WHERE data_apertura = '2015-01-20';

SELECT * FROM store JOIN region ON  store.RegionID = region.ID;

SHOW CREATE table Store;

