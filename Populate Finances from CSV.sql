--SELECT * FROM landed.Finances_Flat

BULK INSERT Landed.Finances_Flat
FROM 'C:\Users\SDuffy\Downloads\Finances 2021 - SQL Builder.csv'
WITH (
    FIELDTERMINATOR = ',',  -- CSV field delimiter
    ROWTERMINATOR = '\n',  -- CSV row delimiter
    FIRSTROW = 2  -- if your CSV file includes headers, start from the 2nd row
);
