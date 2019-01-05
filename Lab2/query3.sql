SELECT DISTINCT  a.authorName, p.publisherName
FROM Authors a, Publishers p, Books b
WHERE b.authorID = a.authorID
AND b.publisherID = p.publisherID
AND b.category = 'N'
AND b.price >= 19.99;
