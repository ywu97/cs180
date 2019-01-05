DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

CREATE TABLE Authors(
  authorID   INT,
  authorName VARCHAR(30),
  address    VARCHAR(30),
  numBooksWritten INT,
  mostRecentPubDate date,
  PRIMARY KEY(authorID)
);

CREATE TABLE Books(
  bookID CHAR(6), 
  authorID INT, 
  bookName VARCHAR(30), 
  publisherID INT, 
  pubDate date, 
  price DECIMAL(6,2), 
  category CHAR(1), 
  lastOrderDate date, 
  totalOrdered INT,
  PRIMARY KEY(bookID)
);

CREATE TABLE Publishers(
  publisherID INT, 
  publisherName VARCHAR(30), 
  address VARCHAR(30),
  PRIMARY KEY(publisherID)
);

CREATE TABLE Members(
  memberID INT, 
  memberName VARCHAR(30), 
  joinDate date, 
  renewalDate date, 
  isCurrentMember BOOLEAN,
  PRIMARY KEY(memberID)
);

CREATE TABLE Orders(
  memberID INT, 
  bookID CHAR(6), 
  orderDate date, 
  quantity INT,
  PRIMARY KEY(memberID,bookID, orderDate)
);

CREATE TABLE Reviews(
  reviewerID INT, 
  bookID CHAR(6), 
  reviewDate date, 
  reviewStars INT,
  PRIMARY KEY(reviewerID,bookID)
);
