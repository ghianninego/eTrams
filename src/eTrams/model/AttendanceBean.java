package eTrams.model;

import java.sql.Connection;

import eTrams.utilities.beanUtilities.BeanInterface;

public class AttendanceBean implements BeanInterface {
	
	private int attendanceID;
	private int sessionID;
	private int participantID;
	private java.sql.Time timeIn;
	private java.sql.Time timeOut;
	private String status;
	private int certification;
	
	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int storeToDatabase(Connection connection) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int getAttendanceID() {
		return attendanceID;
	}
	public void setAttendanceID(int attendanceID) {
		this.attendanceID = attendanceID;
	}
	public int getSessionID() {
		return sessionID;
	}
	public void setSessionID(int sessionID) {
		this.sessionID = sessionID;
	}
	public int getParticipantID() {
		return participantID;
	}
	public void setParticipantID(int participantID) {
		this.participantID = participantID;
	}
	public java.sql.Time getTimeIn() {
		return timeIn;
	}
	public void setTimeIn(java.sql.Time timeIn) {
		this.timeIn = timeIn;
	}
	public java.sql.Time getTimeOut() {
		return timeOut;
	}
	public void setTimeOut(java.sql.Time timeOut) {
		this.timeOut = timeOut;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCertification() {
		return certification;
	}
	public void setCertification(int certification) {
		this.certification = certification;
	}
	
	
}
