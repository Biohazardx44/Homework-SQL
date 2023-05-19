USE SEDC

ALTER TABLE dbo.Products
ADD CONSTRAINT DF_Products_Price 
DEFAULT (1) FOR Price

ALTER TABLE dbo.Products
WITH CHECK
ADD CONSTRAINT CH_Products_Price 
CHECK (Price <= 2 * Cost)

ALTER TABLE dbo.Products
WITH CHECK
ADD CONSTRAINT UNQ_Products_Name 
UNIQUE ([Name])

UPDATE dbo.Products
SET [Name] = 'Some random item'
WHERE Id = 13

UPDATE dbo.Products
SET [Name] = 'Another random item'
WHERE Id = 12

SELECT *
FROM dbo.Products