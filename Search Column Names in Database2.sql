/*
Return Column names that occur in the DB
18/11/2021
S.Duffy
*/

--SET THE SEARCH TERM HERE
DECLARE @FindThisColumn AS VARCHAR(100) = 'Operating'


SELECT      TABLE_CATALOG AS 'DB',
			TABLE_SCHEMA AS 'Schema',
			COLUMN_NAME AS 'ColumnName'
            ,TABLE_NAME AS  'TableName'
FROM        INFORMATION_SCHEMA.COLUMNS
WHERE       COLUMN_NAME LIKE '%'+ @FindThisColumn +'%'
ORDER BY    [Schema],TableName
            ,ColumnName;



		