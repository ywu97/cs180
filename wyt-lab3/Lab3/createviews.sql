CREATE VIEW GreatPublishers AS
SELECT b.PublisherID, COUNT(r.bookID) AS numReviewedPublished 
FROM Reviews r, Books b
WHERE r.bookID = b.bookID  
GROUP BY b.PublisherID
HAVING COUNT(b.publisherID) >= 2
       AND every(r.reviewstars >=3);

--SELECT *
--FROM GreatPublishers;


CREATE VIEW BadBookTotals AS
SELECT b.bookID, b.totalOrdered, SUM(o.quantity)AS badQuantitySum
FROM Books b, Orders o
WHERE o.bookID = b.bookID
GROUP BY b.bookID, b.totalOrdered
HAVING b.totalOrdered <> SUM(o.quantity);

--SELECT *
--FROM BadBookTotals;


