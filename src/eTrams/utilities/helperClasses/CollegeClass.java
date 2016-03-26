package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import eTrams.utilities.databaseUtilities.SQLOperations;

public class CollegeClass {
	
	public static ResultSet retrieveColleges(Connection connection)
	{	
		PreparedStatement ps = SQLOperations.selectCollege(connection);
		ResultSet rs = null;
		try {
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}