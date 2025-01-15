CREATE TRIGGER [CreateCompanyOnNewEmployee]
	ON [dbo].[Employee]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Street NVARCHAR(50), @City NVARCHAR(20), @State NVARCHAR(50), @ZipCode NVARCHAR(50);
    
    SELECT @Street = Street, @City = City, @State = State, @ZipCode = ZipCode
    FROM Address
    WHERE Id = (SELECT AddressId FROM inserted);

    DECLARE @NewAddressId INT;
    INSERT INTO Address (Street, City, State, ZipCode)
    VALUES (@Street, @City, @State, @ZipCode);

    SET @NewAddressId = SCOPE_IDENTITY();

    DECLARE @CompanyName NVARCHAR(20);
    SELECT @CompanyName = LEFT(CompanyName, 20) FROM inserted; -- Truncate to 20 chars

    INSERT INTO Company (Name, AddressId)
    VALUES (@CompanyName, @NewAddressId);
END
