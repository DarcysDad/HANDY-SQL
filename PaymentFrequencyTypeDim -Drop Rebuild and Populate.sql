-- Drop the table if it exists
IF EXISTS (SELECT * 
           FROM information_schema.tables 
           WHERE table_schema = 'Staging' 
           AND table_name = 'PaymentFrequencyTypeDim')
BEGIN
    DROP TABLE Staging.PaymentFrequencyTypeDim
END
GO

-- Create the table
CREATE TABLE Staging.PaymentFrequencyTypeDim (
    FrequencyTypeDimKey INT,
    Payment_Frequency NVARCHAR(255)
)
GO

-- Populate the table with unique payment frequency types from Landed.Finances_Flat table
;WITH Frequency_CTE AS (
    SELECT DISTINCT Payment_Frequency_Type AS Payment_Frequency 
    FROM Landed.Finances_Flat
	WHERE Payment_Frequency_Type IS NOT NULL
)
INSERT INTO Staging.PaymentFrequencyTypeDim (FrequencyTypeDimKey, Payment_Frequency)
SELECT ROW_NUMBER() OVER (ORDER BY Payment_Frequency), Payment_Frequency
FROM Frequency_CTE
