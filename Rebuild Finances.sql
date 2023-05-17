IF EXISTS (SELECT * 
           FROM information_schema.tables 
           WHERE table_schema = 'Landed' 
           AND table_name = 'Finances_Flat')
BEGIN
    DROP TABLE Landed.Finances_Flat
END
GO

IF NOT EXISTS (SELECT schema_name 
               FROM information_schema.schemata 
               WHERE schema_name = 'Landed')
BEGIN
    EXEC sp_executesql N'CREATE SCHEMA Landed'
END
GO

IF NOT EXISTS (SELECT * 
               FROM information_schema.tables 
               WHERE table_schema = 'Landed' 
               AND table_name = 'Finances_Flat')
BEGIN
    CREATE TABLE Landed.Finances_Flat (
        Item NVARCHAR(255),
        Cost_GBP MONEY,
        Supplier NVARCHAR(255),
        Account_From NVARCHAR(255),
        Payment_Type NVARCHAR(255),
        Payment_Frequency_Type NVARCHAR(255),
        Payment_Date DATE
    )
END
