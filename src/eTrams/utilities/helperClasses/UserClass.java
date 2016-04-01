package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import eTrams.model.AccountBean;
import eTrams.model.FinalUserBean;
import eTrams.model.UserInfoBean;
import eTrams.utilities.beanUtilities.BeanFactory;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class UserClass {

	public static int createUser(HttpServletRequest request, Connection connection) {
		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		int collegeId = Integer.parseInt(request.getParameter("collegeID"));
		int departmentId = Integer.parseInt(request.getParameter("departmentID"));
		int roleId = Integer.parseInt(request.getParameter("roleID"));
		int active = 1;
		UserInfoBean ub = (UserInfoBean) BeanFactory.getBean(0, lastName, firstName, middleName, departmentId,
				collegeId);

		if (ub.storeToDatabase(connection) > 0) {
			AccountBean uab = (AccountBean) BeanFactory.getBean(0, ub.getIdFromDatabase(connection), username,
					password, email, roleId, active);
			if (uab.storeToDatabase(connection) > 0) {
				return 1;
				
			} else {
				return 0;
			}

		} else {
			return 0;
		}

	}

	public static int deleteUser(HttpServletRequest request, Connection connection) {
		int AccountId = Integer.parseInt(request.getParameter("accountId"));
		int userInfoId = Integer.parseInt(request.getParameter("userInfoId"));

		int updated = 0;
		try {
			connection.setAutoCommit(false);
			PreparedStatement pstmt = SQLOperations.deleteAccount(connection);
			pstmt.setInt(1, AccountId);
			updated = pstmt.executeUpdate();
			connection.commit();

		//	PreparedStatement pstmt2 = SQLOperations.deleteUserInfo(connection);
		//	pstmt2.setInt(1, userInfoId);
		//	updated = pstmt2.executeUpdate();
		//	connection.commit();

		} catch (SQLException sqle) {
			System.out.println("SQLException -" + sqle.getMessage());
			try {
				connection.rollback();
			} catch (SQLException sql) {
				System.err.println("Error on Update Connection Rollback - " + sql.getMessage());
			}
			return updated;
		}
		return updated;
	}

	public static int editUser(HttpServletRequest request, Connection connection) {
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		int userInfoId = Integer.parseInt(request.getParameter("userInfoId"));

		int updated = 0;
		try {
			connection.setAutoCommit(false);
			PreparedStatement pstmt = SQLOperations.updateUserInfo(connection);
			pstmt.setString(1, lastName);
			pstmt.setString(2, firstName);
			pstmt.setString(3, middleName);
			pstmt.setInt(4, userInfoId);

			updated = pstmt.executeUpdate();
			connection.commit();

			PreparedStatement pstmt2 = SQLOperations.updateAccount(connection);
			pstmt2.setString(1, email);
			pstmt2.setInt(2, accountId);
			updated = pstmt2.executeUpdate();
			connection.commit();

		} catch (SQLException sqle) {
			System.out.println("SQLException -" + sqle.getMessage());
			try {
				connection.rollback();
			} catch (SQLException sql) {
				System.err.println("Error on Update Connection Rollback - " + sql.getMessage());
			}
			return updated;
		}
		return updated;
	}

	public static int editUserPassword(HttpServletRequest request, Connection connection) {
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		int userInfoId = Integer.parseInt(request.getParameter("userInfoId"));
		String password = request.getParameter("password");

		int updated = 0;
		try {
			connection.setAutoCommit(false);
			PreparedStatement pstmt = SQLOperations.updateAccountPassword(connection);
			pstmt.setString(1, password);
			pstmt.setInt(2, accountId);
			updated = pstmt.executeUpdate();
			connection.commit();

		} catch (SQLException sqle) {
			System.out.println("SQLException -" + sqle.getMessage());
			try {
				connection.rollback();
			} catch (SQLException sql) {
				System.err.println("Error on Update Connection Rollback - " + sql.getMessage());
			}
			return updated;
		}
		return updated;
	}

	public static ResultSet getAllUsers(HttpServletRequest request, Connection connection) {
		try {

			ResultSet rs = SQLOperations.selectAccount(connection).executeQuery();

			return rs;

		} catch (SQLException e) {

			e.printStackTrace();
			return null;
		}
	}

	public static ResultSet getAllAccounts(HttpServletRequest request, Connection connection) {
		try {
			return SQLOperations.selectAccount(connection).executeQuery();
		} catch (SQLException e) {

			e.printStackTrace();
			return null;
		}
	}

	public static ResultSet getUserById(HttpServletRequest request, Connection connection) {
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		int userInfoId = Integer.parseInt(request.getParameter("userInfoId"));
		try {
			PreparedStatement ps = SQLOperations.selectOneAccount(connection);
			ps.setInt(1, accountId);
			return ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static FinalUserBean login(HttpServletRequest request, Connection connection)
	{
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		System.out.print(username+password);
		try {
			PreparedStatement ps = SQLOperations.login(connection);
			ps.setString(1,username);
			ps.setString(2,password);
			ResultSet rs= ps.executeQuery();
			rs.next();
			FinalUserBean x = (FinalUserBean) BeanFactory.getBean(rs.getInt("accountID"), rs.getInt("userInfoId")
			, rs.getString("lastName"), rs.getString("firstName"), rs.getString("middleName")
			, rs.getString("departmentName"), rs.getString("collegeName"), rs.getString("userName")
			, rs.getString("password"), rs.getString("email"), rs.getString("roleName"), rs.getInt("active"));
			System.out.print(x.getCollegeName());
			return x;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		}
	}
	public static FinalUserBean editSelf(HttpServletRequest request, Connection connection)
	{
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		int userInfoId = Integer.parseInt(request.getParameter("userInfoId"));
		ResultSet rs = null;
		int updated = 0;
		FinalUserBean x= new FinalUserBean();
		try {
			connection.setAutoCommit(false);
			PreparedStatement pstmt = SQLOperations.updateUserInfo(connection);
			pstmt.setString(1, lastName);
			pstmt.setString(2, firstName);
			pstmt.setString(3, middleName);
			pstmt.setInt(4, userInfoId);

			updated = pstmt.executeUpdate();
			connection.commit();

			PreparedStatement pstmt2 = SQLOperations.updateAccount(connection);
			pstmt2.setString(1, email);
			pstmt2.setInt(2, accountId);
			updated = pstmt2.executeUpdate();
			connection.commit();
			
			PreparedStatement ps = SQLOperations.selectOneUserAccount(connection);
			ps.setInt(1,userInfoId);
			rs= ps.executeQuery();
			rs.next();
			 x = (FinalUserBean) BeanFactory.getBean(rs.getInt("accountID"), rs.getInt("userInfoId")
			, rs.getString("lastName"), rs.getString("firstName"), rs.getString("middleName")
			, rs.getString("departmentName"), rs.getString("collegeName"), rs.getString("userName")
			, rs.getString("password"), rs.getString("email"), rs.getString("roleName"), rs.getInt("active"));
			System.out.print(x.getCollegeName());
			return x;

		} catch (SQLException sqle) {
			System.out.println("SQLException -" + sqle.getMessage());
			try {
				
				connection.rollback();
				return x;
			} catch (SQLException sql) {
				System.err.println("Error on Update Connection Rollback - " + sql.getMessage());
				return x;
			}
					}
		
	}
	
	public static ResultSet getHistory(HttpServletRequest request, Connection connection){
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		int userInfoId = Integer.parseInt(request.getParameter("userInfoId"));
		
		try {
			PreparedStatement s = SQLOperations.selectOneAttendance(connection);
			s.setInt(1, accountId);
			System.out.println(accountId);
			return s.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	
	
}
