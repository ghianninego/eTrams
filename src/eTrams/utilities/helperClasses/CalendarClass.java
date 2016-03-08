package eTrams.utilities.helperClasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import eTrams.model.EventBean;
import eTrams.utilities.databaseUtilities.SQLOperations;

public class CalendarClass {


	public static ArrayList<EventBean> createEventList(Connection connection, ResultSet rs)
	{
		ArrayList<EventBean> list = new ArrayList<EventBean>();
		try{
			while (rs.next()) 
			{
				EventBean e = new EventBean();
				e.setSessionID(rs.getInt("sessionID"));
				e.setSeminarName(rs.getString("seminarName"));
				e.setSessionName(rs.getString("sessionName"));
				e.setVenueName(rs.getString("venueName"));
				e.setVenueRemarks(rs.getString("venueRemarks"));
				e.setCapacity(rs.getInt("capacity"));
				e.setDate(rs.getString("date"));
				String temp1[] = rs.getString("startTime").split(":");
				e.setStartTime(temp1[0]+":"+temp1[1]);
				String temp2[] = rs.getString("endTime").split(":");
				e.setEndTime(temp2[0]+":"+temp2[1]);
				e.setSpeakerName(rs.getString("firstName") + " " + rs.getString("lastName"));
				e.setCompletion(rs.getInt("completion"));
				
				
				
				list.add(e);
				
			}
		}
		catch (SQLException e)
		{
			System.out.println("SQLException - createEventList : " + e.getMessage());
			return null;
		}
		return list;
	}
	
	
	public static ArrayList<EventBean> selectData(HttpServletRequest request, Connection connection) {
	ArrayList<EventBean> list = new ArrayList<EventBean>();
	ResultSet rs = null;
	try {
		rs = SQLOperations.selectAllSession(connection).executeQuery();
		list  = createEventList(connection, rs);
		return list;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return list;
	}
	
	}	
	

	
	
}
