package eTrams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import eTrams.utilities.beanUtilities.BeanInterface;
import eTrams.utilities.databaseUtilities.SQLOperations;
// session bean for sessions of a seminar
public class SessionBean implements BeanInterface{
	
	private int sessionID;
	private int seminarID;
	private String sessionName;
	private int venueID;
	private String venueRemarks;
	private int capacity;
	private java.sql.Date date;
	private java.sql.Time startTime;
	private java.sql.Time endTime;
	private String speaker;
	private int completion;
	private int active;

	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("Session Bean");
	}

	@Override
	public int storeToDatabase(Connection connection) {

		PreparedStatement ps = SQLOperations.createNewSession(connection);
		try
		{
			ps.setInt(1, getSeminarID());
			ps.setString(2, getSessionName()); 
			ps.setInt(3, getVenueID());
			ps.setString(4, getVenueRemarks());
			ps.setInt(5, getCapacity());
			ps.setDate(6, getDate());
			ps.setTime(7, getStartTime());
			ps.setTime(8, getEndTime());
			ps.setString(9, getSpeaker());
			ps.setInt(10, getCompletion());
			ps.setInt(11, getActive());
			
			
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

	public int getSessionID() {
		return sessionID;
	}

	public void setSessionID(int sessionID) {
		this.sessionID = sessionID;
	}

	public int getSeminarID() {
		return seminarID;
	}

	public void setSeminarID(int seminarID) {
		this.seminarID = seminarID;
	}

	public String getSessionName() {
		return sessionName;
	}

	public void setSeminarName(String sessionName) {
		this.sessionName = sessionName;
	}

	public int getVenueID() {
		return venueID;
	}

	public void setVenueID(int venueID) {
		this.venueID = venueID;
	}

	public String getVenueRemarks() {
		return venueRemarks;
	}

	public void setVenueRemarks(String venueRemarks) {
		this.venueRemarks = venueRemarks;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public java.sql.Date getDate() {
		return date;
	}

	public void setDate(java.sql.Date date) {
		this.date = date;
	}
	public String getSpeaker() {
		return speaker;
	}

	public void setSpeaker(String speaker) {
		this.speaker = speaker;
	}

	public int getCompletion() {
		return completion;
	}

	public void setCompletion(int completion) {
		this.completion = completion;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public java.sql.Time getStartTime() {
		return startTime;
	}

	public void setStartTime(java.sql.Time startTime) {
		this.startTime = startTime;
	}

	public java.sql.Time getEndTime() {
		return endTime;
	}

	public void setEndTime(java.sql.Time endTime) {
		this.endTime = endTime;
	}
}
