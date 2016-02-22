package eTrams.model;

import java.sql.Connection;

import eTrams.utilities.beanUtilities.BeanInterface;
// session bean for sessions of a seminar
public class SessionBean implements BeanInterface{
	
	private int sessionID;
	private int seminarID;
	private String seminarName;
	private int venueID;
	private String venueRemarks;
	private int capacity;
	private java.sql.Date date;
	private java.sql.Time startTime;
	private java.sql.Time endTime;
	private int speakerID;
	private int completion;
	private int active;

	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("Session Bean");
	}

	@Override
	public int storeToDatabase(Connection connection) {
		// TODO Auto-generated method stub
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

	public String getSeminarName() {
		return seminarName;
	}

	public void setSeminarName(String seminarName) {
		this.seminarName = seminarName;
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
	public int getSpeakerID() {
		return speakerID;
	}

	public void setSpeakerID(int speakerID) {
		this.speakerID = speakerID;
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
