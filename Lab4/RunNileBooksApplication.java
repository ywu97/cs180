import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the NileBooksApplication class
 * in a similar manner to the sample RunStoresApplication.java program.
*/


public class RunNileBooksApplication
{
    public static void main(String[] args) {
    	
    	NileBooksApplication n;
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username
            // and password for your Postgres account in the arguments of the
            // getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps180-db.lt.ucsc.edu/ywu97",
                                                     "ywu97",
                                                     "password");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the NileBooksApplication class
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
            
            n = new NileBooksApplication(connection);
           
            try {
            	int numberReviewedBooks = 3;
            	List<Integer> authorsIDResult = new ArrayList<>();
            	authorsIDResult = n.getAuthorsWithManyReviewedBooks(numberReviewedBooks);
            	System.out.println("====================================");
		        System.out.println("Output of Q1: " + authorsIDResult);
            	
            } catch(Exception e) {
            	e.printStackTrace();
            }
           
            System.out.println("====================================");
            try {
		        int r = 0;            	
            	int aPublisherIDtoFix = 94519;
            	r = n.fixTotalOrdered(94519);
                System.out.println("====================================");  
	  	        System.out.println("Output of Q2: " + r);
            	
            } catch(Exception e) {
            	e.printStackTrace();
            }
            System.out.println("====================================");
            
            
            
            System.out.println("====================================");
            try {
	            int test1 = 0;
	            test1 = n.increasePublishersPrices(98035, 2);
	            System.out.println("Output of Q3: " + test1);
	            
	            int test2 = 0;
	            test2 = n.increasePublishersPrices(98035, 4);
	            System.out.println("Output of Q3: " + test2);
            } catch(Exception e) {
            	e.printStackTrace();
            }
            System.out.println("====================================");
            
            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e); 
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
