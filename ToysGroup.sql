SHOW DATABASES;
CREATE DATABASE ToysGroup;
USE ToysGroup;

CREATE TABLE Category (
	CategoryID INT AUTO_INCREMENT PRIMARY KEY,
	CategoryName varchar (50) NOT NULL,
	Description TEXT
);

CREATE TABLE Product (
	ProductID INT PRIMARY KEY,
    ProductName VARCHAR (50) NOT NULL,
    CategoryID INT,
    Price decimal (10,2) NOT NULL,
    Description TEXT,
    FOREIGN KEY (CategoryID) references Category (CategoryID)
    );
    
    CREATE TABLE Region (
	RegionID INT Primary Key NOT NULL,
	RegionName varchar (50) NOT NULL,
	Description TEXT
    );


CREATE TABLE State (
    StateID INT PRIMARY KEY,
    StateName VARCHAR(255) NOT NULL,
    RegionID INT,
    CONSTRAINT FK_State_Region
    FOREIGN KEY (RegionID) references Region (RegionID)
);

CREATE TABLE DocInfo (
DocNo VARCHAR (50) PRIMARY KEY,
StateID INT,
Details VARCHAR (255),
FOREIGN KEY (StateID) REFERENCES State(StateID)
);

CREATE TABLE Sales (
    SalesID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    RegionID INT,
    QuantitySold INT NOT NULL,
    DocNo Varchar (15),
    SaleDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (RegionID) REFERENCES Region (RegionID),
    FOREIGN KEY (DocNo) REFERENCES DocInfo (DocNo)
);


SELECT * FROM SALES;

INSERT INTO Category (CategoryName, Description) 
	VALUES
		('Bikes', 'All types of bicycles'),
		('Clothing', 'Apparel for cycling'),
		('Accessories', 'Additional gear for bikes'),
		('Toys', 'Various children’s toys'),
		('Electronics', 'Gadgets and devices'),
		('Furniture', 'Home and office furniture'),
		('Sports', 'Sports equipment and gear'),
		('Books', 'Various types of books'),
		('Music', 'Instruments and accessories'),
		('Outdoor', 'Camping and outdoor gear');


INSERT INTO Product (ProductID, ProductName, CategoryID, Price, Description) 
	VALUES
		(651485, 'Mountain Bike', 1, 500.00, 'A rugged mountain bike'),
		(728547, 'Road Bike', 1, 700.00, 'A lightweight road bike'),
		(125485, 'Bike Helmet', 2, 50.00, 'Safety helmet for biking'),
		(986574, 'Cycling Gloves', 2, 20.00, 'Protective gloves for cyclists'),
		(777458, 'Bike Lock', 3, 30.00, 'Heavy-duty bike lock'),
		(654, 'Action Figure', 4, 25.00, 'Superhero action figure'),
		(98450, 'RC Car', 4, 100.00, 'Remote controlled car'),
		(999458, 'Smartwatch', 5, 200.00, 'Wearable fitness tracker'),
		(131354, 'Office Chair', 6, 150.00, 'Ergonomic office chair'),
		(248574, 'Camping Tent', 10, 120.00, 'Waterproof camping tent');
        
        
INSERT INTO Region (RegionID, RegionName, Description) 
	VALUES
(1, 'West Europe', 'Western European countries'),
(2, 'South Europe', 'Southern European countries'),
(3, 'North Europe', 'Northern European countries'),
(4, 'East Europe', 'Eastern European countries');

INSERT INTO State (StateID, StateName, RegionID) 
	VALUES
		(45, 'France', 1),
		(6, 'Germany', 1),
		(25, 'United Kingdom', 1),
		(28, 'Spain', 2),
		(1, 'Italy', 2),
		(35, 'Greece', 2),
		(17, 'Sweden', 3),
		(22, 'Norway', 3),
		(29, 'Poland', 3),
		(2, 'Romania', 4),
        (32, 'Russia', 4);
        
        INSERT INTO DocInfo (DocNo, StateID, Details)
	VALUES
	('DOC001', 25, 'Sale completed for 2500.00 EUR'),
	('DOC002', 6, 'Sale processed for 2100.00 EUR'),
	('DOC003', 25, 'Payment received: 500.00 EUR'),
	('DOC004', 28, 'Paid by customer: 300.00 EUR'),
	('DOC005', 1, 'Invoice settled: 210.00 EUR'),
	('DOC006', 35, 'Finalized transaction of 450.00 EUR'),
	('DOC007', 17, 'Processed payment: 600.00 EUR'),
	('DOC008', 2, 'High-value transaction: 4000.00 EUR'),
	('DOC009', 22, 'Client purchase of 800.00 EUR'),
	('DOC010', 32, 'Confirmed order for 720.00 EUR'),
    ('DOC123', 35, 'Sale completed for 2500.00 EUR'),
	('DOC124', 29, 'Sale processed for 1500.00 EUR'),
	('DOC125', 1, 'Payment received: 500.00 EUR'),
	('DOC126', 2, 'High-value transaction: 9000.00 EUR'),
	('DOC127', 25, 'Client purchase of 1200.00 EUR'),
	('DOC128', 32, 'Large order finalized: 10500.00 EUR');
        


INSERT INTO Sales (ProductID, RegionID, QuantitySold, DocNo, SaleDate, TotalAmount) 
	VALUES
(651485, 1, 5, 'DOC001', '2018-02-15', 2500.00),
(728547, 1, 3, 'DOC002', '2019-06-25', 2100.00),
(125485, 1, 10, 'DOC003', '2020-08-14', 500.00),
(986574, 2, 15, 'DOC004', '2021-03-22', 300.00),
(777458, 2, 7, 'DOC005', '2022-07-19', 210.00),
(654, 2, 9, 'DOC006', '2023-01-30', 450.00),
(98450, 3, 12, 'DOC007', '2019-11-10', 600.00),
(999458, 4, 20, 'DOC008', '2020-12-05', 4000.00),
(131354, 3, 4, 'DOC009', '2021-09-28', 800.00),
(248574, 4, 6, 'DOC010', '2022-05-16', 720.00),
(651485, 2, 5, 'DOC123', '2025-02-24', 2500.00),
(125485, 3, 30, 'DOC124', '2025-02-23', 1500.00),
(654, 2, 20, 'DOC125', '2025-02-22', 500.00),
(131354, 4, 60, 'DOC126', '2025-02-21', 9000.00),
(777458, 1, 40, 'DOC127', '2025-02-20', 1200.00),
(131354, 4, 70, 'DOC128', '2025-02-19', 10500.00);


SELECT * FROM Sales;

-- 1)	Verificare che i campi definiti come PK siano univoci. 
-- In altre parole, scrivi una query per determinare l’univocità dei valori di ciascuna PK (una query per tabella implementata).
SELECT ProductID, COUNT(*)
FROM Product
GROUP BY ProductID
HAVING COUNT(*) > 1;

SELECT
    (SELECT COUNT(DISTINCT CategoryID) FROM Category) AS distinct_values,
		(SELECT COUNT(*) FROM Category) AS total_rows;
    
    SELECT * FROM State;

SELECT COUNT(DISTINCT RegionID) AS answer, RegionID FROM Region
 GROUP BY RegionID;
 
 SELECT COUNT(DISTINCT RegionID) AS distinct_count, COUNT(*) AS total_count
FROM Region;


SHOW INDEX FROM State WHERE Key_name = 'Primary';

SELECT t1.StateID, COUNT(*) AS Count
FROM State t1
JOIN State t2 ON t1.StateID = t2.StateID
GROUP BY t1.StateID
HAVING COUNT(*) > 1;

SELECT SalesID, COUNT(*)
FROM Sales
GROUP BY SalesID
HAVING COUNT(*) > 1;

-- 2.	Esporre l’elenco delle transazioni indicando nel result set:
-- il codice documento, 
-- la data, 
-- il nome del prodotto, 
-- la categoria del prodotto, 
-- il nome dello stato, 
-- il nome della regione di vendita e 
-- un campo booleano valorizzato in base alla condizione che siano passati più di 180 giorni dalla data vendita o meno (>180 -> True, <= 180 -> False)

SELECT
    Sales.DocNo AS CodiceDocumento, 
    Sales.SaleDate AS Data, 
    Product.ProductName AS NomeProdotto, 
    Category.CategoryName AS CategoriaProdotto,
    State.StateName AS NomeStato,
    Region.RegionName AS NomeRegione,
		(SELECT IF(DATEDIFF(CURDATE(), Sales.SaleDate) > 180,'TRUE', 'FALSE')) AS PiuDi180Giorni
		FROM Sales 
        JOIN Product ON Sales.ProductID = Product.ProductID
        JOIN Category ON Product.CategoryID = Category.CategoryID
        JOIN Region ON Sales.RegionID = Region.RegionID
        JOIN DocInfo ON Sales.DocNo = DocInfo.DocNo
        JOIN State ON DocInfo.StateID = State.StateID
       ;
        
    
        -- 3)	Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito. 
-- (ogni valore della condizione deve risultare da una query e non deve essere inserito a mano). 
-- Nel result set devono comparire solo il codice prodotto e il totale venduto.

SELECT * FROM Sales;

SELECT ProductID, SUM(QuantitySold) AS TotaleVenduto
 FROM Sales
		WHERE YEAR(Sales.SaleDate) = (
			SELECT MAX(YEAR(SaleDate)) 
					FROM Sales
)
GROUP BY ProductID
HAVING SUM(QuantitySold) > (
    SELECT AVG(TotalePerProdotto)
    FROM (
        SELECT SUM(QuantitySold) AS TotalePerProdotto
        FROM Sales
        WHERE YEAR(SaleDate) = (
            SELECT MAX(YEAR(SaleDate)) 
            FROM Sales
        )
        GROUP BY ProductID
    ) AS MediaVendite
);

-- 4)	Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno. 

SELECT 
    YEAR(Sales.SaleDate) AS Anno, 
    Sales.ProductID, 
    SUM(Sales.QuantitySold * Product.Price) AS FatturatoTotale
FROM Sales
	JOIN Product ON Sales.ProductID = Product.ProductID
WHERE Sales.QuantitySold > 0 
GROUP BY Anno, Sales.ProductID
ORDER BY Anno DESC, FatturatoTotale DESC;

-- 5)	Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente
SELECT 
    YEAR(Sales.SaleDate) AS Anno, 
    State.StateName, 
    SUM(Sales.QuantitySold * Product.Price) AS FatturatoTotale
FROM Sales
JOIN DocInfo ON Sales.DocNo = DocInfo.DocNo
	Join Product ON Sales.ProductID = Product.ProductID
		JOIN State ON State.StateID = DocInfo.StateID
GROUP BY Anno, State.StateName
ORDER BY Anno ASC, FatturatoTotale DESC;

-- 6)	Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?

SELECT 
    Category.CategoryName, 
    SUM(Sales.QuantitySold) AS QuantitaTotaleVenduta
FROM Sales
JOIN Product  ON Product.ProductID = Sales.ProductID
JOIN Category ON Product.CategoryID = Category.CategoryID
GROUP BY Category.CategoryName
ORDER BY QuantitaTotaleVenduta DESC
LIMIT 1;

SELECT Category.CategoryName AS Categoria, COUNT(Sales.SalesID) AS NumeroDiTransazioni
FROM Sales
JOIN Product ON Sales.ProductID = Product.ProductID
JOIN Category ON product.CategoryID = category.CategoryID
GROUP BY category.CategoryName
ORDER BY NumeroDiTransazioni DESC
LIMIT 1;

-- 7)	Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti.
SELECT ProductID, ProductName
FROM Product
LEFT JOIN Sales ON Product.ProductID = Sales.ProductID
WHERE Sales.ProductID IS NULL;


SELECT ProductID, ProductName
FROM Product
WHERE ProductID NOT IN (SELECT ProductID FROM Sales);

-- 8)	Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” delle informazioni utili (codice prodotto, nome prodotto, nome categoria)
CREATE VIEW ProductView AS
SELECT Product.ProductID AS ID, Product.ProductName AS Nome, Category.CategoryName AS Categoria
FROM Product
JOIN Category ON Product.CategoryID = Category.CategoryID;

SELECT * FROm ProductView;

-- 9)	Creare una vista per le informazioni geografiche
CREATE VIEW GeographyView AS
SELECT State.StateID AS ID, State.StateName AS Paese, Region.RegionName AS Regione
FROM State
JOIN Region ON state.RegionID = Region.RegionID;

SELECT * FROM GeographyView ORDER BY Paese;


SELECT * FROM Sales JOIN Product ON Sales.ProductID = Product.ProductID
	 JOIN Region ON Sales.RegionID = Region.RegionID
		JOIN DocInfo ON Sales.DocNo = DocInfo.DocNo;

SELECT * FROM Product;

SELECT * FROM State;

SELECT * FROM Region;

SELECT * FROM Category;
SELECT * FROM Sales;

SELECT * from DocInfo;
