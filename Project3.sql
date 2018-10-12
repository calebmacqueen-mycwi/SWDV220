USE disk_inventory
GO

-- Insert information into the CD table
INSERT INTO CD (CD_name, StatusType, Genre, Release_Date)
VALUES 
('Blaze of Glory', 'Returned', 'Rock', '1994-05-07'),
('The Big Picture', 'Returned', 'Christian', '1993-01-12'),
('I 2 (Eye)', 'Returned', 'Christian', '1993-01-12'),
('The Great Adventure', 'Borrowed', 'Christian', '1992-11-18'),
('Kickin It Up', 'Borrowed', 'Country', '2008-12-23'),
('Greatist Hits', 'Borrowed', 'Country', '1985-09-16'),
('The Rock Cries Out', 'Returned', 'Christian Rock', '2008-12-4'),
('On Fire', 'Returned', 'Christian Rock', '1998-10-31'),
('Wake Up Call', 'Returned', 'Christian Rock', '2004-03-30'),
('Beyond Belief', 'Borrowed', 'Christian', '1990-06-20'),
('Unveiled Hope', 'Borrowed', 'Christian', '1997-07-15'),
('Poiema', 'Returned', 'Christian', '1994-01-01'),
('Yellowstone: The Music of Nature', 'Returned', 'New Age', '1989-12-29'),
('Giants in the Land', 'Returned', 'Christian', '2005-11-15'),
('A Beautiful Placec', 'Borrowed', 'Christian', '1993-01-01'),
('The Best of Beethoven Vol. I', 'Borrowed', 'Classical', '1990-01-01'), 
('The Best of Beethoven Vol. II', 'Borrowed', 'Classical', '1990-01-01'),
('The Best of Beethoven Vol. III', 'Returned', 'Classical', '1990-01-01'),
('The Best of Beethoven Vol. IV', 'Returned', 'Classical', '1990-01-01'),
('The Best of Beethoven Vol. V', 'Returned', 'Classical', '1990-01-01')
GO
-- update a cd to have the correct genre
UPDATE CD
SET Genre = 'Christian Rock'
WHERE CD_name = 'Beyond Belief'
GO
-- insert artists into the table
INSERT INTO Artist (Artist_First_Name, Artist_Last_Name, Artist_Type)
VALUES
('Alfred', 'Scholz', 'Conductor'),
('Zdenek', 'Kosler', 'Coductor'),
('Anton', 'Nanut', 'Conductor'),
('Bystrik', 'Rezucha', 'Conductor'),
('Libor', 'Pesek', 'Coductor'),
('Alberto', 'Lizzio', 'Conductor'),
('Magdalena', 'Paloczaj', 'Soloist'),
('Eva', 'Bandova', 'Soloist'),
('Peter', 'Kottwald', 'Soloist'),
('Josef', 'Bacek', 'Soloist'),
('Wayne', 'Watson', 'Singer'),
('Ottorino', 'Respighi', 'Singer'),
('Chip', 'Davis', 'Singer'),
('Micheal', 'Card', 'Singer'),
('Bob', 'Hartman', 'Singer'),
('John', 'Schlitt', 'Singer'),
('Greg', 'Bailey', 'Singer'),
('Christian', 'Borneo', 'Singer'),
('John', 'Lawry', 'Singer'),
('Micheal', 'Smith', 'Singer'),
('Jon Bon', 'Jovi', 'Singer'),
('George', 'Straight', 'Singer'),
('John', 'Montgomery', 'Singer'),
('Steven', 'Chapman', 'Singer')
GO
-- insert borrowers into their table
INSERT INTO Borrowers (Borrower_Name, Borrower_Phone)
VALUES
('Alex', '000-0001'),
('Ben', '111-1111'),
('Luke', '222-2222'),
('Rick', '333-3333'),
('Seth', '444-4444'),
('Han', '555-5555'),
('Riley', '666-6666'),
('John', '777-7777'),
('Abe', '888-8888'),
('Joe', '999-9999'),
('Mark', '111-2222'),
('Matt', '222-3333'),
('Peter', '333-4444'),
('Nick', '444-5555'),
('Joe', '555-6666'),
('Garret', '666-7777'),
('Indy', '777-8888'),
('Mike', '888-9999'),
('Bob', '999-1111'),
('Fred', '999-0000')
GO
--Delete a row from borrowers
DELETE Borrowers
WHERE Borrower_ID = 20
GO
-- Populate the intersect table between CD and Artists
INSERT INTO CD_Artists (CD_ID, Artist_ID)
VALUES
(1, 21),
(2, 20),
(4, 24),
(3, 20),
(7, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19),
(8, 15),
(8, 16),
(8, 17),
(8, 18),
(8, 19),
(9, 15),
(9, 16),
(9, 17),
(9, 18),
(9, 19),
(12, 14),
(13, 12),
(13, 13),
(14, 11),
(15, 11),
(20, 6),
(20, 7),
(20, 8),
(20, 9),
(20, 10),
(19, 5),
(19, 1),
(18, 3),
(18, 4),
(5, 23),
(6, 22),
(10, 15),
(10, 16),
(10, 17),
(10, 18),
(10, 19),
(11, 14),
(17, 1),
(17, 2),
(16, 1)
GO
-- Insert data into intersect table between CD and Borrowers
INSERT INTO Loan_History (Borrower_ID, CD_ID, Borrowed_Date, Returned_Date)
VALUES
(12, 9, '2016-01-01', '2018-10-12'),
(19, 20, '2018-01-01', '2018-01-03'),
(1, 20, '2018-01-04', '2018-01-11'),
(2, 20, '2018-01-13', '2018-01-20'),
(18, 12, '2018-02-18', '2018-02-25'),
(5, 15, '2018-03-03', '2018-03-03'),
(4, 15, '2018-03-17', '2018-10-12'),
(18, 12, '2018-04-02', '2018-04-09'),
(1, 8, '2018-04-01', '2018-04-28'),
(3, 8, '2018-05-03', '2018-05-04'),
(3, 7, '2018-05-04', '2018-05-05'),
(3, 3, '2018-05-05', '2018-05-06'),
(15, 12, '2018-07-04', '2018-07-11'),
(17, 17, '2018-07-04', NULL),
(17, 16, '2018-07-04', NULL),
(16, 11, '2018-08-03', NULL),
(15, 10, '2018-09-10', NULL),
(14, 6, '2018-10-09', NULL),
(13, 5, '2018-10-08', NULL),
(12, 4, '2018-10-12', NULL)
GO
--Get a list of disks that still need to be returned
SELECT *
FROM Loan_History
WHERE Returned_Date IS NULL
GO