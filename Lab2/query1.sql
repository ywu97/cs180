SELECT DISTINCT AuthorID, AuthorName 
FROM Authors
WHERE AuthorName NOT LIKE 'S% %'
ORDER BY AuthorName DESC;



