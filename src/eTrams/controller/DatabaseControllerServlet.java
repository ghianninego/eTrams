package eTrams.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eTrams.utilities.databaseUtilities.DatabaseDataSource;
import eTrams.utilities.helperClasses.SeminarClass;
import eTrams.utilities.helperClasses.SessionClass;

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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// INCLUDE USER TYPES SOON
		String requestType = request.getParameter("requestType");
		session = request.getSession();
		switch(requestType)
		{
			// ADMIN ACCOUNT
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
			case "createSession":
				SessionClass.createSession(request, connection); // temporary ID (must get from session)
				response.sendRedirect("dbcontrol?requestType=goToAdminSession&seminarID="+request.getParameter("seminarID")); // change to URL mapping (hehe)
				break;
			case "goToAdminSession":
				ResultSet sessions = SessionClass.retrieveSessions(connection, Integer.parseInt(request.getParameter("seminarID")));
				session.setAttribute("session", sessions);
				session.setAttribute("seminarID", request.getParameter("seminarID"));
				response.sendRedirect("jsp/admin/adminSessions.jsp");
				break;
		}
	}

}
