/*
========================================================
Script:        	Find tables with columns and return SELECT statements.sql

Description:   	Script to search through all tables looking for a column with wildcard characters. 
		The script will provide a simple SELECT statement for all returned tables
				
Author: 	Steven Duffy    	
Created Date:	27/09/2023  	
Version: 	1.0    	
Dependencies:	N/A  	
Database:	N/A    	
Notes:         	N/A

Weather: 	Bright sunny crisp September morning, awaiting the imminent onslaught of Storm Agnes the first storm of 2023.

========================================================
*/

/*
Change history:
Date       | Version | Changed By     | Description of Changes
-----------|---------|----------------|-------------------------
2023/09/27 | 1.0     | Steven Duffy   | Initial creation of the script.
yyyy/mm/dd | [1.x]   | [OtherName]    | [Description of Changes].
*/

/*MAIN SCRIPT*/

SELECT 
    'SELECT * FROM [' + TABLE_SCHEMA + '].[' + TABLE_NAME + '];' AS GeneratedQuery
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%group%'
GROUP BY TABLE_SCHEMA, TABLE_NAME
ORDER BY TABLE_SCHEMA, TABLE_NAME;

/* End of script. */
