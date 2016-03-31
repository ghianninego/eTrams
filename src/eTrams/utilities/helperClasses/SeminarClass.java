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
	
	public static int deleteSeminar(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.deleteSeminar(connection);
		try
		{
			ps.setInt(1, Integer.parseInt(request.getParameter("seminarID")));
			System.out.println(request.getParameter("seminarID"));
			if (ps.executeUpdate() > 0)
			{
				connection.commit();
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public static void completeSeminar(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.countSessions(connection);
		PreparedStatement ps2 = SQLOperations.countSessionsC(connection);
		
 		try
		{
 			ResultSet allSeminar = SQLOperations.selectSeminar(connection).executeQuery();	
 			
 			while(allSeminar.next()){
 				ps.setInt(1, allSeminar.getInt(1));
 				ps2.setInt(1, allSeminar.getInt(1));
 				ResultSet notComplete = ps.executeQuery();
 				ResultSet complete = ps2.executeQuery();
 				notComplete.next();complete.next();
 				if(notComplete.getInt(1)== complete.getInt(1)){
 					PreparedStatement q = SQLOperations.updateSeminarStatus(connection);
 					q.setInt(1, 1);
 					q.setInt(2, allSeminar.getInt(1));
 					if(q.executeUpdate()>0){
 						connection.commit();
 					}
 				} else{
 					PreparedStatement q = SQLOperations.updateSeminarStatus(connection);
 					q.setInt(1, 0);
 					q.setInt(2, allSeminar.getInt(1));
 					if(q.executeUpdate()>0){
 						connection.commit();
 					}
 				}
 				
 				
 			}
 			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
