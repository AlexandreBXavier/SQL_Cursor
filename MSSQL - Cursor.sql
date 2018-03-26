/*******************************************************************************
 MSSQL - Transact-SQL - Sample 02
 Subject: Using cursor
 Attention: Run the Sample 01, but it is important not to delete the records or the table 
*******************************************************************************/

-- Choosing the Database
-- If it does not exist, you must create
USE Samples
GO

-- Declaring the variables
DECLARE @idContact		INT
DECLARE @nameContact	VARCHAR(30)
DECLARE @cellPhone		VARCHAR(11)
DECLARE @dateBirth		DATETIME

-- Declaring a cursor
DECLARE Contacts_cursor CURSOR FOR SELECT idContact FROM Contacts (NOLOCK)  

-- Opening the course
OPEN Contacts_cursor  

-- Placed on the first record
FETCH NEXT FROM Contacts_cursor INTO @idContact

-- Looping
WHILE @@FETCH_STATUS = 0  
BEGIN      
	-- Making a query with the id
    SELECT @nameContact = Contacts.nameContact
	FROM Contacts (NOLOCK)
    WHERE Contacts.idContact = @idContact  

	-- Printing names
    PRINT @nameContact  
	     
	-- Placed on the Next record
	FETCH NEXT FROM Contacts_cursor INTO @idContact
END 

-- Closing the cursor  
CLOSE Contacts_cursor

-- Destroying the cursor 
DEALLOCATE Contacts_cursor