/* Caleb MacQueen 10/05/2018 Wrote Intitial Script */
USE master
GO

IF DB_ID('disk_inventory') IS NOT NULL --Makes sure that you are allowed to create the database
DROP DATABASE disk_inventory
GO

CREATE DATABASE disk_inventory
GO

USE disk_inventory
GO

CREATE TABLE Borrowers ( -- stores information for people who may borrow a CD
	Borrower_ID INT NOT NULL IDENTITY PRIMARY KEY,
	Borrower_Name VARCHAR(60) NOT NULL,
	Borrower_Phone VARCHAR(10) NOT NULL)
CREATE TABLE Artist ( -- stores artists and actors for CD's and DVD's
	Artist_ID INT NOT NULL IDENTITY PRIMARY KEY,
	Artist_First_Name VARCHAR(20) NOT NULL,
	Artist_Last_Name VARCHAR(40) NOT NULL,
	Artist_Type VARCHAR(15) NOT NULL,
	Artist_Desc VARCHAR(255))
CREATE TABLE CD ( -- Inventory table of CDs that we have
	CD_ID INT NOT NULL IDENTITY PRIMARY KEY,
	CD_name VARCHAR(70) NOT NULL,
	StatusType VARCHAR(12) NOT NULL,
	Genre VARCHAR(30) NOT NULL,
	Release_Date DATE NOT NULL)
CREATE TABLE CD_Artists ( -- Lookup table between CD and Artist
	CD_ID INT NOT NULL FOREIGN KEY REFERENCES CD(CD_ID),
	Artist_ID INT NOT NULL FOREIGN KEY REFERENCES Artist(Artist_ID),
	PRIMARY KEY (CD_ID, Artist_ID))
CREATE TABLE Loan_History ( -- Lookup table between CD and Borrowers
	Loan_ID INT NOT NULL IDENTITY PRIMARY KEY,
	Borrower_ID INT NOT NULL FOREIGN KEY REFERENCES Borrowers(Borrower_ID),
	CD_ID INT NOT NULL FOREIGN KEY REFERENCES CD(CD_ID),
	Borrowed_Date DATETIME NOT NULL,
	Returned_Date DATETIME)
GO