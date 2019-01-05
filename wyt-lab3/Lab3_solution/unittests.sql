-- unittests.sql
-- Observe that many equivalent correct answers exist.

-- ================================== --
-- =  FOREIGN KEY CONSTRAINT TESTS  = --
-- ================================== --

-- Tests 'ALTER TABLE Books ADD FOREIGN KEY (authorID) REFERENCES Authors(authorID)i'.
-- Fails because authorID 600 does not currently reference an atuhor in the Authors relation.
INSERT INTO Books Values ('wutttt',600,'Walk Among Us',92152,'1682-11-14',9300.65,'F','2018-01-11',19);

-- Tests 'ALTER TABLE Orders ADD FOREIGN KEY (bookID) REFERENCES Books(bookID)'.
-- Fails because bookID lollll does not currently reference a book in the Books relation.
INSERT INTO Orders Values (4843,'lollll','2006-03-04',6);

-- Tests 'ALTER TABLE Reviews ADD FOREIGN KEY (reviewerID) REFERENCES Members(memberID)'.
-- Fails because reviewerID 9999 does not currently reference a member in the Members relation.
INSERT INTO Reviews Values (9999,'ccfyls','2006-05-26',5);


-- ============================== --
-- =  GENERAL CONSTRAINT TESTS  = --
-- ============================== --

-- ==============================
-- Testing 'ALTER TABLE Orders ADD CONSTRAINT positive_quantity CHECK ( quantity > 0 )' 

-- Updating order for member 4444 on book ccfyls 
-- with new quantity 99 and order date 2006-03-05.
UPDATE Orders
SET    quantity  = 99, 
       orderDate = '2006-03-05'
WHERE  memberID  = 4444
AND    bookID    = 'ccfyls'; --passes

-- Updating order for member 4843 on book ccfyls 
-- with new quantity -99 and order date 2006-03-05.
-- Fails because quantity is not positive.
UPDATE Orders
SET    quantity  = 0 ,
       orderDate = '2006-03-06'
WHERE  memberID  = 4843
AND    bookID    = 'ccfyls' ; --fails

-- ==============================
-- Testing 'ALTER TABLE Books ADD CHECK ( lastOrderDate >= pubdate )'

-- Updating data for book bbbbbb with new 
-- lastOrderDate 2018-01-11.
UPDATE Books
SET    lastOrderDate = '2018-01-11'
WHERE  bookID ='bbbbbb'; --passes

-- Updating data for book bbbbbb with new 
-- lastOrderDate 2011-01-01.
-- Fails because 2011-01-01 occurs before
-- the publication date for bbbbbb, 
-- which is 2011-01-31.
UPDATE Books
SET    lastOrderDate = '2011-01-01'
WHERE  bookID ='bbbbbb'; --fails

-- ==============================
-- Testing 'ALTER TABLE Members ADD CHECK ( ( joinDate IS NOT NULL ) OR ( isCurrentMember IS NULL ) )'

-- Updating data for member 4843 with new 
-- isCurrentMember status NULL.
UPDATE Members
SET    isCurrentMember = NULL
WHERE  memberid = 4843; --passes

-- Updating data for member 8000 with new 
-- joinDate null.
-- Fails because isCurrentMember is not null.
UPDATE Members
SET    joinDate = NULL
WHERE  memberID = 8000; --fails
