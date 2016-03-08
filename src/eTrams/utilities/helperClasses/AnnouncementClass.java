package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import eTrams.model.AnnouncementBean;
import eTrams.utilities.beanUtilities.BeanFactory;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class AnnouncementClass {

	
	public static int createAnnouncement(HttpServletRequest request, Connection connection) {
		String title = request.getParameter("announcementTitle");
		String content = request.getParameter("announcementContent");
		content = content.replaceAll("\n","<br />");

		int creatorId = Integer.parseInt(request.getParameter("creatorID"));
		int active = 1;
		AnnouncementBean ab = (AnnouncementBean) BeanFactory.getBean(0, creatorId, title, content, active);
			if	(ab.storeToDatabase(connection)> 0) {
				return 1;
		} else {
			return 0;
		}

	}
	
	
	public static int deleteAnnouncement(HttpServletRequest request, Connection connection) {
		int announcementID = Integer.parseInt(request.getParameter("announcementID"));
		int updated = 0;
		try {
			connection.setAutoCommit(false);
			PreparedStatement pstmt = SQLOperations.deleteAnnouncement(connection);
			pstmt.setInt(1, announcementID);
			updated = pstmt.executeUpdate();
			connection.commit();

		} catch (SQLException sqle) {
			System.out.println("SQLException -" + sqle.getMessage());
			try {
				connection.rollback();
			} catch (SQLException sql) {
				System.err.println("Error on Update Connection Rollback - " + sql.getMessage());
			}
			return updated;
		}
		return updated;
	}
	
	public static int editAnnouncement(HttpServletRequest request, Connection connection) {
		String title = request.getParameter("announcementTitle");
		String content = request.getParameter("announcementContent");
		content = content.replaceAll("\n","<br />");
		int announcementID = Integer.parseInt(request.getParameter("announcementID"));

		int updated = 0;
		try {
			connection.setAutoCommit(false);
			PreparedStatement pstmt = SQLOperations.updateAnnouncement(connection);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, announcementID);
			updated = pstmt.executeUpdate();
			connection.commit();

		} catch (SQLException sqle) {
			System.out.println("SQLException -" + sqle.getMessage());
			try {
				connection.rollback();
			} catch (SQLException sql) {
				System.err.println("Error on Update Connection Rollback - " + sql.getMessage());
			}
			return updated;
		}
		return updated;
	}
	
	
}
