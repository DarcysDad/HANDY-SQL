-- Drop the table if it exists
IF EXISTS (SELECT * 
           FROM information_schema.tables 
           WHERE table_schema = 'Staging' 
           AND table_name = 'Finance_Fact')
BEGIN
    DROP TABLE Staging.Finance_Fact
END
GO

-- Create the table as a copy of Landed.Finances_Flat
SELECT *
INTO Staging.Finance_Fact
FROM Landed.Finances_Flat
GO

-- Add the SupplierDimKey and FrequencyTypeDimKey columns
ALTER TABLE Staging.Finance_Fact
ADD SupplierDimKey INT, FrequencyTypeDimKey INT
GO

-- Populate the SupplierDimKey column
UPDATE Staging.Finance_Fact
SET SupplierDimKey = SupplierDim.SupplierDimKey
FROM Staging.Finance_Fact
LEFT JOIN Staging.SupplierDim ON Staging.Finance_Fact.Supplier = SupplierDim.Supplier_Name
GO

-- Populate the FrequencyTypeDimKey column
UPDATE Staging.Finance_Fact
SET FrequencyTypeDimKey = PaymentFrequencyTypeDim.FrequencyTypeDimKey
FROM Staging.Finance_Fact
LEFT JOIN Staging.PaymentFrequencyTypeDim ON Staging.Finance_Fact.Payment_Frequency_Type = PaymentFrequencyTypeDim.Payment_Frequency
GO

-- Drop the Supplier and Payment_Frequency_Type columns
ALTER TABLE Staging.Finance_Fact
DROP COLUMN Supplier, Payment_Frequency_Type
