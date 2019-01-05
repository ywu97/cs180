BEGIN TRANSACTION;

UPDATE Members m
SET memberName = n.memberName, renewalDate = n.renewalDate
FROM NewMemberships n
WHERE m.memberID = n.memberID;


INSERT INTO Members (memberID, memberName, joinDate, renewalDate, isCurrentMember)
SELECT n.memberID, n.memberName, CURRENT_DATE, n.renewalDate,'TRUE'
FROM NewMemberships n 
WHERE n.memberID NOT IN (SELECT m.memberID FROM Members m);

COMMIT;
