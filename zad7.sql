--zad1
BEGIN
SELECT AVG(payHistory.Rate) FROM [AdventureWorks2017].[HumanResources].[EmployeePayHistory] payHistory
SELECT * FROM [AdventureWorks2017].[HumanResources].[Employee] employee JOIN [AdventureWorks2017].[HumanResources].[EmployeePayHistory] payHistory
ON payHistory.BusinessEntityID = employee.BusinessEntityID WHERE payHistory.Rate < (SELECT AVG(payHistory.Rate) FROM [AdventureWorks2017].[HumanResources].[EmployeePayHistory] payHistory)
END;
--zad2
CREATE FUNCTION shipDate (@orderNr NVARCHAR(25))
RETURNS TABLE AS
RETURN
(SELECT orders.ShipDate FROM [AdventureWorks2017].[Sales].[SalesOrderHeader] orders WHERE orders.SalesOrderNumber = @orderNr)
--zad3
CREATE PROC productInfo (@productName NVARCHAR(70))
AS
SELECT ProductID, ProductNumber, MakeFlag FROM [AdventureWorks2017].Production.Product WHERE Name=@productName
--zad4
CREATE FUNCTION cardNr (@orderNr NVARCHAR(25))
RETURNS TABLE AS
RETURN
SELECT cards.CardNumber FROM [AdventureWorks2017].[Sales].[CreditCard] cards JOIN [AdventureWorks2017].[Sales].[SalesOrderHeader] orders ON cards.CreditCardID = orders.CreditCardID WHERE orders.SalesOrderNumber=@orderNr
--zad5
CREATE PROC div (@num1 INT, @num2 INT)
AS
IF @num1>@num2
	SELECT @num1/@num2
ELSE
	RAISERROR('Niewlasciwie zdefiniowales dane wejsciowe ',16,1)