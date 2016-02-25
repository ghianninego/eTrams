package eTrams.utilities.helperClasses;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import eTrams.model.SeminarBean;
import eTrams.utilities.beanUtilities.BeanFactory;

public class SeminarClass {
	
	public static int createSeminar(HttpServletRequest request, Connection connection, int accountID)
	{
		int creatorID = accountID;
		String seminarName = request.getParameter("seminar_name");
		String description = request.getParameter("seminar_topic");
		java.sql.Date dateOfCreation = new java.sql.Date(new java.util.Date().getTime());
		int completion = 0;
		int active = 1;
		
		SeminarBean sb = (SeminarBean)BeanFactory.getBean(0, creatorID, seminarName, description, dateOfCreation, completion, active);
		
		if (sb.storeToDatabase(connection) > 0)
			return 1;
		else
			return 0;
	}
	
	public static ArrayList<> retrieveSeminars(Connection connection)
	{
		
	}
}
