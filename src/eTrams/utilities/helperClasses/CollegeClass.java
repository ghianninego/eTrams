package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import eTrams.model.CollegeBean;
import eTrams.model.DepartmentBean;
import eTrams.model.VenueBean;
import eTrams.utilities.beanUtilities.BeanFactory;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class CollegeClass {
	
	public static ResultSet retrieveColleges(Connection connection)
	{	
		PreparedStatement ps = SQLOperations.selectCollege(connection);
		ResultSet rs = null;
		try {
			rs = ps.executeQuery();
			System.out.println(rs == null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static int createCollege(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.createNewCollege(connection);
		try {
			CollegeBean cb = (CollegeBean) BeanFactory.getBean(0, request.getParameter("college"), 1);
			
			if (cb.storeToDatabase(connection) > 0)
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
	
	public static int editCollege(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.updateCollege(connection);
		try {
			ps.setString(1, request.getParameter("college"));
			ps.setInt(2, Integer.parseInt(request.getParameter("collegeID")));
			
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
	
	public static int deleteCollege(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.deleteCollege(connection);
		try {
			ps.setInt(1, Integer.parseInt(request.getParameter("collegeID")));
			
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
	
	public static ResultSet retrieveDepartments(int collegeID, Connection connection)
	{	
		PreparedStatement ps = SQLOperations.selectCollegeDepartment(connection);
		ResultSet rs = null;
		try {
			ps.setInt(1,collegeID);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static int createDepartment(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.createNewDepartment(connection);
		try {
			DepartmentBean db = (DepartmentBean) BeanFactory.getBean(0, request.getParameter("deptName"), Integer.parseInt(request.getParameter("collegeID")), 1);
			
			if (db.storeToDatabase(connection) > 0)
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
	
	public static int editDepartment(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.updateDepartment(connection);
		try {
			ps.setString(1, request.getParameter("deptName"));
			ps.setInt(2, Integer.parseInt(request.getParameter("deptID")));
			
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
	
	public static int deleteDepartment(HttpServletRequest request, Connection connection)
	{
		PreparedStatement ps = SQLOperations.deleteDepartment(connection);
		try {
			ps.setInt(1, Integer.parseInt(request.getParameter("deptID")));
			
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
}