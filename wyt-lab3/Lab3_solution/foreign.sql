-- foreign.sql
-- Observe that many equivalent answers exist.

-- Data about the book author must exist in Authors before you can add a book in Books.
ALTER TABLE Books ADD FOREIGN KEY (authorID) REFERENCES Authors(authorID);

-- You can't order a book not appearing in the Books relation.
ALTER TABLE Orders ADD FOREIGN KEY (bookID) REFERENCES Books(bookID);

-- Only members (past or present) can review books.
ALTER TABLE Reviews ADD FOREIGN KEY (reviewerID) REFERENCES Members(memberID);
