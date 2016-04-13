package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import eTrams.utilities.databaseUtilities.SQLOperations;

public class ManageParticipantsClass {

	public static int addParticipant(HttpServletRequest request, String participantID, Connection connection)
	{
		PreparedStatement ps = SQLOperations.createNewAttendance(connection);
		try 
		{
			ps.setInt(1, Integer.parseInt((String)request.getSession().getAttribute("sessionID")));
			ps.setInt(2, Integer.parseInt(participantID));
			ps.setTime(3, java.sql.Time.valueOf("00:00:00"));
			ps.setTime(4, java.sql.Time.valueOf("00:00:00"));
			ps.setString(5, "Incomplete");
			ps.setInt(6, 0);
			ps.setDate(7, java.sql.Date.valueOf("1111-11-1"));
			
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
	
	public static ResultSet retrieveAllParticipantAccounts(Connection connection)
	{
		PreparedStatement ps = SQLOperations.selectParticipants(connection);
		ResultSet rs = null;
		try 
		{
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return rs;
	}
	
	
	public static ResultSet retrieveSessionParticipants(Connection connection, int sessionID)
	{
		PreparedStatement ps = SQLOperations.selectSessionParticipants(connection);
		ResultSet rs = null;
		try 
		{
			ps.setInt(1, sessionID);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return rs;
	}
	
	public static int cancelRegistration(Connection connection, int attendanceID)
	{
		PreparedStatement ps = SQLOperations.deleteAttendance(connection);
		try 
		{
			ps.setInt(1, attendanceID);
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
	
	public static int cancelRegistration2(Connection connection,HttpServletRequest request, int participantID)
	{
		PreparedStatement ps = SQLOperations.deleteAttendance2(connection);
		try 
		{
			ps.setInt(1, Integer.parseInt((String)request.getSession().getAttribute("sessionID")));
			ps.setInt(2 , participantID);
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
	
	public static int setStatus(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.updateStatus(connection);
		try 
		{
			System.out.println(request.getParameter("status"));
			System.out.println(request.getParameter("attendanceID"));
			String status = request.getParameter("status");
			int attendanceID = Integer.parseInt(request.getParameter("attendanceID"));
			
			ps.setString(1, status);
			ps.setInt(2, attendanceID);
			
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
	
	public static int setCertification(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.updateAttendanceCertification(connection);
		try 
		{
			System.out.println(request.getParameter("attendanceID"));
			int attendanceID = Integer.parseInt(request.getParameter("attendanceID"));
			
			ps.setInt(1, Integer.parseInt(request.getParameter("certification")));
			ps.setDate(2, new java.sql.Date(new java.util.Date().getTime()));
			ps.setInt(3, attendanceID);
			
			if (ps.executeUpdate() > 0)
			{
				connection.commit();
				setCertificationRelease(connection, attendanceID);
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return 0;
	}
	
	public static void setCertificationRelease(Connection connection, int attendanceID)
	{
		PreparedStatement ps = SQLOperations.updateCertificationRelease(connection);
		try 
		{
			ps.setDate(1, java.sql.Date.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())));
			ps.setInt(2, attendanceID);
			
			if (ps.executeUpdate() > 0)
				connection.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}
	
	public static int setTime(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.updateTime(connection);
		try 
		{
			System.out.println(request.getParameter("timeIn"));
			System.out.println(request.getParameter("timeOut"));
			System.out.println(request.getParameter("attendanceID"));
			java.sql.Time timeIn = java.sql.Time.valueOf(TimeDateConverterClass.convertToSQLTimeFormat(request.getParameter("timeIn")));
			java.sql.Time timeOut = java.sql.Time.valueOf(TimeDateConverterClass.convertToSQLTimeFormat(request.getParameter("timeOut")));
			int attendanceID = Integer.parseInt(request.getParameter("attendanceID"));
			
			ps.setTime(1, timeIn);
			ps.setTime(2, timeOut);
			ps.setInt(3, attendanceID);
			
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
	
	public static ResultSet filteredAttendance(Connection connection, int seminarID, String filter)
	{
		PreparedStatement ps = SQLOperations.FilterSessionsCert(connection);
		ResultSet rs = null;
		try {
			ps.setInt(1, Integer.parseInt(filter));
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public static void addMultipleParticipants(HttpServletRequest request, Connection connection)
	{
		ResultSet rs = (ResultSet)(request.getSession(false)).getAttribute("sessionDetails");
		try {
			rs.next();
			int capacity = rs.getInt(6);
			int max = 0;
			String values[] = request.getParameterValues("participants");
			if (capacity > values.length)
				max = values.length;
			else
				max = capacity;
			for (int i = 0; i < max; i++)
				addParticipant(request, values[i], connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static int countRegisteredSessionParticipants(int sessionID, Connection connection)
	{
		PreparedStatement ps = SQLOperations.countRegisteredSessionParticipants(connection);
		ResultSet rs = null;
		try {
			ps.setInt(1, sessionID);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
	public static int countSessionParticipants(int sessionID, Connection connection)
	{
		PreparedStatement ps = SQLOperations.countSessionParticipants(connection);
		ResultSet rs = null;
		try {
			ps.setInt(1, sessionID);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
}
