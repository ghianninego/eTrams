package eTrams.utilities.helperClasses;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eTrams.utilities.databaseUtilities.SQLOperations;
import eTrams.utilities.helperClasses.excelHelper.excel_report_generate;

public class ReportsClass {
	
	public static int countAllSessions(Connection connection)
	{
		PreparedStatement ps = SQLOperations.countAllSessions(connection);
		try 
		{
			ResultSet rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
	public static int countAllAttendees(Connection connection)
	{
		PreparedStatement ps = SQLOperations.countAllAttendees(connection);
		try 
		{
			ResultSet rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
	public static int countAllSeminars(Connection connection)
	{
		PreparedStatement ps = SQLOperations.countAllSeminars(connection);
		try 
		{
			ResultSet rs = ps.executeQuery();
			rs.next();
			System.out.println(rs.getInt(1));
			return rs.getInt(1);
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
	public static void generateReport(HttpServletResponse response, Connection connection)
	{
		excel_report_generate.EXCEL_GENERATE(response, connection);	
	}
}
