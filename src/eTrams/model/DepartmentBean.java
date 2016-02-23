package eTrams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import eTrams.utilities.databaseUtilities.SQLOperations;
import eTrams.utilities.beanUtilities.BeanInterface;
// department bean for college departments
public class DepartmentBean implements BeanInterface{
	
	private int departmentID;
	private String departmentName;
	private int collegeID;
	private int active;
	
	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("Department Bean");
	}
	@Override
	public int storeToDatabase(Connection connection) {

		PreparedStatement ps = SQLOperations.createNewDepartment(connection);
		try
		{
			ps.setString(1, getDepartmentName());
			ps.setInt(2, getCollegeID()); 
			ps.setInt(3, getActive());
			
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
	
	public int getDepartmentID() {
		return departmentID;
	}
	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public int getCollegeID() {
		return collegeID;
	}
	public void setCollegeID(int collegeID) {
		this.collegeID = collegeID;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
}
