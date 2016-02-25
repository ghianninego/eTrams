package eTrams.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eTrams.utilities.databaseUtilities.DatabaseDataSource;
import eTrams.utilities.helperClasses.SeminarClass;

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
		
		switch(requestType)
		{
			case "createSeminar": 
				SeminarClass.createSeminar(request, connection, 1); // temporary ID (must get from session)
				// if admin
					response.sendRedirect("jsp/admin/adminSeminars.jsp"); // change to URL mapping (hehe)
				// else if coordinator0
				//	request.getRequestDispatcher("coordinatorSeminars.jsp");
				break;
			
		}
	}

}
