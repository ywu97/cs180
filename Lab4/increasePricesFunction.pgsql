CREATE OR REPLACE FUNCTION increasePricesFunction (thePublisherID integer, theCount integer)
RETURNS INTEGER
AS $$

DECLARE
	theBookID CHAR(6);
	theCategory CHAR(1);	
	
	result integer;
	
	c CURSOR FOR 
		SELECT bookID, category FROM Books
		WHERE publisherID =  thePublisherID
		ORDER BY price DESC
		FOR UPDATE;
		
BEGIN
	result := 0;
	OPEN c;
	WHILE result < theCount 
	  LOOP
	    FETCH FROM c INTO theBookID, theCategory;
	    EXIT WHEN NOT FOUND;
	    IF theCategory = 'N' THEN
	       UPDATE Books SET price = price + 1.50  
	       WHERE CURRENT OF c;
	       result := result + 1;

	    ELSIF theCategory = 'F' THEN
	       UPDATE Books SET price = price + 2.50
	       WHERE CURRENT OF c;
	       result := result + 1; 
	    END IF;
	    

	  END LOOP;
	  CLOSE c;
	
	
	RETURN result;

END;
$$ LANGUAGE plpgsql;

