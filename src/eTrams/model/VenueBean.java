package eTrams.model;

import java.sql.Connection;

import eTrams.utilities.beanUtilities.BeanInterface;

public class VenueBean implements BeanInterface {

	private int venueID;
	private String venueName;
	
	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("Venue Bean");
	}

	@Override
	public int storeToDatabase(Connection connection) {
		// TODO Auto-generated method stub
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
	
	
}
