﻿CREATE TABLE [dbo].[Employee]
(
    [Id] INT NOT NULL PRIMARY KEY,
    [AddressId] INT NOT NULL FOREIGN KEY REFERENCES Address(Id),
    [PersonId] INT NOT NULL FOREIGN KEY REFERENCES Person(Id),
    [CompanyName] NVARCHAR(20) NOT NULL,
    [Position] NVARCHAR(30) NULL,
    [EmployeeName] NVARCHAR(100) NULL
)
