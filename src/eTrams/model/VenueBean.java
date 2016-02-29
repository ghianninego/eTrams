package eTrams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import eTrams.utilities.beanUtilities.BeanInterface;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class VenueBean implements BeanInterface {

	private int venueID;
	private String venueName;
	private int active;
	
	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("Venue Bean");
	}

	@Override
	public int storeToDatabase(Connection connection) {

		PreparedStatement ps = SQLOperations.createNewVenue(connection);
		try
		{
			ps.setString(1, getVenueName());
			ps.setInt(2, 1);
			
			if (ps.executeUpdate() > 0)
			{
				connection.commit();
				return 1;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	public int getVenueID() {
		return venueID;
	}

	public void setVenueID(int venueID) {
		this.venueID = venueID;
	}

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
	
	
}
