package eTrams.model;
import java.sql.Connection;
import eTrams.utilities.databaseUtilities.SQLOperations;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import eTrams.utilities.beanUtilities.BeanInterface;

// AnnouncementBean for announcement retrieval of information (for home page and announcements)
public class AnnouncementBean implements BeanInterface{
	
	private int announcementID;
	private int creatorID;
	private String title;
	private String content;
	private int active;
	
	@Override
	public void getBeanType() {
		System.out.println("Announcement Bean");
	}
	@Override
	public int storeToDatabase(Connection connection) {
		
		PreparedStatement ps = SQLOperations.createNewAnnouncement(connection);
		try
		{
			ps.setInt(1, 0);
			ps.setInt(2, getCreatorID());
			ps.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
			ps.setString(4, getTitle()); 
			ps.setString(5, getContent());
			ps.setInt(6, getActive());
			
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
	
	public int getAnnouncementID() {
		return announcementID;
	}
	public void setAnnouncementID(int announcementID) {
		this.announcementID = announcementID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public int getCreatorID() {
		return creatorID;
	}
	public void setCreatorID(int creatorID) {
		this.creatorID = creatorID;
	}
	
}
