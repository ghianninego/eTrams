package eTrams.utilities.databaseUtilities;

import java.sql.*;

import javax.sql.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;

// Data source connection to the database
// change the context lookup before accessing (wag sabog pls)
public class DatabaseDataSource {

	private static Connection connection;
	
	private DatabaseDataSource() 
	{
	
	}
	
	private static Connection getDBConnection() {
		try {
		    InitialContext context = new InitialContext();
		    DataSource dataSource = (DataSource) 
		     context.lookup("java:comp/env/jdbc/e-TRAMS-DS");
		    
		    if (dataSource != null) {
		    	connection = dataSource.getConnection();
		    	connection.setAutoCommit(false);
		    }
		} catch (NamingException e) {
		    e.printStackTrace();
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		return connection;
	 }
	
	public static Connection getConnection() {
		if (connection != null)
		{
			System.out.println("Successful connection");
			return connection;
		}
		else
		{
			System.out.println("Initial connection creation");
			connection = getDBConnection();
			return connection;
		}
	}
}