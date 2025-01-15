CREATE VIEW [dbo].[EmployeeInfo]
AS
SELECT TOP 1000
    E.Id AS EmployeeId,
    ISNULL(E.EmployeeName, P.FirstName + ' ' + P.LastName) AS EmployeeFullName,
    A.ZipCode + '_' + A.State + ', ' + A.City + '-' + A.Street AS EmployeeFullAddress,
    E.CompanyName + '(' + ISNULL(E.Position, '') + ')' AS EmployeeCompanyInfo
FROM 
    Employee E
INNER JOIN 
    Person P ON E.PersonId = P.Id
INNER JOIN 
    Address A ON E.AddressId = A.Id
ORDER BY 
    E.CompanyName ASC, 
    A.City ASC;


-- NOTE:  to be able to use order by at view, we need to select TOP ... 