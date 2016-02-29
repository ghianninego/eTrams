package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import eTrams.model.SessionBean;
import eTrams.utilities.beanUtilities.BeanFactory;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class SessionClass {

	public static int createSession(HttpServletRequest request, Connection connection)
	{
		int speakerID = Integer.parseInt(request.getParameter("sessionSpeaker")); //speaker during the session
		int seminarID = Integer.parseInt(request.getParameter("seminarID"));
		String seminarName = request.getParameter("sessionName");
		int venueID = Integer.parseInt(request.getParameter("sessionVenue"));
		String venueRemarks = request.getParameter("venueRemarks");
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		java.sql.Date date = java.sql.Date.valueOf(TimeDateConverterClass.convertToSQLDateFormat(request.getParameter("sessionDate")));
		java.sql.Time startTime = java.sql.Time.valueOf(TimeDateConverterClass.convertToSQLTimeFormat(request.getParameter("sessionTimeIn")));
		java.sql.Time endTime = java.sql.Time.valueOf(TimeDateConverterClass.convertToSQLTimeFormat(request.getParameter("sessionTimeOut")));
		
 		//temporary seminar id and creator ID
		SessionBean sb = (SessionBean)BeanFactory.getBean(0, seminarID, seminarName, venueID, venueRemarks, capacity, date, startTime, endTime, speakerID, 0, 1);
		
		if (sb.storeToDatabase(connection) > 0)
			return 1;
		else
			return 0;
	}
	
	public static ResultSet retrieveSessions(Connection connection, int seminarID)
	{
		PreparedStatement ps = SQLOperations.selectSession(connection);
		ResultSet rs = null;
		try {
			ps.setInt(1, seminarID);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public static int editSession(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.updateSession(connection);
		try {
			ps.setString(1, request.getParameter("sessionName"));
			ps.setInt(2, Integer.parseInt(request.getParameter("sessionVenue")));
			ps.setString(3, request.getParameter("venueRemarks"));
			ps.setInt(4, Integer.parseInt(request.getParameter("capacity")));
			ps.setDate(5, java.sql.Date.valueOf(TimeDateConverterClass.convertToSQLDateFormat(request.getParameter("sessionDate"))));
			ps.setTime(6, java.sql.Time.valueOf(TimeDateConverterClass.convertToSQLTimeFormat(request.getParameter("sessionTimeIn"))));
			ps.setTime(7, java.sql.Time.valueOf(TimeDateConverterClass.convertToSQLTimeFormat(request.getParameter("sessionTimeOut"))));
			ps.setInt(8, Integer.parseInt(request.getParameter("sessionSpeaker")));
			ps.setInt(9, Integer.parseInt(request.getParameter("sessionID")));
			if (ps.executeUpdate() > 1)
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
	
	public static int deleteSession(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.deleteSession(connection);
		try
		{
			ps.setInt(1, Integer.parseInt(request.getParameter("sessionID")));
			
			if (ps.executeUpdate() > 1)
				return 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return 0;
	}
	
	public static ResultSet retrieveCoordinators(Connection connection)
	{
		PreparedStatement ps = SQLOperations.selectCoordinators(connection);
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
