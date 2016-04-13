package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import eTrams.security.Security;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class FrontDeskClass {

	public static int register(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.login(connection);
		ResultSet rs = null;
		
		try {
			ps.setString(1, Security.encrypt(request.getParameter("username")));
			ps.setString(2, Security.encrypt(request.getParameter("password")));
			rs = ps.executeQuery();
			if (rs == null)
			{
				return 0;
			}
			else 
			{
				rs.next();
				int sessionID = Integer.parseInt(request.getParameter("sessionID"));
				int accountID = rs.getInt(1);
				PreparedStatement ps2 = SQLOperations.updateTimeIn(connection);
				ps2.setTime(1, new java.sql.Time(new java.util.Date().getTime()));
				ps2.setInt(2, accountID);
				ps2.setInt(3, sessionID);
				if (ps2.executeUpdate() > 0)
				{
					connection.commit();
					return 1;
				}
				else
					return 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}
}
