package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import eTrams.model.FinalUserBean;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class Search {
	
	public static String numberToStringDate(String x){
		switch(x.toUpperCase()){
			case "JAN":
			case "JANUARY":
				return "-01-";
			case "FEB":
			case "FEBRUARY":
				return "-02-";
			case "MAR":
			case "MARCH":
				return "-03-";
			case "APR":
			case "APRIL":
				return "-04-";
			case "MAY":
				return "-05-";
			case "JUNE":
				return "-06-";
			case "JULY":
				return "-07-";
			case "AUG":
			case "AUGUST":
				return "-08-";
			case "SEPT":
			case "SEPTEMBER":
				return "-09-";
			case "OCT":
			case "OCTOBER":
				return "-10-";
			case "NOV":
			case "NOVEMBER":
				return "-11-";
			case "DEC":
			case "DECEMBER":
				return "-12-";
			default:
				return x;
		}
	}

	public static ResultSet searchedUser(HttpServletRequest request, Connection connection) {
		try {
			PreparedStatement ps = SQLOperations.SearchName(connection);
			ps.setString(1, "%"+request.getParameter("search")+"%");
			ps.setString(2, "%"+request.getParameter("search")+"%");
			ps.setString(3, "%"+request.getParameter("search")+"%");
			ps.setString(4, "%"+request.getParameter("search")+"%");
			ps.setString(5, "%"+request.getParameter("search")+"%");
			ps.setString(6, "%"+request.getParameter("search")+"%");
			return ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static ResultSet searchedSeminar(HttpServletRequest request, Connection connection) {
		try {
			PreparedStatement ps = SQLOperations.SearchSeminar(connection);
			ps.setString(1, "%"+ request.getParameter("search")+"%");
			ps.setString(2, "%"+numberToStringDate(request.getParameter("search"))+"%");
			return ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static ResultSet searchedHistory(HttpServletRequest request, Connection connection) {
		try {
			PreparedStatement ps = SQLOperations.SearchHistory(connection);
			ps.setString(1 , request.getParameter("accountId"));
			ps.setString(2, "%"+request.getParameter("search")+"%");
			ps.setString(3, "%"+request.getParameter("search")+"%");
			ps.setString(4, "%"+request.getParameter("search")+"%");
			ps.setString(5, "%"+numberToStringDate(request.getParameter("search"))+"%");
			return ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public static ResultSet searchedMyHistory(HttpServletRequest request, Connection connection,FinalUserBean user) {
		try {
			PreparedStatement ps = SQLOperations.SearchMyHistory(connection);
			ps.setString(1 , user.getAccountID()+"");
			ps.setString(2, "%"+request.getParameter("search")+"%");
			ps.setString(3, "%"+request.getParameter("search")+"%");
			ps.setString(4, "%"+request.getParameter("search")+"%");
			ps.setString(5, "%"+numberToStringDate(request.getParameter("search"))+"%");
			return ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
