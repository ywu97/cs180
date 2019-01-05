SELECT DISTINCT m.memberID, joinDate 
FROM Members m, Reviews r
WHERE m.memberID = r.reviewerID
AND r.bookID IN (SELECT b1.bookID
		 FROM Books b1, Authors a1
		 WHERE b1.pubDate >= '2010-04-01'
		 AND b1.authorID = a1.authorID
		 AND a1.authorName = m.memberName); 
