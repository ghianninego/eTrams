package eTrams.utilities.helperClasses;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import eTrams.model.SessionBean;
import eTrams.utilities.beanUtilities.BeanFactory;

public class SessionClass {

	public static int createSession(HttpServletRequest request, Connection connection)
	{
		int seminarID = Integer.parseInt(request.getParameter("seminarID"));
		String seminarName = request.getParameter("session_name");
		int venueID = Integer.parseInt(request.getParameter("session_id"));
		String venueRemarks = request.getParameter("venueRemarks");
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		java.sql.Date date = java.sql.Date.valueOf(request.getParameter("session_date"));
		java.sql.Time startTime = java.sql.Time.valueOf(request.getParameter("startTime"));
		java.sql.Time endTime = java.sql.Time.valueOf(request.getParameter("endTime"));
		String speaker = request.getParameter("speaker");
		//temporary seminar id and creator ID
		SessionBean sb = (SessionBean)BeanFactory.getBean(0, 1, seminarName, venueID, venueRemarks, capacity, date, startTime, endTime, speaker, 0, 1);
		
		if (sb.storeToDatabase(connection) > 0)
			return 1;
		else
			return 0;
	}
}
