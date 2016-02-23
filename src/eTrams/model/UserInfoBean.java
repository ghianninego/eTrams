package eTrams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import eTrams.utilities.databaseUtilities.SQLOperations;
import eTrams.utilities.beanUtilities.BeanInterface;

// user information bean
public class UserInfoBean implements BeanInterface {
	
	private int userInfoID;
	private int accountID;
	private String lastName;
	private String firstName;
	private String middleName;
	private int departmentID;
	
	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("UserInfo Bean");
	}

	@Override
	public int storeToDatabase(Connection connection) {

		PreparedStatement ps = SQLOperations.createNewUserInfo(connection);
		try
		{
			ps.setInt(1, getAccountID());
			ps.setString(2, getLastName()); 
			ps.setString(3, getFirstName());
			ps.setString(4, getMiddleName());
			ps.setInt(5, getDepartmentID());
			
			if (ps.executeUpdate() > 0)
			{
				connection.commit();
				return 1;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return 0;
	}

	public int getUserInfoID() {
		return userInfoID;
	}

	public void setUserInfoID(int userInfoID) {
		this.userInfoID = userInfoID;
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public int getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(int collegeID) {
		this.departmentID = departmentID;
	}

}
