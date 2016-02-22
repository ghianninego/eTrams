package eTrams.model;
import java.sql.Connection;

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
