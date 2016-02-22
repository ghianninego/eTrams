package eTrams.model;

import java.sql.Connection;

import eTrams.utilities.beanUtilities.BeanInterface;

// user information bean
public class UserInfoBean implements BeanInterface {
	
	private int userInfoID;
	private int accountID;
	private String lastName;
	private String firstName;
	private String middleName;
	private int collegeID;
	
	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("UserInfo Bean");
	}

	@Override
	public int storeToDatabase(Connection connection) {
		// TODO Auto-generated method stub
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

	public int getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(int collegeID) {
		this.collegeID = collegeID;
	}

}
