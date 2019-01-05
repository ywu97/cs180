-- general.sql
-- Observe that many equivalent answers exist.
-- The other constraints two could also be named, but don't have to be.

-- Order quantity is positive.
ALTER TABLE Orders ADD CONSTRAINT positive_quantity CHECK ( quantity > 0 );

-- You can't order a book before it's published.
ALTER TABLE Books ADD CHECK ( lastOrderDate >= pubdate );

-- You can't be a current member unless you've actually joined.
ALTER TABLE Members ADD CHECK ( ( joinDate IS NOT NULL ) OR ( isCurrentMember IS NULL ) );

-- alternatively :
-- ALTER TABLE Members ADD CHECK ( joinDate IS NOT NULL OR isCurrentMember IS NULL ); -- parentheses are optional in this case.
-- ALTER TABLE Members ADD CHECK ( joinDate IS NOT NULL OR (  joinDate IS NULL AND isCurrentMember IS NULL ) );
