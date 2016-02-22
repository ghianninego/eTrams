package eTrams.model;

import java.sql.Connection;

import eTrams.utilities.beanUtilities.BeanInterface;
// seminar bean for seminars
public class SeminarBean implements BeanInterface {

	private int seminarID;
	private int creatorID;
	private String seminarName;
	private String description;
	private java.util.Date dateCreated;
	private int completion;
	private int active;
	
	@Override
	public void getBeanType() {
		// TODO Auto-generated method stub
		System.out.println("Seminar Bean");
	}

	@Override
	public int storeToDatabase(Connection connection) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getSeminarID() {
		return seminarID;
	}

	public void setSeminarID(int seminarID) {
		this.seminarID = seminarID;
	}

	public int getCreatorID() {
		return creatorID;
	}

	public void setCreatorID(int creatorID) {
		this.creatorID = creatorID;
	}

	public String getSeminarName() {
		return seminarName;
	}

	public void setSeminarName(String seminarName) {
		this.seminarName = seminarName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public java.util.Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(java.util.Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public int getCompletion() {
		return completion;
	}

	public void setCompletion(int completion) {
		this.completion = completion;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

}
