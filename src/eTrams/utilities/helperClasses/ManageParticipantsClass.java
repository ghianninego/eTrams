package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import eTrams.utilities.databaseUtilities.SQLOperations;

public class ManageParticipantsClass {

	public static int addParticipant(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.createNewAttendance(connection);
		try 
		{
			System.out.println(request.getParameter("participants"));
			
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
