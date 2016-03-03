package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import eTrams.utilities.databaseUtilities.SQLOperations;

public class ManageParticipantsClass {

	public static int addParticipant(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.createNewAttendance(connection);
		try 
		{
			String values[] = request.getParameterValues("participants");
			for (int i = 0; i < values.length; i++)
				System.out.println(values[i]);
			
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
	
	public static int setStatus(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.updateStatus(connection);
		try 
		{
			System.out.println(request.getParameter("Status"));
			System.out.println(request.getParameter("attendanceID"));
			String status = request.getParameter("Status");
			int attendanceID = Integer.parseInt(request.getParameter("attendanceID"));
			
			ps.setString(1, status);
			ps.setInt(2, attendanceID);
			
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
}
