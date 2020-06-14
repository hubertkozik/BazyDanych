--z1
CREATE PROC fibon(@n INT)
AS 
DECLARE @fn INT=0;
DECLARE @f1 INT=0;
DECLARE @f2 INT=1;
IF @n = 1
BEGIN
 SET @fn=0 ;
END;
ELSE 
BEGIN
	WHILE @n-1 > 1
	BEGIN
	 SET @fn = @f1 + @f2;
	 SET @f1 = @f2;
	 SET @f2 = @fn;
	 SET @n = @n-1;
	END;
END;
SELECT @fn as Ciag_Fib;
RETURN;

--z2
CREATE TRIGGER trg ON AdventureWorks2017.Person.Person 
FOR UPDATE AS
UPDATE Person SET LastName=upper(LastName)

--z3
CREATE TRIGGER taxRateMonitoring ON AdventureWorks2017.Sales.SalesTaxRate
AFTER UPDATE AS
BEGIN
SET NOCOUNT ON;
DECLARE @tNew FLOAT;
DECLARE @tOld FLOAT;
SELECT @tNew = TaxRate FROM inserted
SELECT @tOld = TaxRate FROM deleted
IF ((@tNew > @tOld + 0.3* @tOld) OR (@tNew < @tOld - 0.3* @tOld))
BEGIN
print 'ERROR'
ROLLBACK
RETURN
END;
END;
