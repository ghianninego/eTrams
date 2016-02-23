package eTrams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import eTrams.utilities.beanUtilities.BeanInterface;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class AttendanceBean implements BeanInterface {
	
	private int attendanceID;
	private int sessionID;
	private int participantID;
	private java.sql.Time timeIn;
	private java.sql.Time timeOut;
	private String status;
	private int certification;
	private java.sql.Date certificationRelease;
	
	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("Attendance Bean");
	}
	@Override
	public int storeToDatabase(Connection connection) {

		PreparedStatement ps = SQLOperations.createNewAnnouncement(connection);
		try
		{
			ps.setInt(1, getSessionID());
			ps.setInt(2, getParticipantID()); 
			ps.setTime(3, getTimeIn());
			ps.setTime(4, getTimeOut());
			ps.setString(5, getStatus());
			ps.setInt(6, getCertification());
			ps.setDate(7, getCertificationRelease());
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
	public java.sql.Date getCertificationRelease() {
		return certificationRelease;
	}
	public void setCertificationRelease(java.sql.Date certificationRelease) {
		this.certificationRelease = certificationRelease;
	}
	
	
}
