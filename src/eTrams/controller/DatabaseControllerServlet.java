package eTrams.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eTrams.model.FinalUserBean;
import eTrams.security.Security;
import eTrams.utilities.databaseUtilities.DatabaseDataSource;
import eTrams.utilities.databaseUtilities.SQLOperations;
import eTrams.utilities.helperClasses.AnnouncementClass;
import eTrams.utilities.helperClasses.CalendarClass;
import eTrams.utilities.helperClasses.CollegeClass;
import eTrams.utilities.helperClasses.FrontDeskClass;
import eTrams.utilities.helperClasses.ManageParticipantsClass;
import eTrams.utilities.helperClasses.ReportsClass;
import eTrams.utilities.helperClasses.Search;
import eTrams.utilities.helperClasses.SeminarClass;
import eTrams.utilities.helperClasses.SessionClass;
import eTrams.utilities.helperClasses.UserClass;
import eTrams.utilities.helperClasses.VenueClass;

/**
 * Servlet implementation class DatabaseControllerServlet
 */
@WebServlet("/dbcontrol")
public class DatabaseControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection connection;
	private HttpSession session = null;
	
	public void init() throws ServletException {
		//super.init(config);
		connection = DatabaseDataSource.getConnection();
		getServletContext().setAttribute("connectionDAO", connection);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// INCLUDE USER TYPES SOON
		String requestType = request.getParameter("requestType");
		session = request.getSession(false);
		FinalUserBean fub = (FinalUserBean)session.getAttribute("user");
		
		if (requestType.equals("login"))
		{
			try 
			{
				AnnouncementClass.beGoneAnnouncement(request, connection);
				
				fub = UserClass.login(request, connection);
				SeminarClass.completeSeminar(request, connection);
				System.out.println("SESSION  " + SessionClass.completeSession(request, connection));
				session.setAttribute("eventsList",CalendarClass.selectData(request, connection));
				session.setAttribute("user", fub);
				session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
				if(fub==null)
				{
					response.sendRedirect("index.jsp?flag=1");
				}
				else if (fub.getRoleName().equals("Admin"))
					response.sendRedirect("jsp/admin/adminHome.jsp");
				else if (fub.getRoleName().equals("Coordinator"))
					response.sendRedirect("jsp/coordinator/coordinatorHome.jsp");
				else if (fub.getRoleName().equals("Participant"))
					response.sendRedirect("jsp/participants/participantHome.jsp");
				else if (fub.getRoleName().equals("Staff"))
					response.sendRedirect("jsp/staff/staffHome.jsp");
				
			} catch (SQLException e) {
				e.printStackTrace();
				
			}
		}
		else if (fub == null)
		{
			session.setAttribute("errorMessage", "You aren't logged in. Please log in");
			response.sendRedirect("jsp/errorPage.jsp");
		}
		else if (fub.getRoleName().equals("Admin"))
		{
			switch(requestType)
			{
				// ADMIN ACCOUNT
				//////// seminar
				case "createSeminar": 
					SeminarClass.createSeminar(request, connection, ((FinalUserBean)session.getAttribute("user")).getAccountID()); // temporary ID (must get from session)
					response.sendRedirect("dbcontrol?requestType=goToAdminSeminar"); 
					break;
				case "editSeminar":
					SeminarClass.editSeminar(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminSeminar"); 
					break;
				case "deleteSeminar":
					SeminarClass.deleteSeminar(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminSeminar"); 
					break;
				case "goToAdminSeminar":

					SeminarClass.completeSeminar(request, connection);
					if(request.getParameter("flag")==null){
					ResultSet seminars = SeminarClass.retrieveSeminars(connection);
					session.setAttribute("seminars", seminars);
					}
					response.sendRedirect("jsp/admin/adminSeminars.jsp");
					break;
				//////// sessions
				case "createSession":
					SessionClass.createSession(request, connection);
					session.setAttribute("eventsList",CalendarClass.selectData(request, connection));
					response.sendRedirect("dbcontrol?requestType=goToAdminSessionFromAction&seminarID="+session.getAttribute("seminarID")); // change to URL mapping (hehe)
					break;
				case "editSession":
					SessionClass.editSession(request, connection);
					SessionClass.completeSession(request,connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminSessionFromAction&seminarID="+session.getAttribute("seminarID"));
					break;
				case "deleteSession":
					SessionClass.deleteSession(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminSessionFromAction&seminarID="+session.getAttribute("seminarID"));
					break;
				case "goToAdminSession":
					System.out.println("SESSION  " + SessionClass.completeSession(request, connection));
					SeminarClass.completeSeminar(request, connection);
					ResultSet venues = VenueClass.retrieveVenues(connection);
					ResultSet speakers = SessionClass.retrieveCoordinators(connection);
					ResultSet sessions = SessionClass.retrieveSessions(connection, Integer.parseInt(request.getParameter("seminarID")));
					session.setAttribute("seminarName", request.getParameter("seminarName"));
					session.setAttribute("session", sessions);
					session.setAttribute("venue", venues);
					session.setAttribute("speakers", speakers);
					session.setAttribute("seminarID", request.getParameter("seminarID"));
					response.sendRedirect("jsp/admin/adminSessions.jsp");
					break;
				case "goToAdminSessionFromAction":
					ResultSet venues2 = VenueClass.retrieveVenues(connection);
					ResultSet speakers2 = SessionClass.retrieveCoordinators(connection);
					ResultSet sessions2 = SessionClass.retrieveSessions(connection, Integer.valueOf((String)session.getAttribute("seminarID")));
					session.setAttribute("session", sessions2);
					session.setAttribute("venue", venues2);
					session.setAttribute("speakers", speakers2);
					response.sendRedirect("jsp/admin/adminSessions.jsp");
					break;
				//////// venues
				case "createVenue":
					VenueClass.createVenue(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminVenue"); 
					break;
				case "editVenue":
					VenueClass.editVenue(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminVenue"); 
					break;
				case "deleteVenue":
					VenueClass.deleteVenue(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminVenue"); 
					break;
				case "goToAdminVenue":
					ResultSet venue = VenueClass.retrieveVenues(connection);
					session.setAttribute("venue", venue);
					response.sendRedirect("jsp/admin/adminVenues.jsp");
					break;
				///////// manage participants
				case "addParticipants":
					ManageParticipantsClass.addMultipleParticipants(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminManageParticipants");
					break;
				case "goToAdminManageParticipants":
					int sessionID = Integer.valueOf((String) session.getAttribute("sessionID"));
					ResultSet allParticipantAccounts = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					ResultSet oneSession = SessionClass.retrieveOneSession(connection, sessionID);
					ResultSet sessionParticipants = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID);
					session.setAttribute("allParticipants", allParticipantAccounts);
					session.setAttribute("sessionDetails", oneSession);
					session.setAttribute("sessionParticipants", sessionParticipants);
					int participants = ManageParticipantsClass.countSessionParticipants(sessionID, connection);
					session.setAttribute("countParticipants", participants);					
					response.sendRedirect("jsp/admin/adminManageParticipants.jsp");
					break;
				case "goToAdminManageParticipantsFromAdminSessions":
					// retrieve participants
					session.setAttribute("sessionID", request.getParameter("sessionID"));
					System.out.println(request.getParameter("sessionID"));
					int sessionID2 = Integer.valueOf((String) session.getAttribute("sessionID"));
					ResultSet allParticipantAccounts2 = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					ResultSet oneSession2 = SessionClass.retrieveOneSession(connection, sessionID2);
					ResultSet sessionParticipants2 = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID2);
					session.setAttribute("allParticipants", allParticipantAccounts2);
					session.setAttribute("sessionDetails", oneSession2);
					session.setAttribute("sessionName", request.getParameter("sessionName"));
					session.setAttribute("sessionParticipants", sessionParticipants2);
					int participants2 = ManageParticipantsClass.countSessionParticipants(sessionID2, connection);
					session.setAttribute("countParticipants", participants2);
					response.sendRedirect("jsp/admin/adminManageParticipants.jsp");
					break;
					
				case "cancelRegistration":
					ManageParticipantsClass.cancelRegistration(connection, Integer.parseInt(request.getParameter("attendanceID")));
					response.sendRedirect("dbcontrol?requestType=goToAdminManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
				case "certify":
					ManageParticipantsClass.setCertification(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminManageCertification&sessionID="+session.getAttribute("sessionID"));
					break;
					
				case "setStatus":
					ManageParticipantsClass.setStatus(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
				
				case "setAttendance":
					ManageParticipantsClass.setTime(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
					
				case "goToAdminManageCertification":
					sessionID = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession = SessionClass.retrieveOneSession(connection, sessionID);
					sessionParticipants = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID);
					session.setAttribute("allParticipants", allParticipantAccounts);
					session.setAttribute("sessionDetails", oneSession);
					session.setAttribute("sessionParticipants", sessionParticipants);
					response.sendRedirect("jsp/admin/adminManageCertification.jsp");
					break;
				case "goToAdminManageCertificationFromAdminSessions":
					// retrieve participants
					session.setAttribute("sessionID", request.getParameter("sessionID"));
					System.out.println(request.getParameter("sessionID"));
					sessionID2 = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts2 = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession2 = SessionClass.retrieveOneSession(connection, sessionID2);
					sessionParticipants2 = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID2);
					session.setAttribute("allParticipants", allParticipantAccounts2);
					session.setAttribute("sessionDetails", oneSession2);
					session.setAttribute("sessionName", request.getParameter("sessionName"));
					session.setAttribute("sessionParticipants", sessionParticipants2);
					response.sendRedirect("jsp/admin/adminManageCertification.jsp");
					break;
				/// USER MANAGEMENT
				case "adminUser": 
					if(request.getParameter("flag")==null){
						session.setAttribute("allUser",UserClass.getAllUsers(request, connection));	
					}
					try {
						session.setAttribute("college",SQLOperations.selectCollege(connection).executeQuery());
						session.setAttribute("department",SQLOperations.selectDepartment(connection).executeQuery());
						session.setAttribute("role",SQLOperations.selectRole(connection).executeQuery());
					} catch (SQLException e) {
					e.printStackTrace();
					session.setAttribute("errorMessage", e.toString());
					response.sendRedirect("jsp/errorPage.jsp");
					}
					response.sendRedirect("jsp/admin/adminUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "adminManageUser": 
					if(request.getParameter("flag")==null){
					session.setAttribute("history", UserClass.getHistory(request, connection));
					}
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					
					response.sendRedirect("jsp/admin/adminManageUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "adminManageUserDone": 
					UserClass.editUser(request, connection);
					session.setAttribute("history", UserClass.getHistory(request, connection));
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					response.sendRedirect("jsp/admin/adminManageUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "adminManageUserDelete": 
					UserClass.deleteUser(request, connection);
					session.setAttribute("history", UserClass.getHistory(request, connection));
					session.setAttribute("allUser", UserClass.getAllUsers(request, connection));
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					
					response.sendRedirect("jsp/admin/adminUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "adminAddUser": 
					session.setAttribute("allUser", UserClass.getAllUsers(request, connection));
					
					UserClass.createUser(request, connection);
					response.sendRedirect("dbcontrol?requestType=adminUser"); // change to URL mapping (hehe)
					break;
				case "adminEditPassword": 
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					UserClass.editUserPassword(request, connection);
					response.sendRedirect("jsp/admin/adminManageUsers.jsp"); // change to URL mapping (hehe)
					break;
				
				case "editSelfPassword": 
					if(!fub.getPassword().equals(Security.encrypt(request.getParameter("oldPassword")))){
					response.sendRedirect("jsp/admin/adminAccount.jsp?flag=0");
					} else{
					UserClass.editUserPassword(request, connection);
					response.sendRedirect("jsp/admin/adminAccount.jsp?flag=1"); // change to URL mapping (hehe)
					}
					break;
				case "editSelfInfo": 
					session.setAttribute("user",UserClass.editSelf(request, connection));
					response.sendRedirect("jsp/admin/adminAccount.jsp?flag=2");
					break;
				// ANNOUNCEMENTS :))
				case "addAnnouncement":
						AnnouncementClass.createAnnouncement(request, connection);
						try {
							session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
						} catch (SQLException e) {
							e.printStackTrace();
						}
							response.sendRedirect("jsp/admin/adminHome.jsp");// change to URL mapping (hehe)
					break;
				case  "announcementEdit":
					AnnouncementClass.editAnnouncement(request, connection);
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						e.printStackTrace();

						session.setAttribute("errorMessage", e.toString());
						response.sendRedirect("jsp/errorPage.jsp");
					}
						response.sendRedirect("jsp/admin/adminHome.jsp");// change to URL mapping (hehe)
						break;
				case  "announcementDelete":
					AnnouncementClass.deleteAnnouncement(request, connection);
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();

						session.setAttribute("errorMessage", e.toString());
						response.sendRedirect("jsp/errorPage.jsp");
					}
						response.sendRedirect("jsp/admin/adminHome.jsp");// change to URL mapping (hehe)
						break;
				case  "home":
					SeminarClass.completeSeminar(request, connection);
					System.out.println("SESSION  " + SessionClass.completeSession(request, connection));
					
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						e.printStackTrace();
					}
						response.sendRedirect("jsp/admin/adminHome.jsp");// change to URL mapping (hehe)
						break;
				case  "myAccount":
						response.sendRedirect("jsp/admin/adminAccount.jsp");// change to URL mapping (hehe)
						break;
				////////////////////////////////
				//////// COLLEGE AND DEPARTMENTS
				case "goToAdminColleges":
					session.setAttribute("colleges", CollegeClass.retrieveColleges(connection));
					response.sendRedirect("jsp/admin/adminColleges.jsp");
					break;
				
				case "adminCreateCollege":
					CollegeClass.createCollege(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminColleges");
					break;
					
				case "adminEditCollege":
					CollegeClass.editCollege(request, connection);
					System.out.println("Editing college");
					response.sendRedirect("dbcontrol?requestType=goToAdminColleges");
					break;
				
				case "adminDeleteCollege":
					CollegeClass.deleteCollege(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminColleges");
					break;
				
				case "goToCollegeDepartments":
					session.setAttribute("departments", CollegeClass.retrieveDepartments(Integer.parseInt(request.getParameter("collegeID")), connection));
					session.setAttribute("collegeID", request.getParameter("collegeID"));
					session.setAttribute("collegeName", request.getParameter("collegeName"));
					response.sendRedirect("jsp/admin/adminDepartments.jsp");
					break;
				
				case "goToCollegeDepartmentsFromAction":
					session.setAttribute("departments", CollegeClass.retrieveDepartments(Integer.parseInt((String)session.getAttribute("collegeID")), connection));
					response.sendRedirect("jsp/admin/adminDepartments.jsp");
					break;
					
				case "adminCreateDepartment":
					CollegeClass.createDepartment(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCollegeDepartmentsFromAction");
					break;
					
				case "adminEditDepartment":
					CollegeClass.editDepartment(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCollegeDepartmentsFromAction");
					break;
				
				case "adminDeleteDepartment":
					CollegeClass.deleteDepartment(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCollegeDepartmentsFromAction");
					break;
				//search
				case "searchName":
					session.setAttribute("allUser",Search.searchedUser(request, connection));
					response.sendRedirect("dbcontrol?requestType=adminUser&flag=1");
					break;
				case "searchSeminar":
					session.setAttribute("seminars", Search.searchedSeminar(request, connection));
					response.sendRedirect("dbcontrol?requestType=goToAdminSeminar&flag=1");
					break;
					
				case "searchHistory":
					session.setAttribute("history",Search.searchedHistory(request, connection));
					response.sendRedirect("dbcontrol?requestType=adminManageUser&flag=1&accountId="+request.getParameter("accountId"));
					break;
				/// FRONT DESK 
				case "goToFrontDesk":
					sessionID = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession = SessionClass.retrieveOneSession(connection, sessionID);
					int participantCount = ManageParticipantsClass.countRegisteredSessionParticipants(sessionID, connection);
					sessionParticipants = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID);
					int countSessionParticipants = ManageParticipantsClass.countSessionParticipants(sessionID, connection);
					session.setAttribute("allParticipants", allParticipantAccounts);
					session.setAttribute("sessionDetails", oneSession);
					session.setAttribute("sessionParticipants", sessionParticipants);
					session.setAttribute("registeredParticipantCount", participantCount);
					session.setAttribute("participantCount", countSessionParticipants);
					response.sendRedirect("jsp/admin/frontDeskInterface.jsp?flag="+request.getParameter("flag"));
					break;
				case "goToFrontDeskFromSessions":
					// retrieve participants
					session.setAttribute("sessionID", request.getParameter("sessionID"));
					System.out.println(request.getParameter("sessionID"));
					sessionID2 = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts2 = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession2 = SessionClass.retrieveOneSession(connection, sessionID2);
					int participantCount2 = ManageParticipantsClass.countRegisteredSessionParticipants(sessionID2, connection);
					sessionParticipants2 = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID2);
					int countSessionParticipants2 = ManageParticipantsClass.countSessionParticipants(sessionID2, connection);
					session.setAttribute("allParticipants", allParticipantAccounts2);
					session.setAttribute("sessionDetails", oneSession2);
					session.setAttribute("sessionName", request.getParameter("sessionName"));
					session.setAttribute("sessionParticipants", sessionParticipants2);
					session.setAttribute("registeredParticipantCount", participantCount2);
					session.setAttribute("participantCount", countSessionParticipants2);
					response.sendRedirect("jsp/admin/frontDeskInterface.jsp");
					break;
				case "register":
					int x = FrontDeskClass.register(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToFrontDesk&flag="+x);
					break;
					
				
				////// REPORTS
				case "goToAdminReports":
					int countAllSessions = ReportsClass.countAllSessions(connection);
					int countAllSeminars = ReportsClass.countAllSeminars(connection);
					int countAllAttendees = ReportsClass.countAllAttendees(connection);
					session.setAttribute("countAllSessions",countAllSessions);
					session.setAttribute("countAllSeminars",countAllSeminars);
					session.setAttribute("countAllAttendees",countAllAttendees);
					response.sendRedirect("jsp/admin/adminReports.jsp");
					break;
				case "generateReport":
					ReportsClass.generateReport(response, connection);
					break;
				case "logout":
					session.invalidate();
					session = null;
					response.sendRedirect("index.jsp");
					break;
				default:
					
					response.sendRedirect("jsp/errorPage.jsp");
					break;
			}
		} 
		else if (fub.getRoleName().equals("Coordinator"))
		{
			switch(requestType)
			{
				// Coordinator ACCOUNT
				//////// seminar
				case "createSeminar": 
					SeminarClass.createSeminar(request, connection, ((FinalUserBean)session.getAttribute("user")).getAccountID()); // temporary ID (must get from session)
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorSeminar"); 
					break;
				case "editSeminar":
					SeminarClass.editSeminar(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorSeminar"); 
					break;
				case "deleteSeminar":
					SeminarClass.deleteSeminar(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorSeminar"); 
					break;
				case "goToCoordinatorSeminar":

					SeminarClass.completeSeminar(request, connection);
					if(request.getParameter("flag")==null){
					ResultSet seminars = SeminarClass.retrieveSeminars(connection);
					session.setAttribute("seminars", seminars);
					}
					response.sendRedirect("jsp/coordinator/coordinatorSeminars.jsp");
					break;
				//////// sessions
				case "createSession":
					SessionClass.createSession(request, connection);
					session.setAttribute("eventsList",CalendarClass.selectData(request, connection));
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorSessionFromAction&seminarID="+session.getAttribute("seminarID")); // change to URL mapping (hehe)
					break;
				case "editSession":
					SessionClass.editSession(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorSessionFromAction&seminarID="+session.getAttribute("seminarID"));
					break;
				case "deleteSession":
					SessionClass.deleteSession(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorSessionFromAction&seminarID="+session.getAttribute("seminarID"));
					break;
				case "goToCoordinatorSession":
					System.out.println("SESSION  " + SessionClass.completeSession(request, connection));
					SeminarClass.completeSeminar(request, connection);
					ResultSet venues = VenueClass.retrieveVenues(connection);
					ResultSet speakers = SessionClass.retrieveCoordinators(connection);
					ResultSet sessions = SessionClass.retrieveSessions(connection, Integer.parseInt(request.getParameter("seminarID")));
					session.setAttribute("seminarName", request.getParameter("seminarName"));
					session.setAttribute("session", sessions);
					session.setAttribute("venue", venues);
					session.setAttribute("speakers", speakers);
					session.setAttribute("seminarID", request.getParameter("seminarID"));
					response.sendRedirect("jsp/coordinator/coordinatorSessions.jsp");
					break;
				case "goToCoordinatorSessionFromAction":
					ResultSet venues2 = VenueClass.retrieveVenues(connection);
					ResultSet speakers2 = SessionClass.retrieveCoordinators(connection);
					ResultSet sessions2 = SessionClass.retrieveSessions(connection, Integer.valueOf((String)session.getAttribute("seminarID")));
					session.setAttribute("session", sessions2);
					session.setAttribute("venue", venues2);
					session.setAttribute("speakers", speakers2);
					response.sendRedirect("jsp/coordinator/coordinatorSessions.jsp");
					break;
				///////// manage participants
				case "addParticipants":
					ManageParticipantsClass.addMultipleParticipants(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorManageParticipants");
					break;
				case "goToCoordinatorManageParticipants":
					int sessionID = Integer.valueOf((String) session.getAttribute("sessionID"));
					ResultSet allParticipantAccounts = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					ResultSet oneSession = SessionClass.retrieveOneSession(connection, sessionID);
					ResultSet sessionParticipants = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID);
					session.setAttribute("allParticipants", allParticipantAccounts);
					session.setAttribute("sessionDetails", oneSession);
					session.setAttribute("sessionParticipants", sessionParticipants);
					int participants = ManageParticipantsClass.countSessionParticipants(sessionID, connection);
					session.setAttribute("countParticipants", participants);					
					response.sendRedirect("jsp/coordinator/coordinatorManageParticipants.jsp");
					break;
				case "goToCoordinatorManageParticipantsFromCoordinatorSessions":
					// retrieve participants
					session.setAttribute("sessionID", request.getParameter("sessionID"));
					System.out.println(request.getParameter("sessionID"));
					int sessionID2 = Integer.valueOf((String) session.getAttribute("sessionID"));
					ResultSet allParticipantAccounts2 = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					ResultSet oneSession2 = SessionClass.retrieveOneSession(connection, sessionID2);
					ResultSet sessionParticipants2 = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID2);
					session.setAttribute("allParticipants", allParticipantAccounts2);
					session.setAttribute("sessionDetails", oneSession2);
					session.setAttribute("sessionName", request.getParameter("sessionName"));
					session.setAttribute("sessionParticipants", sessionParticipants2);
					int participants2 = ManageParticipantsClass.countSessionParticipants(sessionID2, connection);
					session.setAttribute("countParticipants", participants2);
					response.sendRedirect("jsp/coordinator/coordinatorManageParticipants.jsp");
					break;
					
				case "cancelRegistration":
					ManageParticipantsClass.cancelRegistration(connection, Integer.parseInt(request.getParameter("attendanceID")));
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
				case "certify":
					ManageParticipantsClass.setCertification(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorManageCertification&sessionID="+session.getAttribute("sessionID"));
					break;
					
				case "setStatus":
					ManageParticipantsClass.setStatus(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
				
				case "setAttendance":
					ManageParticipantsClass.setTime(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
					
				case "goToCoordinatorManageCertification":
					sessionID = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession = SessionClass.retrieveOneSession(connection, sessionID);
					sessionParticipants = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID);
					session.setAttribute("allParticipants", allParticipantAccounts);
					session.setAttribute("sessionDetails", oneSession);
					session.setAttribute("sessionParticipants", sessionParticipants);
					response.sendRedirect("jsp/coordinator/coordinatorManageCertification.jsp");
					break;
				case "goToCoordinatorManageCertificationFromCoordinatorSessions":
					// retrieve participants
					session.setAttribute("sessionID", request.getParameter("sessionID"));
					System.out.println(request.getParameter("sessionID"));
					sessionID2 = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts2 = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession2 = SessionClass.retrieveOneSession(connection, sessionID2);
					sessionParticipants2 = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID2);
					session.setAttribute("allParticipants", allParticipantAccounts2);
					session.setAttribute("sessionDetails", oneSession2);
					session.setAttribute("sessionName", request.getParameter("sessionName"));
					session.setAttribute("sessionParticipants", sessionParticipants2);
					response.sendRedirect("jsp/coordinator/coordinatorManageCertification.jsp");
					break;
				/// USER MANAGEMENT
				case "coordinatorUser": 
					if(request.getParameter("flag")==null){
						session.setAttribute("allUser",UserClass.getAllUsers(request, connection));	
					}
					try {
						session.setAttribute("college",SQLOperations.selectCollege(connection).executeQuery());
						session.setAttribute("department",SQLOperations.selectDepartment(connection).executeQuery());
						session.setAttribute("role",SQLOperations.selectRole(connection).executeQuery());
					} catch (SQLException e) {
					e.printStackTrace();

					session.setAttribute("errorMessage", e.toString());
					response.sendRedirect("jsp/errorPage.jsp");
					}
					response.sendRedirect("jsp/coordinator/coordinatorUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "coordinatorManageUser": 
					if(request.getParameter("flag")==null){
					session.setAttribute("history", UserClass.getHistory(request, connection));
					}
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					
					response.sendRedirect("jsp/coordinator/coordinatorManageUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "coordinatorManageUserDone": 
					UserClass.editUser(request, connection);
					session.setAttribute("history", UserClass.getHistory(request, connection));
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					response.sendRedirect("jsp/coordinator/coordinatorManageUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "coordinatorManageUserDelete": 
					UserClass.deleteUser(request, connection);
					session.setAttribute("history", UserClass.getHistory(request, connection));
					session.setAttribute("allUser", UserClass.getAllUsers(request, connection));
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					
					response.sendRedirect("jsp/coordinator/coordinatorUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "coordinatorAddUser": 
					session.setAttribute("allUser", UserClass.getAllUsers(request, connection));
					
					UserClass.createUser(request, connection);
					response.sendRedirect("dbcontrol?requestType=coordinatorUser"); // change to URL mapping (hehe)
					break;
				case "coordinatorEditPassword": 
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					UserClass.editUserPassword(request, connection);
					response.sendRedirect("jsp/coordinator/coordinatorManageUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "editSelfPassword": 
					if(!fub.getPassword().equals(Security.encrypt(request.getParameter("oldPassword")))){
						response.sendRedirect("jsp/coordinator/coordinatorAccount_Profile.jsp?flag=0");
					} else{
					UserClass.editUserPassword(request, connection);
					response.sendRedirect("jsp/coordinator/coordinatorAccount_Profile.jsp?flag=1"); // change to URL mapping (hehe)
					}
					break;
				case "editSelfInfo": 
					session.setAttribute("user",UserClass.editSelf(request, connection));
					response.sendRedirect("jsp/coordinator/coordinatorAccount_Profile.jsp?flag=2");
					break;
				// ANNOUNCEMENTS :))
				case "addAnnouncement":
						AnnouncementClass.createAnnouncement(request, connection);
						try {
							session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
						} catch (SQLException e) {
							e.printStackTrace();
						}
							response.sendRedirect("jsp/coordinator/coordinatorHome.jsp");// change to URL mapping (hehe)
					break;
				case  "announcementEdit":
					AnnouncementClass.editAnnouncement(request, connection);
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						e.printStackTrace();

						session.setAttribute("errorMessage", e.toString());
						response.sendRedirect("jsp/errorPage.jsp");
					}
						response.sendRedirect("jsp/coordinator/coordinatorHome.jsp");// change to URL mapping (hehe)
						break;
				case  "announcementDelete":
					AnnouncementClass.deleteAnnouncement(request, connection);
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
						response.sendRedirect("jsp/coordinator/coordinatorHome.jsp");// change to URL mapping (hehe)
						break;
				case  "home":
					SeminarClass.completeSeminar(request, connection);
					System.out.println("SESSION  " + SessionClass.completeSession(request, connection));
					
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						e.printStackTrace();
					}
						response.sendRedirect("jsp/coordinator/coordinatorHome.jsp");// change to URL mapping (hehe)
						break;
				case  "myAccount":
						response.sendRedirect("jsp/coordinator/coordinatorAccount_Profile.jsp");// change to URL mapping (hehe)
						break;
				case  "myHistory":
					session.setAttribute("myHistory", UserClass.getMyHistory(request, connection,fub));
					response.sendRedirect("jsp/coordinator/coordinatorAccount_History.jsp");// change to URL mapping (hehe)
					break;
				//search
				case "searchName":
					session.setAttribute("allUser",Search.searchedUser(request, connection));
					response.sendRedirect("dbcontrol?requestType=coordinatorUser&flag=1");
					break;
				case "searchSeminar":
					session.setAttribute("seminars", Search.searchedSeminar(request, connection));
					response.sendRedirect("dbcontrol?requestType=goToCoordinatorSeminar&flag=1");
					break;
					
				case "searchHistory":
					session.setAttribute("history",Search.searchedHistory(request, connection));
					response.sendRedirect("dbcontrol?requestType=coordinatorManageUser&flag=1&accountId="+request.getParameter("accountId"));
					break;
					
				case "searchMyHistory":
					session.setAttribute("myHistory",Search.searchedMyHistory(request, connection,fub));
					response.sendRedirect("jsp/coordinator/coordinatorAccount_History.jsp");
					break;
				/// FRONT DESK 
				case "goToFrontDesk":
					sessionID = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession = SessionClass.retrieveOneSession(connection, sessionID);
					int participantCount = ManageParticipantsClass.countRegisteredSessionParticipants(sessionID, connection);
					sessionParticipants = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID);
					int countSessionParticipants = ManageParticipantsClass.countSessionParticipants(sessionID, connection);
					session.setAttribute("allParticipants", allParticipantAccounts);
					session.setAttribute("sessionDetails", oneSession);
					session.setAttribute("sessionParticipants", sessionParticipants);
					session.setAttribute("registeredParticipantCount", participantCount);
					session.setAttribute("participantCount", countSessionParticipants);
					response.sendRedirect("jsp/coordinator/frontDeskInterface.jsp?flag="+request.getParameter("flag"));
					break;
				case "goToFrontDeskFromSessions":
					// retrieve participants
					session.setAttribute("sessionID", request.getParameter("sessionID"));
					System.out.println(request.getParameter("sessionID"));
					sessionID2 = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts2 = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession2 = SessionClass.retrieveOneSession(connection, sessionID2);
					int participantCount2 = ManageParticipantsClass.countRegisteredSessionParticipants(sessionID2, connection);
					sessionParticipants2 = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID2);
					int countSessionParticipants2 = ManageParticipantsClass.countSessionParticipants(sessionID2, connection);
					session.setAttribute("allParticipants", allParticipantAccounts2);
					session.setAttribute("sessionDetails", oneSession2);
					session.setAttribute("sessionName", request.getParameter("sessionName"));
					session.setAttribute("sessionParticipants", sessionParticipants2);
					session.setAttribute("registeredParticipantCount", participantCount2);
					session.setAttribute("participantCount", countSessionParticipants2);
					response.sendRedirect("jsp/coordinator/frontDeskInterface.jsp");
					break;
				case "register":
					int x = FrontDeskClass.register(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToFrontDesk&flag="+x);
					break;
				////// REPORTS
				case "goToCoordinatorReports":
					int countAllSessions = ReportsClass.countAllSessions(connection);
					int countAllSeminars = ReportsClass.countAllSeminars(connection);
					int countAllAttendees = ReportsClass.countAllAttendees(connection);
					session.setAttribute("countAllSessions",countAllSessions);
					session.setAttribute("countAllSeminars",countAllSeminars);
					session.setAttribute("countAllAttendees",countAllAttendees);
					response.sendRedirect("jsp/coordinator/coordinatorReports.jsp");
					break;
				case "generateReport":
					ReportsClass.generateReport(response, connection);
					break;
				case "logout":
					session.invalidate();
					session = null;
					response.sendRedirect("index.jsp");
					break;
				default:
					response.sendRedirect("jsp/errorPage.jsp");
					break;
			}
		}
		else if (fub.getRoleName().equals("Participant"))
		{
			switch(requestType)
			{

				case "goToSeminar":
					SeminarClass.completeSeminar(request, connection);
					if(request.getParameter("flag")==null){
					ResultSet seminars = SeminarClass.retrieveSeminars(connection);
					session.setAttribute("seminars", seminars);
					}
					response.sendRedirect("jsp/participants/participantSeminars.jsp");
					break;
				//////// sessions
				case "goToSession":
					System.out.println("SESSION  " + SessionClass.completeSession(request, connection));
					SeminarClass.completeSeminar(request, connection);
					session.setAttribute("myAttendance" , UserClass.getMyAttendance(request, connection, fub));
					ResultSet venues = VenueClass.retrieveVenues(connection);
					ResultSet speakers = SessionClass.retrieveCoordinators(connection);
					ResultSet sessions = SessionClass.retrieveSessions(connection, Integer.parseInt(request.getParameter("seminarID")));
					session.setAttribute("seminarName", request.getParameter("seminarName"));
					session.setAttribute("session", sessions);
					session.setAttribute("venue", venues);
					session.setAttribute("speakers", speakers);
					session.setAttribute("seminarID", request.getParameter("seminarID"));
					response.sendRedirect("jsp/participants/participantSessions.jsp?flag="+request.getParameter("flag"));
					break;
			
				case "editSelfPassword": 
					if(!fub.getPassword().equals(Security.encrypt(request.getParameter("oldPassword")))){
					response.sendRedirect("jsp/participants/adminAccount.jsp?flag=0");
					} else{
					UserClass.editUserPassword(request, connection);
					response.sendRedirect("jsp/participants/participantAccount_Profile.jsp?flag=1"); // change to URL mapping (hehe)
					}
					break;
				case "editSelfInfo": 
					session.setAttribute("user",UserClass.editSelf(request, connection));
					response.sendRedirect("jsp/participants/participantAccount_Profile.jsp?flag=2");
					break;
		
				case  "home":
					SeminarClass.completeSeminar(request, connection);
					System.out.println("SESSION  " + SessionClass.completeSession(request, connection));
					
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						e.printStackTrace();

						session.setAttribute("errorMessage", e.toString());
						response.sendRedirect("jsp/errorPage.jsp");
					}
						response.sendRedirect("jsp/participants/participantHome.jsp");// change to URL mapping (hehe)
						break;
				case  "myAccount":
						response.sendRedirect("jsp/participants/participantAccount_Profile.jsp");// change to URL mapping (hehe)
						break;
				case  "myHistory":
					session.setAttribute("myHistory", UserClass.getMyHistory(request, connection,fub));
					response.sendRedirect("jsp/participants/participantAccount_Attendance.jsp");// change to URL mapping (hehe)
					break;
				case "searchSeminar":
					session.setAttribute("seminars", Search.searchedSeminar(request, connection));
					response.sendRedirect("dbcontrol?requestType=goToSeminar&flag=1");
					break;
				case "searchMyHistory":
					session.setAttribute("myHistory",Search.searchedMyHistory(request, connection,fub));
					response.sendRedirect("jsp/participants/participantAccount_Attendance.jsp");
					break;
					
				case "register2":
					session.setAttribute("sessionID", request.getParameter("sessionID"));
					int p = -10;
					if(request.getParameter("register").equals("1")){
					p = ManageParticipantsClass.addParticipant(request,fub.getAccountID()+"",connection)+1;
					}
					else{
					p= 	ManageParticipantsClass.cancelRegistration2(connection,request, fub.getAccountID());
					}
					response.sendRedirect("dbcontrol?requestType=goToSession&flag="+p+"&seminarID="+request.getParameter("seminarID"));
					break;
					
				case "logout":
					session.invalidate();
					session = null;
					response.sendRedirect("index.jsp");
					break;
				default:
					response.sendRedirect("jsp/errorPage.jsp");
					break;
			}
		}
		else if (fub.getRoleName().equals("Staff"))
		{
			switch(requestType)
			{
				// Staff ACCOUNT
				//////// seminar
				case "goToStaffSeminar":
					SeminarClass.completeSeminar(request, connection);
					if(request.getParameter("flag")==null){
					ResultSet seminars = SeminarClass.retrieveSeminars(connection);
					session.setAttribute("seminars", seminars);
					}
					response.sendRedirect("jsp/staff/staffSeminars.jsp");
					break;
				//////// sessions
				case "goToStaffSession":
					System.out.println("SESSION  " + SessionClass.completeSession(request, connection));
					SeminarClass.completeSeminar(request, connection);
					ResultSet venues = VenueClass.retrieveVenues(connection);
					ResultSet speakers = SessionClass.retrieveCoordinators(connection);
					ResultSet sessions = SessionClass.retrieveSessions(connection, Integer.parseInt(request.getParameter("seminarID")));
					session.setAttribute("seminarName", request.getParameter("seminarName"));
					session.setAttribute("session", sessions);
					session.setAttribute("venue", venues);
					session.setAttribute("speakers", speakers);
					session.setAttribute("seminarID", request.getParameter("seminarID"));
					response.sendRedirect("jsp/staff/staffSessions.jsp");
					break;
				case "goToStaffSessionFromAction":
					ResultSet venues2 = VenueClass.retrieveVenues(connection);
					ResultSet speakers2 = SessionClass.retrieveCoordinators(connection);
					ResultSet sessions2 = SessionClass.retrieveSessions(connection, Integer.valueOf((String)session.getAttribute("seminarID")));
					session.setAttribute("session", sessions2);
					session.setAttribute("venue", venues2);
					session.setAttribute("speakers", speakers2);
					response.sendRedirect("jsp/staff/staffSessions.jsp");
					break;
				///////// manage participants
				case "addParticipants":
					ManageParticipantsClass.addMultipleParticipants(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToStaffManageParticipants");
					break;
				case "goToStaffManageParticipants":
					int sessionID = Integer.valueOf((String) session.getAttribute("sessionID"));
					ResultSet allParticipantAccounts = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					ResultSet oneSession = SessionClass.retrieveOneSession(connection, sessionID);
					ResultSet sessionParticipants = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID);
					session.setAttribute("allParticipants", allParticipantAccounts);
					session.setAttribute("sessionDetails", oneSession);
					session.setAttribute("sessionParticipants", sessionParticipants);
					int participants = ManageParticipantsClass.countSessionParticipants(sessionID, connection);
					session.setAttribute("countParticipants", participants);					
					response.sendRedirect("jsp/staff/staffManageParticipants.jsp");
					break;
				case "goToStaffManageParticipantsFromStaffSessions":
					// retrieve participants
					session.setAttribute("sessionID", request.getParameter("sessionID"));
					System.out.println(request.getParameter("sessionID"));
					int sessionID2 = Integer.valueOf((String) session.getAttribute("sessionID"));
					ResultSet allParticipantAccounts2 = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					ResultSet oneSession2 = SessionClass.retrieveOneSession(connection, sessionID2);
					ResultSet sessionParticipants2 = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID2);
					session.setAttribute("allParticipants", allParticipantAccounts2);
					session.setAttribute("sessionDetails", oneSession2);
					session.setAttribute("sessionName", request.getParameter("sessionName"));
					session.setAttribute("sessionParticipants", sessionParticipants2);
					int participants2 = ManageParticipantsClass.countSessionParticipants(sessionID2, connection);
					session.setAttribute("countParticipants", participants2);
					response.sendRedirect("jsp/staff/staffManageParticipants.jsp");
					break;
					
				case "cancelRegistration":
					ManageParticipantsClass.cancelRegistration(connection, Integer.parseInt(request.getParameter("attendanceID")));
					response.sendRedirect("dbcontrol?requestType=goToStaffManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
				case "certify":
					ManageParticipantsClass.setCertification(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToStaffManageCertification&sessionID="+session.getAttribute("sessionID"));
					break;
					
				case "setStatus":
					ManageParticipantsClass.setStatus(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToStaffManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
				
				case "setAttendance":
					ManageParticipantsClass.setTime(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToStaffManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
					
				case "goToStaffManageCertification":
					sessionID = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession = SessionClass.retrieveOneSession(connection, sessionID);
					sessionParticipants = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID);
					session.setAttribute("allParticipants", allParticipantAccounts);
					session.setAttribute("sessionDetails", oneSession);
					session.setAttribute("sessionParticipants", sessionParticipants);
					response.sendRedirect("jsp/staff/staffManageCertification.jsp");
					break;
				case "goToStaffManageCertificationFromStaffSessions":
					// retrieve participants
					session.setAttribute("sessionID", request.getParameter("sessionID"));
					System.out.println(request.getParameter("sessionID"));
					sessionID2 = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts2 = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession2 = SessionClass.retrieveOneSession(connection, sessionID2);
					sessionParticipants2 = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID2);
					session.setAttribute("allParticipants", allParticipantAccounts2);
					session.setAttribute("sessionDetails", oneSession2);
					session.setAttribute("sessionName", request.getParameter("sessionName"));
					session.setAttribute("sessionParticipants", sessionParticipants2);
					response.sendRedirect("jsp/staff/staffManageCertification.jsp");
					break;
				/// USER MANAGEMENT
				case "staffUser": 
					if(request.getParameter("flag")==null){
						session.setAttribute("allUser",UserClass.getAllUsers(request, connection));	
					}
					try {
						session.setAttribute("college",SQLOperations.selectCollege(connection).executeQuery());
						session.setAttribute("department",SQLOperations.selectDepartment(connection).executeQuery());
						session.setAttribute("role",SQLOperations.selectRole(connection).executeQuery());
					} catch (SQLException e) {
					e.printStackTrace();
					}
					response.sendRedirect("jsp/staff/staffUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "staffManageUser": 
					if(request.getParameter("flag")==null){
					session.setAttribute("history", UserClass.getHistory(request, connection));
					}
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					
					response.sendRedirect("jsp/staff/staffManageUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "staffManageUserDone": 
					UserClass.editUser(request, connection);
					session.setAttribute("history", UserClass.getHistory(request, connection));
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					response.sendRedirect("jsp/staff/staffManageUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "staffManageUserDelete": 
					UserClass.deleteUser(request, connection);
					session.setAttribute("history", UserClass.getHistory(request, connection));
					session.setAttribute("allUser", UserClass.getAllUsers(request, connection));
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					
					response.sendRedirect("jsp/staff/staffUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "staffAddUser": 
					session.setAttribute("allUser", UserClass.getAllUsers(request, connection));
					
					UserClass.createUser(request, connection);
					response.sendRedirect("dbcontrol?requestType=staffUser"); // change to URL mapping (hehe)
					break;
				case "staffEditPassword": 
					session.setAttribute("oneUser",UserClass.getUserById(request, connection));
					UserClass.editUserPassword(request, connection);
					response.sendRedirect("jsp/staff/staffManageUsers.jsp"); // change to URL mapping (hehe)
					break;
				case "editSelfPassword": 
					if(!fub.getPassword().equals(Security.encrypt(request.getParameter("oldPassword")))){
						response.sendRedirect("jsp/staff/staffAccount.jsp?flag=0");
					} else{
					UserClass.editUserPassword(request, connection);
					response.sendRedirect("jsp/staff/staffAccount.jsp?flag=1"); // change to URL mapping (hehe)
					}
					break;
				case "editSelfInfo": 
					session.setAttribute("user",UserClass.editSelf(request, connection));
					response.sendRedirect("jsp/staff/staffAccount.jsp?flag=2");
					break;
				// ANNOUNCEMENTS :))
				case "addAnnouncement":
						AnnouncementClass.createAnnouncement(request, connection);
						try {
							session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
						} catch (SQLException e) {
							e.printStackTrace();
							session.setAttribute("errorMessage", e.toString());
							response.sendRedirect("jsp/errorPage.jsp");
						}
							response.sendRedirect("jsp/staff/staffHome.jsp");// change to URL mapping (hehe)
					break;
				case  "announcementEdit":
					AnnouncementClass.editAnnouncement(request, connection);
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						e.printStackTrace();
					}
						response.sendRedirect("jsp/staff/staffHome.jsp");// change to URL mapping (hehe)
						break;
				case  "announcementDelete":
					AnnouncementClass.deleteAnnouncement(request, connection);
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
						response.sendRedirect("jsp/staff/staffHome.jsp");// change to URL mapping (hehe)
						break;
				case  "home":
					SeminarClass.completeSeminar(request, connection);
					System.out.println("SESSION  " + SessionClass.completeSession(request, connection));
					
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						e.printStackTrace();
						session.setAttribute("errorMessage", e.toString());
						response.sendRedirect("jsp/errorPage.jsp");
					}
						response.sendRedirect("jsp/staff/staffHome.jsp");// change to URL mapping (hehe)
						break;
				case  "myAccount":
						response.sendRedirect("jsp/staff/staffAccount.jsp");// change to URL mapping (hehe)
						break;
				case  "myHistory":
					session.setAttribute("myHistory", UserClass.getMyHistory(request, connection,fub));
					response.sendRedirect("jsp/staff/staffAccount_History.jsp");// change to URL mapping (hehe)
					break;
				//search
				case "searchName":
					session.setAttribute("allUser",Search.searchedUser(request, connection));
					response.sendRedirect("dbcontrol?requestType=staffUser&flag=1");
					break;
				case "searchSeminar":
					session.setAttribute("seminars", Search.searchedSeminar(request, connection));
					response.sendRedirect("dbcontrol?requestType=goToStaffSeminar&flag=1");
					break;
					
				case "searchHistory":
					session.setAttribute("history",Search.searchedHistory(request, connection));
					response.sendRedirect("dbcontrol?requestType=staffManageUser&flag=1&accountId="+request.getParameter("accountId"));
					break;
					
				case "searchMyHistory":
					session.setAttribute("myHistory",Search.searchedMyHistory(request, connection,fub));
					response.sendRedirect("jsp/staff/staffAccount_History.jsp");
					break;
				/// FRONT DESK 
				case "goToFrontDesk":
					sessionID = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession = SessionClass.retrieveOneSession(connection, sessionID);
					int participantCount = ManageParticipantsClass.countRegisteredSessionParticipants(sessionID, connection);
					sessionParticipants = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID);
					int countSessionParticipants = ManageParticipantsClass.countSessionParticipants(sessionID, connection);
					session.setAttribute("allParticipants", allParticipantAccounts);
					session.setAttribute("sessionDetails", oneSession);
					session.setAttribute("sessionParticipants", sessionParticipants);
					session.setAttribute("registeredParticipantCount", participantCount);
					session.setAttribute("participantCount", countSessionParticipants);
					response.sendRedirect("jsp/staff/frontDeskInterface.jsp");
					break;
				case "goToFrontDeskFromSessions":
					// retrieve participants
					session.setAttribute("sessionID", request.getParameter("sessionID"));
					System.out.println(request.getParameter("sessionID"));
					sessionID2 = Integer.valueOf((String) session.getAttribute("sessionID"));
					allParticipantAccounts2 = ManageParticipantsClass.retrieveAllParticipantAccounts(connection);
					oneSession2 = SessionClass.retrieveOneSession(connection, sessionID2);
					int participantCount2 = ManageParticipantsClass.countRegisteredSessionParticipants(sessionID2, connection);
					sessionParticipants2 = ManageParticipantsClass.retrieveSessionParticipants(connection, sessionID2);
					int countSessionParticipants2 = ManageParticipantsClass.countSessionParticipants(sessionID2, connection);
					session.setAttribute("allParticipants", allParticipantAccounts2);
					session.setAttribute("sessionDetails", oneSession2);
					session.setAttribute("sessionName", request.getParameter("sessionName"));
					session.setAttribute("sessionParticipants", sessionParticipants2);
					session.setAttribute("registeredParticipantCount", participantCount2);
					session.setAttribute("participantCount", countSessionParticipants2);
					response.sendRedirect("jsp/staff/frontDeskInterface.jsp");
					break;
				case "register":
					FrontDeskClass.register(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToFrontDesk");
					break;
				case "logout":
					session.invalidate();
					session = null;
					response.sendRedirect("index.jsp");
					break;
				default:
					response.sendRedirect("jsp/errorPage.jsp");
					break;
			}
		}
		else
		{
			response.sendRedirect("jsp/errorPage.jsp");
		}
	}
}
