package eTrams.utilities.beanUtilities;

import eTrams.model.*;
// bean factory. Hides the creation of the beans from the user (only called by the controller)

public class BeanFactory {
	
	// for getting college bean
	public static BeanInterface getBean(int collegeID, String collegeName, int active)
	{
		CollegeBean collegeBean = new CollegeBean();
		
		collegeBean.setCollegeID(collegeID);
		collegeBean.setCollegeName(collegeName);
		collegeBean.setActive(active);
		
		return collegeBean;
	}
	
	// for getting user information bean
	public static BeanInterface getBean(int userInfoID, int accountID, String lastName, String firstName, String middleName, int departmentID)
	{
		UserInfoBean userInfoBean = new UserInfoBean();
		
		userInfoBean.setAccountID(accountID);
		userInfoBean.setUserInfoID(userInfoID);
		userInfoBean.setLastName(lastName);
		userInfoBean.setFirstName(firstName);
		userInfoBean.setMiddleName(middleName);
		userInfoBean.setDepartmentID(departmentID);
		
		return userInfoBean;
	}
	
	// for getting account bean
	public static BeanInterface getBean(int accountID, String username, String password, String email, int roleID, int active)
	{
		AccountBean accountBean = new AccountBean();
		
		accountBean.setAccountID(accountID);
		accountBean.setUsername(username);
		accountBean.setPassword(password);
		accountBean.setEmail(email);
		accountBean.setRoleID(roleID);
		accountBean.setActive(active);
		
		return accountBean;
	}
	
	// for getting department bean
	public static BeanInterface getBean(int departmentID, String departmentName, int collegeID, int active)
	{
		DepartmentBean departmentBean = new DepartmentBean();
		
		departmentBean.setDepartmentID(departmentID);
		departmentBean.setDepartmentName(departmentName);
		departmentBean.setCollegeID(collegeID);
		departmentBean.setActive(active);
		
		return departmentBean;
	}
	
	// for getting seminar bean
	public static BeanInterface getBean(int seminarID, int creatorID, String seminarName, String description, java.sql.Date dateCreated, int completion, int active)
	{
		SeminarBean seminarBean = new SeminarBean();
		
		seminarBean.setSeminarID(seminarID);
		seminarBean.setCreatorID(creatorID);
		seminarBean.setSeminarName(seminarName);
		seminarBean.setDescription(description);
		seminarBean.setDateCreated(dateCreated);
		seminarBean.setCompletion(completion);
		seminarBean.setActive(active);
		
		return seminarBean;
	}
	
	// for getting announcement bean
	public static BeanInterface getBean(int announcementID, int creatorID, String title, String content, int active)
	{
		AnnouncementBean announcementBean = new AnnouncementBean();
		
		announcementBean.setAnnouncementID(announcementID);
		announcementBean.setCreatorID(creatorID);
		announcementBean.setTitle(title);
		announcementBean.setContent(content);
		announcementBean.setActive(active);
		
		return announcementBean;
	}
	
	// for getting venue bean
	public static BeanInterface getBean(int venueID, String venueName)
	{
		VenueBean venueBean = new VenueBean();
		
		venueBean.setVenueID(venueID);
		venueBean.setVenueName(venueName);
		
		return venueBean;
	}
	
	// for getting session bean
	public static BeanInterface getBean(int sessionID, int seminarID, String seminarName, int venueID, String venueRemarks, int capacity, java.sql.Date date, java.sql.Time startTime, java.sql.Time endTime, int speakerID, int completion, int active)
	{
		SessionBean sessionBean = new SessionBean();
		
		sessionBean.setSessionID(sessionID);
		sessionBean.setSeminarID(seminarID);
		sessionBean.setSeminarName(seminarName);
		sessionBean.setVenueID(venueID);
		sessionBean.setVenueRemarks(venueRemarks);
		sessionBean.setCapacity(capacity);
		sessionBean.setStartTime(startTime);
		sessionBean.setEndTime(endTime);
		sessionBean.setSpeakerID(speakerID);
		sessionBean.setCompletion(completion);
		sessionBean.setActive(active);
		
		return sessionBean;
	}
	
	// for getting attendance bean
	public static BeanInterface getBean(int attendanceID, int sessionID, int participantID, java.sql.Time timeIn, java.sql.Time timeOut, String status, int certification, java.sql.Date certificationRelease)
	{
		AttendanceBean attendanceBean = new AttendanceBean();
		
		attendanceBean.setAttendanceID(attendanceID);
		attendanceBean.setSessionID(sessionID);
		attendanceBean.setParticipantID(participantID);
		attendanceBean.setTimeIn(timeIn);
		attendanceBean.setTimeOut(timeOut);
		attendanceBean.setStatus(status);
		attendanceBean.setCertification(certification);
		attendanceBean.setCertificationRelease(certificationRelease);
		
		return attendanceBean;
	}
}
