BEGIN TRANSACTION;
--violates the foreign key constraints
INSERT INTO Books
VALUES('wwwwww',8788,'Hello World',92152,DATE'2018-09-09',60.00,'N',DATE'2018-09-10',10);


INSERT INTO Orders
VALUES(8080,'qweqwe',DATE'2017-03-15',6);


INSERT INTO Reviews
VALUES(1237,'wwwwww',DATE'2014-06-09',6);


--general constraints one violates constraint the other doesn't
--violates
UPDATE Orders
SET quantity = -1;

--satisfy
UPDATE Orders
SET quantity = 1
WHERE quantity <= 0;


--violates
UPDATE Books
SET lastOrderDate = pubDate - 5
WHERE lastOrderDate IS NOT NULL;

--satisfy
UPDATE Books
SET lastOrderDate = pubDate + 5
WHERE lastOrderDate IS NOT NULL;


--violates
UPDATE Members
SET joinDate = NULL
WHERE isCurrentMember = 'True';

--satisfy
UPDATE Members
SET isCurrentMember = NULL
WHERE joinDate IS NULL;


COMMIT;
