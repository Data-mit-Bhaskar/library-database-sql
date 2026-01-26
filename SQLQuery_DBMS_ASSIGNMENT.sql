CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    Publisher VARCHAR(255),
    PublicationDate DATE,
    CategoryID INT,
    Pages INT,
    CopiesAvailable INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

/--Creating the 'Member' Table--/

CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    MembershipDate DATE
);

/--Creating the 'Loan' Table--/

CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

/--Indexing for Performance--/

CREATE INDEX idx_book_category ON Book(CategoryID);
CREATE INDEX idx_loan_book ON Loan(BookID);
CREATE INDEX idx_loan_member ON Loan(MemberID);

/-- Populating the Tables--/

--Category--

INSERT INTO Category (CategoryID, CategoryName) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science'),
(4, 'History'),
(5, 'Biography');

--check--

Select* from Category

--Book--

INSERT INTO Book (BookID, Title, Author, ISBN, Publisher, PublicationDate, CategoryID, Pages, CopiesAvailable) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', '9780060935467', 'Harper Perennial', '2006-05-23', 1, 324, 5),
(2, '1984', 'George Orwell', '9780451524935', 'Signet Classic', '1950-07-01', 1, 328, 4),
(3, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', '9780062316097', 'Harper', '2015-02-10', 2, 443, 3),
(4, 'A Brief History of Time', 'Stephen Hawking', '9780553380163', 'Bantam', '1998-09-01', 3, 212, 6),
(5, 'The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', '9781400052189', 'Broadway Books', '2011-03-08', 5, 381, 4),
(6, 'The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 'Scribner', '2004-09-30', 1, 180, 5),
(7, 'Thinking, Fast and Slow', 'Daniel Kahneman', '9780374533557', 'Farrar, Straus and Giroux', '2013-04-02', 2, 499, 3),
(8, 'The Selfish Gene', 'Richard Dawkins', '9780198788607', 'Oxford University Press', '2016-09-22', 3, 360, 2),
(9, 'Guns, Germs, and Steel', 'Jared Diamond', '9780393354324', 'W. W. Norton & Company', '2017-03-07', 4, 518, 5),
(10, 'Steve Jobs', 'Walter Isaacson', '9781451648539', 'Simon & Schuster', '2011-10-24', 5, 656, 3);

--check--

Select*from Book

--Member--

INSERT INTO Member (MemberID, FirstName, LastName, Email, Phone, Address, MembershipDate) VALUES
(1, 'Gizem', 'E', 'gizem.e@example.com', '555-0101', '123 Main St', '2020-01-15'),
(2, 'Aysu', 'U', 'aysu.u@example.com', '555-0102', '456 Elm St', '2020-02-20'),
(3, 'Sertac', 'C', 'sertac.c@example.com', '555-0103', '789 Oak St', '2020-03-25'),
(4, 'Daniel', 'D', 'daniel.d@example.com', '555-0104', '321 Pine St', '2020-04-10'),
(5, 'Sujit', 'S', 'sujit.s@example.com', '555-0105', '654 Cedar St', '2020-05-15'),
(6, 'Ayah', 'H', 'ayah.h@example.com', '555-0106', '987 Birch St', '2020-06-20'),
(7, 'Baseer', 'B', 'baseer.b@example.com', '555-0107', '135 Maple St', '2020-07-15'),
(8, 'Shalu', 'C', 'shalu.c@example.com', '555-0108', '246 Ash St', '2020-08-10'),
(9, 'Rishabh', 'S', 'rishabh.s@example.com', '555-0109', '357 Spruce St', '2020-09-05'),
(10, 'Tina', 'K', 'tina.k@example.com', '555-0110', '468 Fir St', '2020-10-01');

--check

Select*from Member

--Loan--

INSERT INTO Loan (LoanID, BookID, MemberID, LoanDate, DueDate, ReturnDate) VALUES
(1, 1, 1, '2024-06-01', '2024-06-15', NULL),
(2, 2, 2, '2024-06-02', '2024-06-16', NULL),
(3, 3, 3, '2024-06-03', '2024-06-17', NULL),
(4, 4, 4, '2024-06-04', '2024-06-18', '2024-06-16'),
(5, 5, 5, '2024-06-05', '2024-06-19', NULL),
(6, 6, 6, '2024-06-06', '2024-06-20', '2024-06-19'),
(7, 7, 7, '2024-06-07', '2024-06-21', NULL),
(8, 8, 8, '2024-06-08', '2024-06-22', NULL),
(9, 9, 9, '2024-06-09', '2024-06-23', '2024-06-22'),
(10, 10, 10, '2024-06-10', '2024-06-24', NULL);

--check--

Select*from Loan

--
-- Query 1: Retrieve all books borrowed by a specific member --
SELECT b.Title, b.Author, l.LoanDate, l.DueDate, l.ReturnDate
FROM Book b
JOIN Loan l ON b.BookID = l.BookID
JOIN Member m ON l.MemberID = m.MemberID
WHERE m.FirstName = 'Gizem' AND m.LastName = 'E';



-- Query 2: List all overdue books with member details --
SELECT b.Title, b.Author, m.FirstName, m.LastName, l.LoanDate, l.DueDate
FROM Book b
JOIN Loan l ON b.BookID = l.BookID
JOIN Member m ON l.MemberID = m.MemberID
WHERE l.ReturnDate IS NULL AND l.DueDate < GETDATE();

-- Query 3: Calculate total number of books in each category --
SELECT c.CategoryName, COUNT(*) AS TotalBooks
FROM Category c
JOIN Book b ON c.CategoryID = b.CategoryID
GROUP BY c.CategoryName;

-- Query 4: Find members who have borrowed more than 3 books --
SELECT m.FirstName, m.LastName, COUNT(l.BookID) AS BooksBorrowed
FROM Member m
JOIN Loan l ON m.MemberID = l.MemberID
GROUP BY m.FirstName, m.LastName
HAVING COUNT(l.BookID) > 3;

-- Query 5: Retrieve members who have overdue books currently --
SELECT DISTINCT m.FirstName, m.LastName, l.LoanDate, l.DueDate
FROM Member m
JOIN Loan l ON m.MemberID = l.MemberID
WHERE l.ReturnDate IS NULL AND l.DueDate < GETDATE();


-- Query 6: Calculate average number of pages per category --
SELECT c.CategoryName, AVG(b.Pages) AS AvgPages
FROM Category c
JOIN Book b ON c.CategoryID = b.CategoryID
GROUP BY c.CategoryName;













