package eTrams.model;

import java.sql.Connection;

import eTrams.utilities.beanUtilities.BeanInterface;

public class FinalUserBean implements BeanInterface{
	private int userInfoID;
	private int accountID;
	private String lastName;
	private String firstName;
	private String middleName;
	private String departmentName;
	private String collegeName;
	private String username;
	private String password;
	private String email;
	private String roleName;
	private int active;
	
	
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
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
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
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getCollegeName() {
		return collegeName;
	}
	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	@Override
	public int storeToDatabase(Connection connection) {
		
		return 0;
	}
	@Override
	public void getBeanType() {
		
		
	}
}
