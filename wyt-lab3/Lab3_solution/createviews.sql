-- createviews.sql

CREATE VIEW GreatPublishers AS
  SELECT   b.publisherID, COUNT(DISTINCT b.bookID) AS numReviewedPublished
  FROM     Books b, Reviews r
  WHERE    b.bookID = r.bookID
  GROUP BY b.publisherID
  HAVING   COUNT(DISTINCT b.bookID) >= 2 AND EVERY(r.reviewStars >= 3);

CREATE VIEW BadBookTotals AS
  SELECT   b.bookID, b.totalOrdered, SUM( o.quantity ) AS badQuantitySum
  FROM     Books b, Orders o
  WHERE    b.bookID = o.bookID
  GROUP BY b.bookID
  HAVING   b.totalOrdered <> SUM( o.quantity ) 
UNION
  SELECT   b.bookID, b.totalOrdered, 0 AS badQuantitySum
  FROM     Books b
  WHERE   b.totalOrdered <> 0
  AND NOT EXISTS
        ( SELECT    *
          FROM ORDERS o
          WHERE b.bookID = o.bookID );

--Alternatively:
--CREATE VIEW BadBookTotals AS
--  SELECT   b.bookID, b.totalOrdered, SUM( o.quantity ) AS badQuantitySum
--  FROM     Books b, Orders o
--  WHERE    b.bookID = o.bookID
--  GROUP BY b.bookID
--  HAVING   b.totalOrdered <> SUM( o.quantity ) 
--UNION
--  SELECT   b.bookID, b.totalOrdered, NULL AS badQuantitySum
--  FROM     Books b
--  WHERE   b.totalOrdered <> 0
--    AND NOT EXISTS
--      ( SELECT    *
--        FROM ORDERS o
--        WHERE b.bookID = o.bookID );
