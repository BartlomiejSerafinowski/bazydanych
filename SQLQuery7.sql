-- ZAD 1
USE AdventureWorks2019

BEGIN 
	SELECT AVG(Rate) 
	FROM [HumanResources].[EmployeePayHistory]
END

BEGIN 
	SELECT FirstName, LastName, Rate
	FROM [Person].[Person]
	JOIN HumanResources.EmployeePayHistory ON Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID
	WHERE HumanResources.EmployeePayHistory.Rate < (SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory)
	ORDER BY HumanResources.EmployeePayHistory.Rate DESC
END

-- ZAD 2

CREATE OR ALTER FUNCTION dbo.wysylka (@PurchaseOrderID INT)
RETURNS TABLE AS
RETURN
(
	SELECT Purchasing.PurchaseOrderHeader.PurchaseOrderID, Purchasing.PurchaseOrderHeader.ShipDate As 'Data wysylki'
	FROM Purchasing.PurchaseOrderHeader
	WHERE Purchasing.PurchaseOrderHeader.PurchaseOrderID = @PurchaseOrderID
)

SELECT * FROM dbo.wysylka(4);

-- ZAD 3

CREATE OR ALTER PROCEDURE dbo.getproduct @Name nvarchar(40) = NULL OUT
AS 
SELECT ProductID, ProductNumber, SafetyStockLevel
FROM Production.Product
GO

EXEC dbo.getproduct;

--ZAD 4

CREATE OR ALTER FUNCTION dbo.karta (@CreditCardID INT)
RETURNS TABLE AS
RETURN
(
	SELECT  SalesOrderID, CardNumber
	FROM Sales.CreditCard
	JOIN Sales.SalesOrderHeader ON Sales.CreditCard.CreditCardID = Sales.SalesOrderHeader.CreditCardID
	WHERE Sales.CreditCard.CreditCardID = @CreditCardID
)
GO

SELECT * FROM dbo.karta(2);

--ZAD 5

CREATE OR ALTER PROCEDURE dbo.dzielenie
(
@num1 DECIMAL(10,5),
@num2 DECIMAL(10,5),
@wynik VARCHAR(50) OUT
)
AS

IF @num2=0 OR @num1<@num2
SET @wynik = 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe.';

IF @num1>@num2
SET @wynik = @num1/@num2;

GO

DECLARE @wynik VARCHAR(50)
EXEC dbo.dzielenie @num1=10, @num2=5, @wynik=@wynik out
SELECT @wynik;

--ZAD 6

CREATE OR ALTER PROCEDURE dbo.numerid (@NationalIDNumber nvarchar(30))
AS
SELECT NationalIDNumber, Jobtitle, VacationHours, SickLeaveHours
FROM HumanResources.Employee
WHERE HumanResources.Employee.NationalIDNumber = @NationalIDNumber
GO

EXEC dbo.numerid @NationalIDNumber=295847284

--ZAD 7

CREATE OR ALTER PROCEDURE dbo.kalkulator (@Money INT, @ToCurrencyCode nvarchar(3), @ModifiedDate date)
AS
SELECT
CONCAT
(
	'1 USD = ', AverageRate, ToCurrencyCode, '-' , Name,
	' | Wartoœæ na dzieñ: ', Sales.CurrencyRate.ModifiedDate, 
	' | Wymieniono na: ', @Money*AverageRate, 'USD'
)

FROM Sales.CurrencyRate
JOIN Sales.Currency
ON Sales.CurrencyRate.ToCurrencyCode = Sales.Currency.CurrencyCode
WHERE Sales.CurrencyRate.ToCurrencyCode = @ToCurrencyCode 
AND Sales.CurrencyRate.ModifiedDate = @ModifiedDate
GO

EXEC dbo.kalkulator @Money=200, @ToCurrencyCode= 'EUR', @ModifiedDate = '2012-01-01'