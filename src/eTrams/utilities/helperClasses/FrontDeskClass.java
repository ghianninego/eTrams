package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import eTrams.utilities.databaseUtilities.SQLOperations;

public class FrontDeskClass {

	public static int register(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.login(connection);
		ResultSet rs = null;
		try {
			ps.setString(1, request.getParameter("username"));
			ps.setString(2, request.getParameter("password"));
			rs = ps.executeQuery();
			if (rs == null)
			{
				return 0;
			}
			else 
			{
				rs.next();
				ManageParticipantsClass.addParticipant(request, Integer.toString(rs.getInt(1)), connection);
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}
}
