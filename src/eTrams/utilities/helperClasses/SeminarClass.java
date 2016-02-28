package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import java.sql.PreparedStatement;

import eTrams.model.SeminarBean;
import eTrams.utilities.beanUtilities.BeanFactory;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class SeminarClass {
	
	public static int createSeminar(HttpServletRequest request, Connection connection, int accountID)
	{
		int creatorID = accountID;
		String seminarName = request.getParameter("seminarName");
		String description = request.getParameter("seminarTopic");
		java.sql.Date dateOfCreation = new java.sql.Date(new java.util.Date().getTime());
		int completion = 0;
		int active = 1;
		
		SeminarBean sb = (SeminarBean)BeanFactory.getBean(0, creatorID, seminarName, description, dateOfCreation, completion, active);
		
		if (sb.storeToDatabase(connection) > 0)
			return 1;
		else
			return 0;
	}
	
	public static ResultSet retrieveSeminars(Connection connection)
	{	
		PreparedStatement ps = SQLOperations.selectSeminar(connection);
		ResultSet rs = null;
		try {
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static int editSeminar(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.updateSeminar(connection);
		try {
			ps.setString(1, request.getParameter("seminarName"));
			ps.setString(2, request.getParameter("seminarTopic"));
			ps.setInt(3, Integer.parseInt(request.getParameter("seminarID")));
			
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
	
	public static int deleteSeminar(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.deleteSeminar(connection);
		try
		{
			ps.setInt(1, Integer.parseInt(request.getParameter("seminarID")));
			
			if (ps.executeUpdate() > 1)
				return 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return 0;
	}
}
