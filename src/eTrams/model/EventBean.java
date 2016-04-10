package eTrams.model;

import java.io.Serializable;

public class EventBean implements Serializable {
	  
	 private int sessionID;
	 private String seminarName;
	 private String sessionName;
	 private String venueName;
	 private String venueRemarks;
	 private int capacity;
	 private String date;
	 private String startTime;
	 private String endTime;
	 private String speakerName;
	 private int completion;
	// private String active;
	public int getSessionID() {
		return sessionID;
	}
	public void setSessionID(int sessionID) {
		this.sessionID = sessionID;
	}
	public String getSeminarName() {
		return seminarName;
	}
	public void setSeminarName(String seminarName) {
		this.seminarName = seminarName;
	}
	public String getSessionName() {
		return sessionName;
	}
	public void setSessionName(String sessionName) {
		this.sessionName = sessionName;
	}
	public String getVenueName() {
		return venueName;
	}
	public void setVenueName(String venueName) {
		this.venueName = venueName;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getSpeakerName() {
		return speakerName;
	}
	public void setSpeakerName(String speakerName) {
		this.speakerName = speakerName;
	}
	public int getCompletion() {
		return completion;
	}
	public void setCompletion(int completion) {
		this.completion = completion;
	}
}
