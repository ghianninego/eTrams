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
		String speaker = request.getParameter("sessionSpeaker"); //speaker during the session
		int seminarID; // request.getParameter("seminarID");
		String seminarName = request.getParameter("sessionName");
		int venueID = Integer.parseInt(request.getParameter("sessionVenue"));
		String venueRemarks = request.getParameter("venueRemarks");
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		java.sql.Date date = java.sql.Date.valueOf(TimeDateConverterClass.convertToSQLDateFormat(request.getParameter("sessionDate")));
		java.sql.Time startTime = java.sql.Time.valueOf(TimeDateConverterClass.convertToSQLTimeFormat(request.getParameter("sessionTimeIn")));
		java.sql.Time endTime = java.sql.Time.valueOf(TimeDateConverterClass.convertToSQLTimeFormat(request.getParameter("sessionTimeOut")));
		int speakerID = 1; // get via speaker above
 		//temporary seminar id and creator ID
		SessionBean sb = (SessionBean)BeanFactory.getBean(0, 1, seminarName, 1, venueRemarks, capacity, date, startTime, endTime, speakerID, 0, 1);
		
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
}
