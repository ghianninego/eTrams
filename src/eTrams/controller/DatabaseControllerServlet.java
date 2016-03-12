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

import eTrams.utilities.databaseUtilities.DatabaseDataSource;
import eTrams.utilities.databaseUtilities.SQLOperations;
import eTrams.utilities.helperClasses.AnnouncementClass;
import eTrams.utilities.helperClasses.CalendarClass;
import eTrams.utilities.helperClasses.ManageParticipantsClass;
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
				ResultSet seminars = SeminarClass.retrieveSeminars(connection);
				session.setAttribute("seminars", seminars);
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
				session.setAttribute("allUser",UserClass.getAllUsers(request, connection));
				try {
					session.setAttribute("college",SQLOperations.selectCollege(connection).executeQuery());
					session.setAttribute("department",SQLOperations.selectDepartment(connection).executeQuery());
					session.setAttribute("role",SQLOperations.selectRole(connection).executeQuery());
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}

				response.sendRedirect("jsp/admin/adminUsers.jsp"); // change to URL mapping (hehe)
				// else if coordinator0
				//	request.getRequestDispatcher("coordinatorSeminars.jsp");
				break;
			case "adminManageUser": 
				session.setAttribute("history", UserClass.getHistory(request, connection));
				session.setAttribute("oneUser",UserClass.getUserById(request, connection));
			

				response.sendRedirect("jsp/admin/adminManageUsers.jsp"); // change to URL mapping (hehe)
				// else if coordinator0
				//	request.getRequestDispatcher("coordinatorSeminars.jsp");
				break;
			case "adminManageUserDone": 
				System.out.println("dumaan3");
				UserClass.editUser(request, connection);
				session.setAttribute("history", UserClass.getHistory(request, connection));
				session.setAttribute("oneUser",UserClass.getUserById(request, connection));
				response.sendRedirect("jsp/admin/adminManageUsers.jsp"); // change to URL mapping (hehe)
				// else if coordinator0
				//	request.getRequestDispatcher("coordinatorSeminars.jsp");
				break;
			case "adminManageUserDelete": 
				UserClass.deleteUser(request, connection);
				session.setAttribute("history", UserClass.getHistory(request, connection));
				session.setAttribute("allUser", UserClass.getAllUsers(request, connection));
				session.setAttribute("oneUser",UserClass.getUserById(request, connection));
				
				response.sendRedirect("jsp/admin/adminUsers.jsp"); // change to URL mapping (hehe)
				// else if coordinator0
				//	request.getRequestDispatcher("coordinatorSeminars.jsp");
				break;
			case "adminAddUser": 
				session.setAttribute("allUser", UserClass.getAllUsers(request, connection));
				
				UserClass.createUser(request, connection);
				response.sendRedirect("dbcontrol?requestType=adminUser"); // change to URL mapping (hehe)
				// else if coordinator0
				//	request.getRequestDispatcher("coordinatorSeminars.jsp");
				break;
			case "adminEditPassword": 
				session.setAttribute("oneUser",UserClass.getUserById(request, connection));
				UserClass.editUserPassword(request, connection);
				response.sendRedirect("jsp/admin/adminManageUsers.jsp"); // change to URL mapping (hehe)
				// else if coordinator0
				//	request.getRequestDispatcher("coordinatorSeminars.jsp");
				break;
			case "login": 
				session.setAttribute("eventsList",CalendarClass.selectData(request, connection));
				session.setAttribute("user",UserClass.login(request, connection));
				try {
					session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.sendRedirect("jsp/admin/adminHome.jsp");// change to URL mapping (hehe)
				// else if coordinator0
				//	request.getRequestDispatcher("coordinatorSeminars.jsp");
				break;
			case "editSelfPassword": 
				UserClass.editUserPassword(request, connection);
				response.sendRedirect("jsp/admin/adminAccount.jsp"); // change to URL mapping (hehe)
				// else if coordinator0
				//	request.getRequestDispatcher("coordinatorSeminars.jsp");
				break;
			case "editSelfInfo": 
				
				session.setAttribute("user",UserClass.editSelf(request, connection));
				response.sendRedirect("jsp/admin/adminAccount.jsp");// change to URL mapping (hehe)
				// else if coordinator0
				//	request.getRequestDispatcher("coordinatorSeminars.jsp");
				break;
			// ANNOUNCEMENTS :))
			case "addAnnouncement":
					AnnouncementClass.createAnnouncement(request, connection);
					try {
						session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
						response.sendRedirect("jsp/admin/adminHome.jsp");// change to URL mapping (hehe)
				break;
			case  "announcementEdit":
				AnnouncementClass.editAnnouncement(request, connection);
				try {
					session.setAttribute("announcement",SQLOperations.selectAnnouncement(connection).executeQuery());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
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
		}
	}

}
