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
import eTrams.utilities.databaseUtilities.DatabaseDataSource;
import eTrams.utilities.databaseUtilities.SQLOperations;
import eTrams.utilities.helperClasses.AnnouncementClass;
import eTrams.utilities.helperClasses.CalendarClass;
import eTrams.utilities.helperClasses.CollegeClass;
import eTrams.utilities.helperClasses.ManageParticipantsClass;
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
		session = request.getSession();
		
		if (requestType.equals("login"))
		{
			try 
			{
				FinalUserBean fub = UserClass.login(request, connection);
				//System.out.println("SEMINAR  " + SeminarClass.completeSeminar(request, connection));
				System.out.println("SEMSSION  " + SessionClass.completeSession(request, connection));
				session.setAttribute("eventsList",CalendarClass.selectData(request, connection));
				session.setAttribute("user", fub);
				session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
				
				if (fub.getRoleName().equals("Admin"))
					response.sendRedirect("jsp/admin/adminHome.jsp");
				else if (fub.getRoleName().equals("Coordinator"))
					response.sendRedirect("jsp/admin/coordinatorHome.jsp");
				else if (fub.getRoleName().equals("Participant"))
					response.sendRedirect("jsp/admin/participantHome.jsp");
				else if (fub.getRoleName().equals("Staff"))
					response.sendRedirect("jsp/admin/staffHome.jsp");
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else
		{
			switch(requestType)
			{
				// ADMIN ACCOUNT
				//////// seminar
				case "createSeminar": 
					SeminarClass.createSeminar(request, connection, 1); // temporary ID (must get from session)
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
					if(request.getParameter("flag")==null){
					ResultSet seminars = SeminarClass.retrieveSeminars(connection);
					session.setAttribute("seminars", seminars);
					}
					response.sendRedirect("jsp/admin/adminSeminars.jsp");
					break;
				//////// sessions
				case "createSession":
					SessionClass.createSession(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminSessionFromAction&seminarID="+session.getAttribute("seminarID")); // change to URL mapping (hehe)
					break;
				case "editSession":
					SessionClass.editSession(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminSessionFromAction&seminarID="+session.getAttribute("seminarID"));
					break;
				case "deleteSession":
					SessionClass.deleteSession(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminSessionFromAction&seminarID="+session.getAttribute("seminarID"));
					break;
				case "goToAdminSession":
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
					response.sendRedirect("jsp/admin/adminManageParticipants.jsp");
					break;
					
				case "cancelRegistration":
					ManageParticipantsClass.cancelRegistration(connection, Integer.parseInt(request.getParameter("attendanceID")));
					response.sendRedirect("dbcontrol?requestType=goToAdminManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
				case "certify":
					ManageParticipantsClass.setCertification(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
					
				case "setStatus":
					ManageParticipantsClass.setStatus(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminManageParticipants&sessionID="+session.getAttribute("sessionID"));
					break;
				
				case "setAttendance":
					ManageParticipantsClass.setTime(request, connection);
					response.sendRedirect("dbcontrol?requestType=goToAdminManageParticipants&sessionID="+session.getAttribute("sessionID"));
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
					System.out.println("dumaan3");
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
					UserClass.editUserPassword(request, connection);
					response.sendRedirect("jsp/admin/adminAccount.jsp"); // change to URL mapping (hehe)
					break;
				case "editSelfInfo": 
					session.setAttribute("user",UserClass.editSelf(request, connection));
					response.sendRedirect("jsp/admin/adminAccount.jsp");
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
					}
						response.sendRedirect("jsp/admin/adminHome.jsp");// change to URL mapping (hehe)
						break;
				case  "home":
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
			}
		}
	}
}
