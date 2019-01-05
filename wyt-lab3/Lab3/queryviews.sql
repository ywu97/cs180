CREATE VIEW GreatPublishers AS
SELECT DISTINCT b.PublisherID, COUNT(r.bookID) AS numReviewedPublished
FROM Reviews r, Books b
WHERE r.bookID = b.bookID
GROUP BY b.PublisherID
HAVING COUNT(b.publisherID) >= 2
       AND every(r.reviewstars >=3);

CREATE VIEW BadBookTotals AS
SELECT b.bookID, b.totalOrdered, SUM(o.quantity)AS badQuantitySum
FROM Books b, Orders o
WHERE o.bookID = b.bookID
GROUP BY b.bookID, b.totalOrdered
HAVING b.totalOrdered <> SUM(o.quantity);

SELECT o. publisherID, g.numReviewedPublished,COUNT(b.bookID)AS numBad
FROM Books o, GreatPublishers g, BadBookTotals b
WHERE o.bookID = b.bookID
AND o.publisherID = g.publisherID
GROUP BY o.publisherID, g.numReviewedPublished;
-- publisherid | numreviewedpublished | numbad 
---------------+----------------------+--------
--       93209 |                    3 |      1
--       31725 |                    3 |      1
--(2 rows)


DELETE FROM Orders
WHERE memberID = 8844
AND bookID = 'jgzhwq';

DELETE FROM Orders
WHERE memberID = 2161
AND bookID = 'rrrrrr';

SELECT o. publisherID, g.numReviewedPublished,COUNT(b.bookID)AS numBad
FROM Books o, GreatPublishers g, BadBookTotals b
WHERE o.bookID = b.bookID
AND o.publisherID = g.publisherID
GROUP BY o.publisherID, g.numReviewedPublished;
-- publisherid | numreviewedpublished | numbad 
---------------+----------------------+--------
--       93209 |                    3 |      1
--(1 row)

