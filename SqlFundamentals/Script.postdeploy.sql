/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- Insert default data

-- Address
INSERT INTO Address (Id, Street, City, State, ZipCode)
VALUES (1, 'inonu cad.', 'Izmir', 'EGE', '35650');

-- Person
INSERT INTO Person (Id, FirstName, LastName)
VALUES (1, 'Serdar', 'Filik');

-- Company
INSERT INTO Company (Id, Name, AddressId)
VALUES (1, 'EPAM Systems', 1);

-- Employee
INSERT INTO Employee (Id, AddressId, PersonId, CompanyName, Position, EmployeeName)
VALUES (1, 1, 1, 'EPAM Systems', 'Developer', 'Serdar Filik');
