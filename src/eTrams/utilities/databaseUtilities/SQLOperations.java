package eTrams.utilities.databaseUtilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class SQLOperations 
{
//----------Insert	CHECK
	private static PreparedStatement createNewCollege;
	private static PreparedStatement createNewDepartment;
	private static PreparedStatement createNewUserInfo;
	private static PreparedStatement createNewUserAccount;
	private static PreparedStatement createNewSeminar;
	private static PreparedStatement createNewSession;
	private static PreparedStatement createNewAttendance;
	private static PreparedStatement createNewAnnouncement;
	private static PreparedStatement createNewVenue;
//-----------Delete	
	private static PreparedStatement deleteCollege;
	private static PreparedStatement deleteDepartment;
	private static PreparedStatement deleteUserInfo;
	private static PreparedStatement deleteUserAccount;
	private static PreparedStatement deleteSeminar;
	private static PreparedStatement deleteSession;
	private static PreparedStatement deleteAttendance;
	private static PreparedStatement deleteAnnouncement;
	private static PreparedStatement deleteVenue;
//-----------Edit/update
	private static PreparedStatement updateUserInfo;
	private static PreparedStatement updateUserAccount;
	private static PreparedStatement updateAnnouncement;
	private static PreparedStatement updateSeminar;
	private static PreparedStatement updateSession;
	private static PreparedStatement updateTimeIn;
	private static PreparedStatement updateTimeOut;
	//private static PreparedStatement updateAnnouncement;
//-----------select CHECK
	private static PreparedStatement selectCollege;
	private static PreparedStatement selectDepartment;
	private static PreparedStatement selectUserInfo;
	private static PreparedStatement selectUserAccount;
	private static PreparedStatement selectSeminar;
	private static PreparedStatement selectSession;
	private static PreparedStatement selectAttendance;
	private static PreparedStatement selectAnnouncement;
	private static PreparedStatement selectVenue;
	
//-----------select SINGLE CHECK
 	private static PreparedStatement selectOneUserInfo;
	private static PreparedStatement selectOneUserAccount;
	private static PreparedStatement selectOneSeminar;
	private static PreparedStatement selectOneSession;
	private static PreparedStatement selectOneAttendance;
	private static PreparedStatement selectOneAnnouncement;
	private static PreparedStatement selectOneCollege;
	private static PreparedStatement selectOneDepartment;
	
	
/*-----------------------------------------------------------------------------------------
*******************************************INSERT****************************************** 
------------------------------------------------------------------------------------------*/	
	public synchronized static PreparedStatement createNewCollege(Connection connection)
	{
		try 
		{
			if (createNewCollege == null)
				createNewCollege = connection.prepareStatement("INSERT INTO collegeTable VALUES (?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT CollegeTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT CollegeTable");         
		return createNewCollege;
	}
	
	public synchronized static PreparedStatement createNewDepartment(Connection connection)
	{
		try 
		{
			if (createNewDepartment == null)
				createNewDepartment = connection.prepareStatement("INSERT INTO departmentTable VALUES (?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT departmentTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT departmentTable");         
		return createNewDepartment;
	}
	
	public synchronized static PreparedStatement createNewUserInfo(Connection connection)
	{
		try 
		{
			if (createNewUserInfo == null)
				createNewUserInfo = connection.prepareStatement("INSERT INTO userInfoTable VALUES (?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT userInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT userInfoTable");         
		return createNewUserInfo;
	}
	
	public synchronized static PreparedStatement createNewUserAccount(Connection connection)
	{
		try 
		{
			if (createNewUserAccount == null)
				createNewUserAccount = connection.prepareStatement("INSERT INTO userAccountTable VALUES (?,?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT userAccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT userAccountTable");         
		return createNewUserInfo;
	}
	
	public synchronized static PreparedStatement createNewSeminar(Connection connection)
	{
		try 
		{
			if (createNewSeminar == null)
				createNewSeminar = connection.prepareStatement("INSERT INTO seminarTable VALUES (NULL, ?,?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT seminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT seminarTable");         
		return createNewSeminar;
	}
	
	public synchronized static PreparedStatement createNewSession(Connection connection)
	{
		try 
		{
			if (createNewSession == null)
				createNewSession = connection.prepareStatement("INSERT INTO sessionTable VALUES (?,?,?,?,?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT sessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT sessionTable");         
		return createNewSession;
	}
	
	
	public synchronized static PreparedStatement createNewAttendance(Connection connection)
	{
		try 
		{
			if (createNewAttendance == null)
				createNewAttendance = connection.prepareStatement("INSERT INTO attendanceTable VALUES (?,?,?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT attendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT attendanceTable");         
		return createNewAttendance;
	}
	
	public synchronized static PreparedStatement createNewAnnouncement(Connection connection)
	{
		try 
		{
			if (createNewAnnouncement == null)
				createNewAnnouncement = connection.prepareStatement("INSERT INTO announcementTable VALUES (?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT announcementTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT announcementTable");         
		return createNewAnnouncement;
	}
	
	public synchronized static PreparedStatement createNewVenue(Connection connection)
	{
		try 
		{
			if (createNewVenue == null)
				createNewVenue = connection.prepareStatement("INSERT INTO venueTable VALUES (?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT VenueTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT VenueTable");         
		return createNewVenue;
	}
/*-----------------------------------------------------------------------------------------
*******************************************SELECT  Single***************************************** 
------------------------------------------------------------------------------------------*/	
public synchronized static PreparedStatement selectOneCollege(Connection connection)
	{
		try 
		{
			if (selectOneCollege == null)
				selectOneCollege = connection.prepareStatement("SELECT * FROM collegeTable WHERE collegeTableId = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne CollegeTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne CollegeTable");         
		return selectOneCollege;
	}
	
	public synchronized static PreparedStatement selectOneDepartment(Connection connection)
	{
		try 
		{
			if (selectOneDepartment == null)
				selectOneDepartment = connection.prepareStatement("SELECT * FROM departmentTable WHERE departmentTableId = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne departmentTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne departmentTable");         
		return selectOneDepartment;
	}
	
	public synchronized static PreparedStatement selectOneUserInfo(Connection connection)
	{
		try 
		{
			if (selectOneUserInfo == null)
				selectOneUserInfo = connection.prepareStatement("SELECT * FROM userInfoTable WHERE userInfoTableId = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne userInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne userInfoTable");         
		return selectOneUserInfo;
	}
	
	public synchronized static PreparedStatement selectOneUserAccount(Connection connection)
	{
		try 
		{
			if (selectOneUserAccount == null)
				selectOneUserAccount = connection.prepareStatement("SELECT * FROM userAccountTable WHERE userAccountTableId = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne userAccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne userAccountTable");         
		return selectOneUserAccount;
	}
	
	public synchronized static PreparedStatement selectOneSeminar(Connection connection)
	{
		try 
		{
			if (selectOneSeminar == null)
				selectOneSeminar = connection.prepareStatement("SELECT * FROM seminarTable WHERE seminarTableId = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne seminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne seminarTable");         
		return selectOneSeminar;
	}
	
	public synchronized static PreparedStatement selectOneSession(Connection connection)
	{
		try 
		{
			if (selectOneSession == null)
				selectOneSession = connection.prepareStatement("SELECT * FROM sessionTable WHERE sessionTableId = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne sessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne sessionTable");         
		return selectOneSession;
	}
	
	public synchronized static PreparedStatement selectOneAttendance(Connection connection)
	{
		try 
		{
			if (selectOneAttendance == null)
				selectOneAttendance = connection.prepareStatement("SELECT * FROM attendanceTable WHERE attendanceTableId = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne attendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne attendanceTable");         
		return selectOneAttendance;
	}
	

	
	public synchronized static PreparedStatement selectOneAnnouncement(Connection connection)
	{
		try 
		{
			if (selectOneAnnouncement == null)
				selectOneAnnouncement = connection.prepareStatement("SELECT * FROM announcementTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne announcementTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne announcementTable");         
		return selectOneAnnouncement;
	}
	
/*-----------------------------------------------------------------------------------------
*******************************************SELECT****************************************** 
------------------------------------------------------------------------------------------*/	
public synchronized static PreparedStatement selectCollege(Connection connection)
	{
		try 
		{
			if (selectCollege == null)
				selectCollege = connection.prepareStatement("SELECT * FROM collegeTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT CollegeTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT CollegeTable");         
		return selectCollege;
	}
	
	public synchronized static PreparedStatement selectDepartment(Connection connection)
	{
		try 
		{
			if (selectDepartment == null)
				selectDepartment = connection.prepareStatement("SELECT * FROM departmentTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT departmentTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT departmentTable");         
		return selectDepartment;
	}
	
	public synchronized static PreparedStatement selectUserInfo(Connection connection)
	{
		try 
		{
			if (selectUserInfo == null)
				selectUserInfo = connection.prepareStatement("SELECT * FROM userInfoTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT userInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT userInfoTable");         
		return selectUserInfo;
	}
	
	public synchronized static PreparedStatement selectUserAccount(Connection connection)
	{
		try 
		{
			if (selectUserAccount == null)
				selectUserAccount = connection.prepareStatement("SELECT * FROM userAccountTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT userAccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT userAccountTable");         
		return selectUserAccount;
	}
	
	public synchronized static PreparedStatement selectSeminar(Connection connection)
	{
		try 
		{
			if (selectSeminar == null)
				selectSeminar = connection.prepareStatement("SELECT * FROM seminarTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT seminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT seminarTable");         
		return selectSeminar;
	}
	
	public synchronized static PreparedStatement selectSession(Connection connection)
	{
		try 
		{
			if (selectSession == null)
				selectSession = connection.prepareStatement("SELECT * FROM sessionTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT sessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT sessionTable");         
		return selectSession;
	}
	
	
	public synchronized static PreparedStatement selectAttendance(Connection connection)
	{
		try 
		{
			if (selectAttendance == null)
				selectAttendance = connection.prepareStatement("SELECT * FROM attendanceTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT attendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT attendanceTable");         
		return selectAttendance;
	}
	
	public synchronized static PreparedStatement selectAnnouncement(Connection connection)
	{
		try 
		{
			if (selectAnnouncement == null)
				selectAnnouncement = connection.prepareStatement("SELECT * FROM announcementTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT announcementTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT announcementTable");         
		return selectAnnouncement;
	}
	public synchronized static PreparedStatement selectVenue(Connection connection)
	{
		try 
		{
			if (selectVenue == null)
				selectVenue = connection.prepareStatement("SELECT * FROM venueTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT VenueTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT VenueTable");         
		return selectVenue;
	}	
	
/*-----------------------------------------------------------------------------------------
*****************************************LOGICAL DELETE!****************************************** 
------------------------------------------------------------------------------------------*/	
public synchronized static PreparedStatement deleteCollege(Connection connection)
	{
		try 
		{
			if (deleteCollege == null)
				deleteCollege = connection.prepareStatement("UPDATE collegeTable SET active = '0' WHERE collegeTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete CollegeTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete CollegeTable");         
		return deleteCollege;
	}
	
	public synchronized static PreparedStatement deleteDepartment(Connection connection)
	{
		try 
		{
			if (deleteDepartment == null)
				deleteDepartment = connection.prepareStatement("UPDATE departmentTable SET active = '0' WHERE departmentTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete departmentTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete departmentTable");         
		return deleteDepartment;
	}
	
	public synchronized static PreparedStatement deleteUserInfo(Connection connection)
	{
		try 
		{
			if (deleteUserInfo == null)
				deleteUserInfo = connection.prepareStatement("UPDATE userInfoTable SET active = '0' WHERE userInfoTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete userInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete userInfoTable");         
		return deleteUserInfo;
	}
	
	public synchronized static PreparedStatement deleteUserAccount(Connection connection)
	{
		try 
		{
			if (deleteUserAccount == null)
				deleteUserAccount = connection.prepareStatement("UPDATE userAccountTable SET active = '0' WHERE userAccountTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete userAccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete userAccountTable");         
		return deleteUserInfo;
	}
	
	public synchronized static PreparedStatement deleteSeminar(Connection connection)
	{
		try 
		{
			if (deleteSeminar == null)
				deleteSeminar = connection.prepareStatement("UPDATE seminarTable  SET active = '0' WHERE seminarTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete seminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete seminarTable");         
		return deleteSeminar;
	}
	
	public synchronized static PreparedStatement deleteSession(Connection connection)
	{
		try 
		{
			if (deleteSession == null)
				deleteSession = connection.prepareStatement("UPDATE sessionTable SET active = '0' WHERE seesionTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete sessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete sessionTable");         
		return deleteSession;
	}
	
	
	public synchronized static PreparedStatement deleteAttendance(Connection connection)
	{
		try 
		{
			if (deleteAttendance == null)
				deleteAttendance = connection.prepareStatement("UPDATE attendanceTable  SET active = '0' WHERE attendanceTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete attendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete attendanceTable");         
		return deleteAttendance;
	}
	
	public synchronized static PreparedStatement deleteAnnouncement(Connection connection)
	{
		try 
		{
			if (deleteAnnouncement == null)
				deleteAnnouncement = connection.prepareStatement("UPDATE announcementTable SET active = '0' WHERE announcementTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete announcementTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete announcementTable");         
		return deleteAnnouncement;
	}	

	public synchronized static PreparedStatement deleteVenue(Connection connection)
	{
		try 
		{
			if (deleteVenue == null)
				deleteVenue = connection.prepareStatement("UPDATE venueTable SET active = '0' WHERE venueTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete VenueTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete VenueTable");         
		return deleteVenue;
	}	
	
	
	
		
/*-----------------------------------------------------------------------------------------
*****************************************UPDATE!****************************************** 
------------------------------------------------------------------------------------------*/	
	
	public synchronized static PreparedStatement updateUserInfo(Connection connection)
	{
		try 
		{
			if (updateUserInfo == null)
				updateUserInfo = connection.prepareStatement("UPDATE userInfoTable  SET accountID = ? ,  lastName = ? , firstName = ? , middleName = ?, departmentID = ? WHERE userInfoID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update userInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update userInfoTable");         
		return updateUserInfo;
	}
	
	public synchronized static PreparedStatement updateUserAccount(Connection connection)
	{
		try 
		{
			if (updateUserAccount== null)
				updateUserAccount = connection.prepareStatement("UPDATE userInfoAccount  SET username = ? ,  password = ? , email = ? , roleID = ?, active = ? WHERE accountID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update userInfoAccount_ERR");
			e.printStackTrace();
		}
		System.out.println("update userInfoAccount");         
		return updateUserAccount;
	}
	
	public synchronized static PreparedStatement updateSeminar(Connection connection)
	{
		try 
		{
			if (updateSeminar == null)
				updateSeminar = connection.prepareStatement("UPDATE seminarTable  SET coordinatorUserTable = ? ,  title = ? , topic = ? WHERE seminarTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update seminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update seminarTable");         
		return updateSeminar;
	}
	
	public synchronized static PreparedStatement updateSession(Connection connection)
	{
		try 
		{
			if (updateSession == null)
				updateSession = connection.prepareStatement("UPDATE sessionTable SET seminarTableId = ? , venue = ?, capacity = ?, startTime = ? , endTime=? , description=? , date =? , speaker = ?  WHERE sessionTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update sessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update sessionTable");         
		return updateSession;
	}
	
	
	public synchronized static PreparedStatement updateTimeIn(Connection connection)
	{
		try 
		{
			if (updateTimeIn == null)
				updateTimeIn = connection.prepareStatement("UPDATE attendanceTable  SET timeIn = ? WHERE attendanceTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("updateTimeIn updateTimeIn_ERR");
			e.printStackTrace();
		}
		System.out.println("updateTimeIn updateTimeIn");         
		return updateTimeIn;
	}
	
	public synchronized static PreparedStatement updateTimeOut(Connection connection)
	{
		try 
		{
			if (updateTimeOut == null)
				updateTimeOut = connection.prepareStatement("UPDATE attendanceTable  SET timeOut = ? WHERE attendanceTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("updateTimeOut updateTimeOut_ERR");
			e.printStackTrace();
		}
		System.out.println("updateTimeOut updateTimeIn");         
		return updateTimeOut;
	}
	
	
		public synchronized static PreparedStatement updateAnnouncement(Connection connection)
	{
		try 
		{
			if (updateAnnouncement == null)
				updateAnnouncement = connection.prepareStatement("UPDATE announcementTable SET userAccountTableId = ? , title = ? , description = ?  WHERE announcementTableId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update announcementTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update announcementTable");         
		return updateAnnouncement;
	}	

	
	
}