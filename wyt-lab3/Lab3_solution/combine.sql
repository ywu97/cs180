-- combine.sql
-- Observe that many equivalent solutions exist.

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE ;

UPDATE Members
  SET memberName = n.memberName,
      renewalDate = n.renewalDate,
      isCurrentMember = TRUE
  FROM NewMemberships n
  WHERE Members.memberID = n.memberID ;

INSERT INTO Members (memberID, memberName, joinDate, renewalDate, isCurrentMember)
  SELECT n.memberID, n.memberName, CURRENT_DATE, n.renewalDate, TRUE
  FROM NewMemberships n
  WHERE NOT EXISTS
  ( SELECT *
    FROM members m
    WHERE m.memberID = n.memberID ) ;

--equivalently:
--INSERT INTO Members (memberID, memberName, joinDate, renewalDate, isCurrentMember)
--  SELECT n.memberID, n.memberName, CURRENT_DATE, n.renewalDate, TRUE
--  FROM NewMemberships n
--  WHERE n.memberID NOT IN
--    ( SELECT m.memberID
--      FROM Members m ) ;

COMMIT ;

-- 'COMMIT TRANSACTION' is fine
-- UPDATE must happen before INSERT, otherwise it will be affected by the insert
-- START instead of BEGIN, or WORK instead of TRANSACTION are acceptable
-- SET TRANSACTION ISOLATION LEVEL SERIALIZABLE ; is also fine
