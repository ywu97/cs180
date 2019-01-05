SELECT reviewerID, bookID
FROM  Reviews
WHERE reviewStars <> 4 
AND reviewerID IN (SELECT memberID
		     FROM Members
		     WHERE isCurrentMember = True
		     AND memberName = 'John Smith')
AND bookID IN (SELECT bookID
	       FROM Books
	       WHERE bookName = 'Jane Eyre');
