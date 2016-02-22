package eTrams.model;
import java.sql.Connection;

import eTrams.utilities.beanUtilities.BeanInterface;

// AnnouncementBean for announcement retrieval of information (for home page and announcements)
public class AnnouncementBean implements BeanInterface{
	
	private int announcementID;
	private int userID;
	private String title;
	private String description;
	private int active;
	
	@Override
	public void getBeanType() {
		System.out.println("Announcement Bean");
	}
	@Override
	public int storeToDatabase(Connection connection) {
		// TODO Auto-generated method stub
		// DO THIS U PIEACE OF SHIET
		return 0;
	}
	
	public int getAnnouncementID() {
		return announcementID;
	}
	public void setAnnouncementID(int announcementID) {
		this.announcementID = announcementID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	
}
