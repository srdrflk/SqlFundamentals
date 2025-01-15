CREATE PROCEDURE [dbo].[InsertEmployee]

    @EmployeeName NVARCHAR(100) = NULL,
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @CompanyName NVARCHAR(20),
    @Position NVARCHAR(30) = NULL,
    @Street NVARCHAR(50),
    @City NVARCHAR(20) = NULL,
    @State NVARCHAR(50) = NULL,
    @ZipCode NVARCHAR(50) = NULL
AS
BEGIN

    IF LTRIM(RTRIM(ISNULL(@EmployeeName, ''))) = '' 
        AND LTRIM(RTRIM(ISNULL(@FirstName, ''))) = '' 
        AND LTRIM(RTRIM(ISNULL(@LastName, ''))) = ''
    BEGIN
        RAISERROR('At least one name field must be provided.', 16, 1);
        RETURN;
    END

    -- Truncate CompanyName if it's longer than 20 characters
    SET @CompanyName = LEFT(@CompanyName, 20);

    DECLARE @AddressId INT;
    INSERT INTO Address (Street, City, State, ZipCode)
    VALUES (@Street, @City, @State, @ZipCode);
    
    SELECT @AddressId = SCOPE_IDENTITY();

    DECLARE @PersonId INT = NULL;
    IF LTRIM(RTRIM(ISNULL(@FirstName, ''))) <> '' OR LTRIM(RTRIM(ISNULL(@LastName, ''))) <> ''
    BEGIN
        INSERT INTO Person (FirstName, LastName)
        VALUES (@FirstName, @LastName);
        
        SELECT @PersonId = SCOPE_IDENTITY();
    END

    INSERT INTO Employee (AddressId, PersonId, CompanyName, Position, EmployeeName)
    VALUES (@AddressId, @PersonId, @CompanyName, @Position, @EmployeeName);
END