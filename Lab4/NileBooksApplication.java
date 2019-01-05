import java.sql.*;
import java.util.*;


public class NileBooksApplication {

    private Connection connection;

    /*
     * Constructor
     */
    public NileBooksApplication(Connection connection) {
        this.connection = connection;
    }

    public Connection getConnection(){
        return connection;
    }


    /*
     	getAuthorsWithManyReviewedBooks: This method has an integer argument called
		numberReviewedBooks, and returns the authorID for each author in Authors that has at
		least numberReviewedBooks different books that have at least one review. A value for
		numberReviewedBooks that not greater than 0 is an error.
     */
    	
    public List<Integer> getAuthorsWithManyReviewedBooks(int numberReviewedBooks){
        List<Integer> result = new ArrayList<Integer>();
        
	// your code here

        try (Statement st = this.connection.createStatement();
             ResultSet cr = st.executeQuery("SELECT a.authorID FROM Authors a, Books b, Reviews r WHERE a.authorID = b.authorID AND b.bookID = r.bookID GROUP BY a.authorID HAVING COUNT(DISTINCT r.bookID) >= " + numberReviewedBooks);) {
       	
        	while (cr.next()) {
        		int id = cr.getInt(1);
        		result.add(id);
		      //System.out.println(id);
        	}
        	
        	cr.close();
        	st.close(); 
        		
        } catch (SQLException e) {
        	System.out.println("Q1 Exception: " + e); 
        	e.printStackTrace();
			System.exit(-1);
        }
        return result;
    }


 

    public int fixTotalOrdered(int aPublisherIDtoFix)
    {
		int r = 0;	
			// your code here;
		String sqlstr = "UPDATE Books SET totalOrdered = b.badQuantitySum FROM BadBookTotals b WHERE b.bookID = Books.bookID AND Books.publisherID = " +  aPublisherIDtoFix;
		try{
			PreparedStatement st = connection.prepareStatement(sqlstr);
			r = st.executeUpdate();
			//System.out.println(r);		
			
		} catch(SQLException e) {
			System.out.println("Q2 Exception: " + e); 
			e.printStackTrace();
			System.exit(-1);
		}

			// end of your code
		return r; 
    }


   

    public int increasePublishersPrices(int thePublisherID, int theCount)
    {
        // There's nothing special about the name storedFunctionResult
        int storedFunctionResult = 0;
	    if (theCount < 0 ){
		    System.out.println("theCount cannot be smaller then 0");
		    return 0;
	    }
	    String sqlstr = "SELECT * FROM increasePricesFunction(?,?)";
        // your code here
        try {
		    PreparedStatement st = connection.prepareStatement(sqlstr);
		    st.setInt (1, thePublisherID);
		    st.setInt(2, theCount);
		    ResultSet results = st.executeQuery();
		    results.next();
		    storedFunctionResult = results.getInt(1);
    		
    	} catch(SQLException e) {
        	System.out.println("Q3 Exception " + e); 
        	e.printStackTrace();
			System.exit(-1);
    	}

        // end of your code
        return storedFunctionResult;

    }

};
