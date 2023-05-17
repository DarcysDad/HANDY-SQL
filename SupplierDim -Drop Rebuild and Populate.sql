-- Drop the table if it exists
IF EXISTS (SELECT * 
           FROM information_schema.tables 
           WHERE table_schema = 'Staging' 
           AND table_name = 'SupplierDim')
BEGIN
    DROP TABLE Staging.SupplierDim
END
GO

-- Create the table
CREATE TABLE Staging.SupplierDim (
    SupplierDimKey INT,
    Supplier_Name NVARCHAR(255)
)
GO

-- Populate the table with unique supplier names from Landed.Finances_Flat table
;WITH Supplier_CTE AS (
    SELECT DISTINCT Supplier AS Supplier_Name 
    FROM Landed.Finances_Flat
	WHERE Supplier IS NOT NULL
)
INSERT INTO Staging.SupplierDim (SupplierDimKey, Supplier_Name)
SELECT ROW_NUMBER() OVER (ORDER BY Supplier_Name), Supplier_Name
FROM Supplier_CTE
