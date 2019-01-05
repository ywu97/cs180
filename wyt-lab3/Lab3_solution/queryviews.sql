-- queryviews.sql
-- Observe (memberID,bookID) does not form a primary key in Orders.

-- required: the query
SELECT gp.publisherID, gp.numReviewedPublished, COUNT( b.bookID ) AS numBad
FROM   BadBookTotals bbt, GreatPublishers gp, Books b
WHERE  gp.publisherID = b.publisherID
AND    bbt.bookID = b.bookID
GROUP BY gp.publisherID, gp.numReviewedPublished;

-- required: pre-delete results
--   publisherid | numreviewedpublished | numbad 
--  -------------+----------------------+--------
--         31725 |                    2 |      2
--  (1 row)

-- optionally show the delete statements
DELETE FROM Orders WHERE memberID = 8844 AND bookID = 'jgzhwq' ;
DELETE FROM Orders WHERE memberID = 2161 AND bookID = 'rrrrrr' ;

-- optionally call the query again to script the results check
SELECT gp.publisherID, gp.numReviewedPublished, COUNT( b.bookID ) AS numBad
FROM   BadBookTotals bbt, GreatPublishers gp, Books b
WHERE  gp.publisherID = b.publisherID
AND    bbt.bookID = b.bookID
GROUP BY gp.publisherID, gp.numReviewedPublished;

-- required: post-delete results
--   publisherid | numreviewedpublished | numbad 
--  -------------+----------------------+--------
--         31725 |                    2 |      2
--  (1 row)
