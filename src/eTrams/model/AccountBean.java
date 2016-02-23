package eTrams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import eTrams.security.Security;
import eTrams.utilities.beanUtilities.BeanInterface;
import eTrams.utilities.databaseUtilities.SQLOperations;
// model for accounts 
public class AccountBean implements BeanInterface {
	
	private int accountID;
	private String username;
	private String password;
	private String email;
	private int roleID;
	private int active;
	
	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("Account Bean");
	}

	@Override
	public int storeToDatabase(Connection connection) {

		PreparedStatement ps = SQLOperations.createNewUserAccount(connection);
		try
		{
			ps.setString(1, Security.encrypt(getUsername()));
			ps.setString(2, Security.encrypt(getPassword())); // please encrypt
			ps.setString(3, getEmail());
			ps.setInt(4, getRoleID());
			ps.setInt(5, getActive());
			
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

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

}
