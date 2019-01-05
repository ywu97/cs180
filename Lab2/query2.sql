SELECT  o.quantity, o.orderDate AS oDate
FROM Orders o,Members m
WHERE o.memberID = m.memberID
      AND m.isCurrentMember = True;

