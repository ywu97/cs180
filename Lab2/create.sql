DROP SCHEMA Lab2 CASCADE ;
CREATE SCHEMA Lab2 ;

CREATE TABLE Authors (
  authorID          INTEGER PRIMARY KEY,
  authorName        VARCHAR(30),
  address           VARCHAR(30),
  numBooksWritten   INTEGER,
  mostRecentPubDate DATE
) ;


CREATE TABLE Books (
  bookID        CHAR(6) PRIMARY KEY,
  authorID      INTEGER,
  bookName      VARCHAR(30),
  publisherID   INTEGER NOT NULL,
  pubDate       DATE,
  price         DECIMAL(6,2),
  category      CHAR(1),
  lastOrderDate DATE,
  totalOrdered  INTEGER,
  UNIQUE(authorID,bookName)
) ;


CREATE TABLE Publishers (
  publisherID   INTEGER PRIMARY KEY,
  publisherName VARCHAR(30),
  address       VARCHAR(30),
  UNIQUE(publisherName)
) ;


CREATE TABLE Members (
  memberID        INTEGER PRIMARY KEY,
  memberName      VARCHAR(30),
  joinDate        DATE,
  renewalDate     DATE,
  isCurrentMember BOOLEAN,
  UNIQUE(memberName, joinDate)
) ;


CREATE TABLE Orders (
  memberID  INTEGER,
  bookID    CHAR(6),
  orderDate DATE,
  quantity  INTEGER NOT NULL,
  PRIMARY KEY (memberID, bookID, orderDate)
) ;


CREATE TABLE Reviews (
  reviewerID  INTEGER,
  bookID      CHAR(6),
  reviewDate  DATE,
  reviewStars INTEGER NOT NULL,
  PRIMARY KEY (reviewerID, bookID)
) ;
