/* Caleb MacQueen 10/23/2018 Initiated Project */
USE disk_inventory
GO

--Insert a row into Artist table
--DROP PROC SPinsertArtist
CREATE PROC SPinsertArtist
@FN VARCHAR(20), @LN VARCHAR(40), @T VARCHAR(15)
AS
BEGIN TRY
	INSERT Artist (Artist_First_Name, Artist_Last_Name, Artist_Type)
	VALUES (@FN, @LN, @T)
END TRY
BEGIN CATCH
	PRINT 'There seems to be a problem'
END CATCH
GO

--Execute prior stored procedure
EXEC SPinsertArtist 'Johnathan', 'Smith', 'Soloist'
GO

--Update a row in the Artist Table
--DROP PROC SPupdateArtist
CREATE PROC SPupdateArtist
@D VARCHAR(255), @ID INT, @FN VARCHAR(20), @LN VARCHAR(40)
AS
BEGIN TRY
	UPDATE Artist
	SET Artist_Desc = @D
	WHERE Artist_ID = @ID AND Artist_First_Name = @FN AND Artist_Last_Name = @LN
END TRY
BEGIN CATCH
	PRINT 'There seems to be an error'
END CATCH
GO

--Execute prior stored procedure
EXEC SPupdateArtist 'So low that you cannot hear him', @@IDENTITY, 'Johnathan', 'Smith' --@@IDENTITY for if the script is being run multiple times in testing
GO

--Delete a row from the Artist table
CREATE PROC SPdeleteArtist
@ID INT
AS
BEGIN TRY
	DELETE FROM Artist
	WHERE Artist_ID = @ID
END TRY
BEGIN CATCH
	PRINT 'There seems to be an error'
END CATCH
GO

--Execute prior stored procedure
EXEC SPdeleteArtist @@IDENTITY
GO

--Insert a row into the Borrowers table
CREATE PROC SPinsertBorrower
@FN VARCHAR(60), @LN VARCHAR(20), @P VARCHAR(10)
AS
BEGIN TRY
	INSERT Borrowers (Borrower_Name, BorrowerLName, Borrower_Phone)
	VALUES (@FN, @LN, @P)
END TRY
BEGIN CATCH
	PRINT 'There seems to be an error'
END CATCH
GO

--Execute prior stored procedure
EXEC SPinsertBorrower 'Johnathan', 'Smith', '123-4567'
GO

--Update a row in the Borrowers table
--DROP PROC SPupdateBorrower
CREATE PROC SPupdateBorrower
@ID INT, @FN VARCHAR(60), @LN VARCHAR(20)
AS
BEGIN TRY
	UPDATE Borrowers
	SET Borrower_Name = @FN,
	BorrowerLName = @LN
	WHERE Borrower_ID = @ID
END TRY
BEGIN CATCH
	PRINT 'There seems to be an error'
END CATCH
GO

--Execute prior stored procedure
EXEC SPupdateBorrower @@IDENTITY, 'John', 'Smythe'
GO

--Delete a row from the borrowers table
CREATE PROC SPdeleteBorrower
@ID INT
AS
BEGIN TRY
	DELETE FROM Borrowers
	WHERE Borrower_ID = @ID
END TRY
BEGIN CATCH
	PRINT 'There seems to be an error'
END CATCH
GO

--Execute prior stored procedure
EXEC SPdeleteBorrower @@IDENTITY
GO

--Insert a row into the CD table
CREATE PROC SPinsertCD
@N VARCHAR(70), @S VARCHAR(12), @G VARCHAR(30), @RD date
AS
BEGIN TRY
	INSERT CD (CD_name, StatusType, Genre, Release_Date)
	VALUES (@N, @S, @G, @RD)
END TRY
BEGIN CATCH
	PRINT 'There seems to be an error'
END CATCH
GO

--Execute prior stored procedure
EXEC SPinsertCD 'Best of Robert', 'Borrowed', 'Country', '1990-04-04'
GO

--Update a row in the CD table
CREATE PROC SPupdateCD
@ID INT, @N VARCHAR(70), @S VARCHAR(12), @G VARCHAR(30), @RD date
AS
BEGIN TRY
	UPDATE CD
	SET CD_name = @N,
	StatusType = @S,
	Genre = @G,
	Release_Date = @RD
	WHERE CD_ID = @ID

END TRY
BEGIN CATCH
	PRINT 'There seems to be an error'
END CATCH
GO

--Execute prior stored procedure
EXEC SPupdateCD @@IDENTITY, 'The Best of Robert', 'Destroyed', 'Country', '1991-04-05'
GO

--Delete a row from the CD table
CREATE PROC SPdeleteCD
@ID INT
AS
BEGIN TRY
	DELETE FROM CD
	WHERE CD_ID = @ID
END TRY
BEGIN CATCH
	PRINT 'There seems to be an error'
END CATCH
GO

--Execute prior stored procedure
EXEC SPdeleteCD @@IDENTITY
GO