BEGIN TRANSACTION;

ALTER TABLE Orders
ADD CONSTRAINT positive_quantity CHECK (quantity > 0);

ALTER TABLE Books
ADD CHECK (lastOrderDate >= pubDate);

ALTER TABLE Members
ADD CHECK (joinDate is NOT NULL OR isCurrentMember is NULL);

COMMIT;
