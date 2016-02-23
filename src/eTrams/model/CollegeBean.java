package eTrams.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import eTrams.utilities.databaseUtilities.SQLOperations;
import eTrams.utilities.beanUtilities.BeanInterface;
// bean for respective colleges
public class CollegeBean implements BeanInterface {
	
	private int collegeID;
	private String collegeName;
	private int active;

	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("College Bean");
	}

	@Override
	public int storeToDatabase(Connection connection) {

		PreparedStatement ps = SQLOperations.createNewCollege(connection);
		try
		{
			ps.setString(1, getCollegeName());
			ps.setInt(2, getActive()); 
			
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

	public int getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(int collegeID) {
		this.collegeID = collegeID;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
}
