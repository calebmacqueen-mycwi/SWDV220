/* Caleb MacQueen 10/19/2018 Initial Deployment */

USE disk_inventory
GO

--Adding some columns to complete required queries
INSERT Artist (Artist_First_Name, Artist_Last_Name, Artist_Type)
VALUES('Petra', ' ', 'Group')

INSERT CD_Artists
VALUES (7, 25), (8, 25), (9, 25), (10, 25)

ALTER TABLE Borrowers
	ADD BorrowerLName VARCHAR(20) NULL DEFAULT ('Smith') WITH VALUES
GO

--Starting queries for actual assignment
-- SELECT CDs and Artists associated with it
SELECT CD_Name, Release_Date, Artist_First_Name, Artist_Last_Name
FROM CD
	JOIN CD_Artists ON CD.CD_ID = CD_Artists.CD_ID
	JOIN Artist ON CD_Artists.Artist_ID = Artist.Artist_ID
WHERE Artist_Type != 'Group'
ORDER BY Artist_Last_Name, Artist_First_Name, CD_Name
GO

--Create a view that shows all individual artists
--DROP VIEW IndividualArtists
CREATE VIEW IndividualArtists
AS
SELECT Artist_ID, Artist_First_Name, Artist_Last_Name, Artist_Type
FROM Artist
--WHERE Artist_Type != 'Group'
GO

SELECT Artist_First_Name, Artist_Last_Name FROM IndividualArtists
WHERE Artist_Type != 'Group'
GO

--Show disks associated with a group artist only
SELECT CD_Name, Artist_First_Name AS 'Group Name'
FROM IndividualArtists
	JOIN CD_Artists ON CD_Artists.Artist_ID = IndividualArtists.Artist_ID
	JOIN CD ON CD_Artists.CD_ID = CD.CD_ID
WHERE Artist_Type = 'Group'
ORDER BY Artist_Type, CD.CD_Name
GO

--Show disks that have been borrowed
SELECT Borrower_Name, BorrowerLName, CD_Name
FROM Borrowers
	JOIN Loan_History ON Borrowers.Borrower_ID = Loan_History.Borrower_ID
	JOIN CD ON Loan_History.CD_ID = CD.CD_ID

--Count the times that each disk has been borrowed
SELECT Loan_History.CD_ID, CD_Name, COUNT(Loan_History.CD_ID) AS 'Times Borrowed'
FROM Loan_History
	JOIN CD ON Loan_History.CD_ID = CD.CD_ID
GROUP BY Loan_History.CD_ID, CD_NAME
ORDER BY Loan_History.CD_ID

--Show the disk that have not been returned
SELECT CD_Name, Borrowed_Date, Returned_Date, BorrowerLName
FROM CD
	JOIN Loan_History ON CD.CD_ID = Loan_History.CD_ID
	JOIN Borrowers ON Loan_History.Borrower_ID = Borrowers.Borrower_ID
WHERE Returned_Date IS NULL