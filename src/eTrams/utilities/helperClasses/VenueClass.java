package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import eTrams.model.VenueBean;
import eTrams.utilities.beanUtilities.BeanFactory;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class VenueClass {

	public static int createVenue(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.createNewVenue(connection);
		try {
			VenueBean vb = (VenueBean) BeanFactory.getBean(0, request.getParameter("venue"));
			
			if (vb.storeToDatabase(connection) > 1)
			{
				connection.commit();
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return 0;
	}
	
	public static ResultSet retrieveVenues(Connection connection)
	{
		PreparedStatement ps = SQLOperations.selectVenue(connection);
		ResultSet rs = null;
		try {
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public static int editVenue(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.updateVenue(connection);
		try {
			ps.setString(1, request.getParameter("venue"));
			ps.setInt(2, Integer.parseInt(request.getParameter("venueID")));
			
			if (ps.executeUpdate() > 0)
			{
				connection.commit();
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return 0;
	}
	
	public static int deleteVenue(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.deleteVenue(connection);
		try {
			ps.setInt(1, Integer.parseInt(request.getParameter("venueID")));
			
			if (ps.executeUpdate() > 0)
			{
				connection.commit();
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return 0;
	}
}
