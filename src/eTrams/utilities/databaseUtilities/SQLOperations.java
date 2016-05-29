package eTrams.utilities.databaseUtilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;



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
	private static PreparedStatement createNewAccount;
//-----------Delete	
	private static PreparedStatement deleteCollege;
	private static PreparedStatement deleteDepartment;
	private static PreparedStatement deleteUserInfo;
	private static PreparedStatement deleteUserAccount;
	private static PreparedStatement deleteSeminar;
	private static PreparedStatement deleteSession , deleteSessionBySeminar;
	private static PreparedStatement deleteAttendance , deleteAttendance2;
	private static PreparedStatement deleteAnnouncement;
	private static PreparedStatement deleteVenue;
	private static PreparedStatement deleteAccount;
//-----------Edit/update
	private static PreparedStatement updateUserInfo;
	private static PreparedStatement updateUserAccount;
	private static PreparedStatement updateAnnouncement;
	private static PreparedStatement updateSeminar;
	private static PreparedStatement updateSeminarStatus;
	private static PreparedStatement updateSession;
	private static PreparedStatement updateSessionStatus , updateSessionStatus2 , updateSessionStatus3 , updateSessionStatus4;
	private static PreparedStatement updateTime;
	private static PreparedStatement updateStatus;
	private static PreparedStatement updateVenue;
	private static PreparedStatement updateAccountPassword;
	private static PreparedStatement updateCertificationRelease;
	private static PreparedStatement updateAccount;
	private static PreparedStatement updateDepartment;
	private static PreparedStatement updateAttendanceCertification;
	private static PreparedStatement updateTimeIn;
	private static PreparedStatement updateCollege;
//-----------select CHECK
	private static PreparedStatement selectCollege;
	private static PreparedStatement selectCollegeDepartment;
	private static PreparedStatement selectDepartment;
	private static PreparedStatement selectUserInfo;
	private static PreparedStatement selectUserAccount;
	private static PreparedStatement selectSeminar;
	private static PreparedStatement selectSession;
	private static PreparedStatement selectAllSession;
	private static PreparedStatement selectAttendance;
	private static PreparedStatement selectAnnouncement;
	private static PreparedStatement selectCoordinators;
	private static PreparedStatement selectVenue;
	private static PreparedStatement selectAccount;
	private static PreparedStatement selectParticipants;
	private static PreparedStatement selectRole;
	
	
//-----------select SINGLE CHECK
 	private static PreparedStatement selectOneUserInfo;
	private static PreparedStatement selectOneUserAccount ,selectOneUsername;
	private static PreparedStatement selectOneSeminar;
	private static PreparedStatement selectOneSession;
	private static PreparedStatement selectOneAttendance;
	private static PreparedStatement selectOneAnnouncement;
	private static PreparedStatement selectOneCollege;
	private static PreparedStatement selectOneDepartment;
	private static PreparedStatement selectOneAccount;
	private static PreparedStatement selectSessionParticipants;
	
	
//-----------select COUNT RECORDS
	private static PreparedStatement countSessions;
	private static PreparedStatement countSessionsC;
	private static PreparedStatement countSessionParticipants;
	private static PreparedStatement countRegisteredSessionParticipants;
	private static PreparedStatement countAllSeminars;
	private static PreparedStatement countAllSessions;
	private static PreparedStatement countAllAttendees;
//-----------filter
	private static PreparedStatement filterComplete;
	private static PreparedStatement filterCert;
	
//-----------login
	private static PreparedStatement login;

//-----------search
	private static PreparedStatement searchName;
	private static PreparedStatement searchSeminar;
	private static PreparedStatement searchHistory;
	private static PreparedStatement searchMyHistory;
	private static PreparedStatement searchAnnouncementToDelete;
	private static PreparedStatement searchMyAttendance;
/*-----------------------------------------------------------------------------------------
 *******************************************INSERT****************************************** 
------------------------------------------------------------------------------------------*/	

	
	public synchronized static PreparedStatement createNewCollege(Connection connection)
	{
		try 
		{
			if (createNewCollege == null)
				createNewCollege = connection.prepareStatement("INSERT INTO CollegeTable VALUES (NULL, ?,?)");
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
				createNewDepartment = connection.prepareStatement("INSERT INTO DepartmentTable VALUES (NULL, ?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT DepartmentTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT DepartmentTable");         
		return createNewDepartment;
	}
	
	public synchronized static PreparedStatement createNewUserInfo(Connection connection)
	{
		try 
		{
			if (createNewUserInfo == null)
				createNewUserInfo = connection.prepareStatement("INSERT INTO UserInfoTable (lastName ,firstName ,middleName,departmentID) VALUES(?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT UserInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT UserInfoTable");         
		return createNewUserInfo;
	}
	
	public synchronized static PreparedStatement createNewAccount(Connection connection)
	{
		try 
		{
			if (createNewAccount == null)
				createNewAccount = connection.prepareStatement("INSERT INTO AccountTable (userInfoId , username, password, email, roleID, active) VALUES(?,?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT AccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT AccountTable");         
		return createNewAccount;
	}
	
	public synchronized static PreparedStatement deleteAccount(Connection connection)
	{
		try 
		{
			if (deleteAccount == null)
				deleteAccount = connection.prepareStatement("UPDATE AccountTable SET active = 0 WHERE AccountId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete AccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete AccountTable");         
		return deleteAccount;
	}
	
	public synchronized static PreparedStatement createNewUserAccount(Connection connection)
	{
		try 
		{
			if (createNewUserAccount == null)
				createNewUserAccount = connection.prepareStatement("INSERT INTO AccountTable VALUES (?,?,?,?,?,?)");
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
				createNewSeminar = connection.prepareStatement("INSERT INTO SeminarTable VALUES (NULL, ?,?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT SeminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT SeminarTable");         
		return createNewSeminar;
	}
	
	public synchronized static PreparedStatement createNewSession(Connection connection)
	{
		try 
		{
			if (createNewSession == null)
				createNewSession = connection.prepareStatement("INSERT INTO SessionTable VALUES (NULL,?,?,?,?,?,?,?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT SessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT SessionTable");         
		return createNewSession;
	}
	
	
	public synchronized static PreparedStatement createNewAttendance(Connection connection)
	{
		try 
		{
			if (createNewAttendance == null)
				createNewAttendance = connection.prepareStatement("INSERT INTO AttendanceTable VALUES (NULL,?,?,?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT AttendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT AttendanceTable");         
		return createNewAttendance;
	}
	
	public synchronized static PreparedStatement createNewAnnouncement(Connection connection)
	{
		try 
		{
			if (createNewAnnouncement == null)
				createNewAnnouncement = connection.prepareStatement("INSERT INTO AnnouncementTable VALUES (?,?,?,?,?,?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("INSERT AnnouncementTable_ERR");
			e.printStackTrace();
		}
		System.out.println("INSERT AnnouncementTable");         
		return createNewAnnouncement;
	}
	
	public synchronized static PreparedStatement createNewVenue(Connection connection)
	{
		try 
		{
			if (createNewVenue == null)
				createNewVenue = connection.prepareStatement("INSERT INTO VenueTable VALUES (NULL, ?,?)");
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
				selectOneCollege = connection.prepareStatement("SELECT * FROM CollegeTable WHERE collegeID = ?");
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
				selectOneDepartment = connection.prepareStatement("SELECT * FROM DepartmentTable WHERE departmentID = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne DepartmentTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne DepartmentTable");         
		return selectOneDepartment;
	}
	
	
	public synchronized static PreparedStatement selectOneUserAccount(Connection connection)
	{
		try 
		{
			if (selectOneUserAccount == null)
				selectOneUserAccount = connection.prepareStatement("SELECT r.*, u.* , a.* , d.* , c.*  FROM AccountTable as a , UserInfoTable as u , CollegeTable as c, DepartmentTable as d, RoleTable as r     WHERE u.userInfoID = a.userInfoID and c.collegeID = d.collegeID and d.departmentID = u.departmentID and a.roleID = r.roleID and   u.userInfoID = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne userAccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne userAccountTable");         
		return selectOneUserAccount;
	}
	
	public synchronized static PreparedStatement selectOneUsername(Connection connection)
	{
		try 
		{
			if (selectOneUsername == null)
				selectOneUsername = connection.prepareStatement("SELECT Count(accountID) FROM AccountTable where username = ? and active = 0");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne userAccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne userAccountTable22");         
		return selectOneUsername;
	}
	
	
	
	public synchronized static PreparedStatement selectOneUserInfo(Connection connection)
	{
		try 
		{
			if (selectOneUserInfo == null)
				selectOneUserInfo = connection.prepareStatement("SELECT * FROM UserInfoTable WHERE userInfoId = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne UserInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne UserInfoTable");         
		return selectOneUserInfo;
	}
	
	public synchronized static PreparedStatement selectOneSeminar(Connection connection)
	{
		try 
		{
			if (selectOneSeminar == null)
				selectOneSeminar = connection.prepareStatement("SELECT * FROM SeminarTable WHERE seminarID = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne SeminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne SeminarTable");         
		return selectOneSeminar;
	}

	public synchronized static PreparedStatement selectOneSession(Connection connection)
	{
		try 
		{
			if (selectOneSession == null)
				selectOneSession = connection.prepareStatement("SELECT * FROM SessionTable WHERE sessionId = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne SessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne SessionTable");         
		return selectOneSession;
	}
	
	public synchronized static PreparedStatement selectSessionParticipants(Connection connection)
	{
		try 
		{
			if (selectSessionParticipants == null)
				selectSessionParticipants = connection.prepareStatement("SELECT AttendanceTable.attendanceID, AttendanceTable.sessionID, AttendanceTable.participantID, AttendanceTable.timeIn, AttendanceTable.timeOut, AttendanceTable.status, AttendanceTable.Certification, AttendanceTable.certificationRelease, UserInfoTable.lastName, UserInfoTable.firstName, UserInfoTable.middleName, CollegeTable.CollegeName FROM AccountTable, AttendanceTable, UserInfoTable, DepartmentTable, CollegeTable WHERE AttendanceTable.participantID = AccountTable.AccountID AND AccountTable.userInfoID = UserInfoTable.userInfoID AND UserInfoTable.departmentID = DepartmentTable.departmentID AND DepartmentTable.collegeID = CollegeTable.collegeID AND sessionID = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne SessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne SessionTable");         
		return selectSessionParticipants;
	}
	
	public synchronized static PreparedStatement selectOneAttendance(Connection connection)
	{
		try 
		{
			if (selectOneAttendance == null)
				selectOneAttendance = connection.prepareStatement("SELECT a.*, s.*, sem.*,ac.*  FROM AttendanceTable as a, SessionTable as s, SeminarTable as sem, AccountTable as ac WHERE sem.seminarID = s.seminarID and a.sessionId = s.sessionId and ac.accountID = a.participantID and ac.accountID = ? and s.completion = 1");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne AttendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne AttendanceTable");         
		return selectOneAttendance;
	}
	
	public synchronized static PreparedStatement selectRole(Connection connection)
	{
		try 
		{
			if (selectRole == null)
				selectRole = connection.prepareStatement("SELECT * FROM RoleTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT RoleTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT RoleTable");         
		return selectRole;
	}	
	
	public synchronized static PreparedStatement selectOneAnnouncement(Connection connection)
	{
		try 
		{
			if (selectOneAnnouncement == null)
				selectOneAnnouncement = connection.prepareStatement("SELECT * FROM AnnouncementTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne AnnouncementTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne AnnouncementTable");         
		return selectOneAnnouncement;
	}
	
	public synchronized static PreparedStatement selectOneUserInfoId(Connection connection)
	{
		try 
		{
			if (selectOneUserInfo == null)
				selectOneUserInfo = connection.prepareStatement("SELECT userInfoId FROM UserInfoTable WHERE lastName = ? and firstName = ? and middleName = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne UserInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne UserInfoTable");         
		return selectOneUserInfo;
	}
	
	public synchronized static PreparedStatement selectOneAccount(Connection connection)
	{
		try 
		{
			if (selectOneAccount == null)
				selectOneAccount = connection.prepareStatement("SELECT a.* , u.* , r.* , d.* , c.* FROM AccountTable as a , UserInfoTable as u , DepartmentTable as d , CollegeTable as c , RoleTable as r"
						+ " where a.userInfoId = u.userInfoId and u.departmentId = d.departmentId and d.collegeId = c.collegeId and a.roleId = r.roleId and a.AccountId=?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne AccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne AccountTable");         
		return selectOneAccount;
	}
	
/*-----------------------------------------------------------------------------------------
*******************************************SELECT****************************************** 
------------------------------------------------------------------------------------------*/	
	public synchronized static PreparedStatement selectCollege(Connection connection)
	{
		try 
		{
			if (selectCollege == null)
				selectCollege = connection.prepareStatement("SELECT * FROM CollegeTable WHERE Active = 1");
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
				selectDepartment = connection.prepareStatement("SELECT * FROM DepartmentTable WHERE Active = 1");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT DepartmentTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT DepartmentTable");         
		return selectDepartment;
	}
	
	public synchronized static PreparedStatement selectCollegeDepartment(Connection connection)
	{
		try 
		{
			if (selectCollegeDepartment == null)
				selectCollegeDepartment = connection.prepareStatement("SELECT * FROM DepartmentTable WHERE Active = 1 AND CollegeID = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT DepartmentTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT DepartmentTable");         
		return selectCollegeDepartment;
	}
	
	public synchronized static PreparedStatement selectUserInfo(Connection connection)
	{
		try 
		{
			if (selectUserInfo == null)
				selectUserInfo = connection.prepareStatement("SELECT * FROM UserInfoTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT UserInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT UserInfoTable");         
		return selectUserInfo;
	}
	
	public synchronized static PreparedStatement selectUserAccount(Connection connection)
	{
		try 
		{
			if (selectUserAccount == null)
				selectUserAccount = connection.prepareStatement("SELECT * FROM userAccountTable Active = 1");
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
				selectSeminar = connection.prepareStatement("SELECT * FROM SeminarTable WHERE Active = 1 ORDER BY DateCreated DESC");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT SeminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT SeminarTable");         
		return selectSeminar;
	}
	
	public synchronized static PreparedStatement selectSession(Connection connection)
	{
		try 
		{
			if (selectSession == null)
				selectSession = connection.prepareStatement("SELECT SessionTable.sessionID, SessionTable.seminarID, SessionTable.sessionName, VenueTable.venueName, SessionTable.venueRemarks, SessionTable.capacity, SessionTable.date, SessionTable.startTime, SessionTable.endTime, SessionTable.speakerID, SessionTable.completion, SessionTable.active, UserInfoTable.lastName, UserInfoTable.firstName, UserInfoTable.middleName, VenueTable.venueID FROM `SessionTable`, `VenueTable`, `AccountTable`, `UserInfoTable` WHERE SessionTable.SpeakerID = AccountTable.accountID AND AccountTable.UserInfoID = UserInfoTable.UserInfoID AND VenueTable.venueID = SessionTable.venueID AND SessionTable.Active = 1 and SessionTable.SeminarID = ? ORDER BY Date DESC");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT SessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT SessionTable");         
		return selectSession;
	}
	
	
	public synchronized static PreparedStatement selectAllSession(Connection connection)
	{
		try 
		{
			if (selectAllSession == null)
				selectAllSession = connection.prepareStatement("SELECT SessionTable.*, SeminarTable.* , AccountTable.* , VenueTable.* , UserInfoTable.* FROM SessionTable, VenueTable, AccountTable, UserInfoTable , SeminarTable WHERE SessionTable.SpeakerID = AccountTable.accountID AND AccountTable.UserInfoID = UserInfoTable.UserInfoID AND VenueTable.venueID = SessionTable.venueID AND SessionTable.Active > 0 and SeminarTable.seminarID = SessionTable.seminarID  ORDER BY Date DESC");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT SessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT SessionTable");         
		return selectAllSession;
	}
	
	
	
	public synchronized static PreparedStatement selectAttendance(Connection connection)
	{
		try 
		{
			if (selectAttendance == null)
				selectAttendance = connection.prepareStatement("SELECT * FROM AttendanceTable");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT AttendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT AttendanceTable");         
		return selectAttendance;
	}
	
	public synchronized static PreparedStatement selectAnnouncement(Connection connection)
	{
		try 
		{
			if (selectAnnouncement == null)
				selectAnnouncement = connection.prepareStatement("SELECT * FROM AnnouncementTable where active=1 ORDER BY AnnouncementID DESC ");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT AnnouncementTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT AnnouncementTable");         
		return selectAnnouncement;
	}
	
	
	public synchronized static PreparedStatement selectVenue(Connection connection)
	{
		try 
		{
			if (selectVenue == null)
				selectVenue = connection.prepareStatement("SELECT * FROM VenueTable WHERE Active = 1");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT VenueTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT VenueTable");         
		return selectVenue;
	}
	
	public synchronized static PreparedStatement selectCoordinators(Connection connection)
	{
		try 
		{
			if (selectCoordinators == null)
				selectCoordinators = connection.prepareStatement("SELECT AccountTable.accountID, UserInfoTable.LastName, UserInfoTable.FirstName, UserInfoTable.MiddleName FROM AccountTable, UserInfoTable WHERE RoleID = 2 AND AccountTable.UserInfoID = UserInfoTable.UserInfoID");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT userAccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT userAccountTable");         
		return selectCoordinators;
	}
	
	public synchronized static PreparedStatement selectParticipants(Connection connection)
	{
		try 
		{
			if (selectParticipants == null)
				selectParticipants = connection.prepareStatement("SELECT AccountTable.accountID, UserInfoTable.LastName, UserInfoTable.FirstName, UserInfoTable.MiddleName, CollegeTable.CollegeName FROM AccountTable, UserInfoTable, DepartmentTable, CollegeTable WHERE RoleID = 3 AND UserInfoTable.DepartmentID = DepartmentTable.DepartmentID AND CollegeTable.COllegeID = DepartmentTable.CollegeID AND AccountTable.UserInfoID = UserInfoTable.UserInfoID;");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT userAccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT userAccountTable");         
		return selectParticipants;
	}
	
	public synchronized static PreparedStatement selectAccount(Connection connection)
	{
		try 
		{
			if (selectAccount == null)
				selectAccount = connection.prepareStatement("SELECT a.AccountId , a.userName, a.password,a.active , u.userInfoId , u.firstName , u.middleName , u.lastName, "
						+ "a.email , r.roleName , d.departmentName , c.collegeName FROM AccountTable as a , UserInfoTable as u , DepartmentTable as d , CollegeTable as c , RoleTable as r"
						+ " where a.active = 1 and a.userInfoId = u.userInfoId and u.departmentId = d.departmentId and d.collegeId = c.collegeId and a.roleId = r.roleId");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT AccountTable_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT AccountTable");         
		return selectAccount;
	}
	
	
	
/*-----------------------------------------------------------------------------------------
*****************************************LOGICAL DELETE!****************************************** 
------------------------------------------------------------------------------------------*/	
	public synchronized static PreparedStatement deleteCollege(Connection connection)
	{
		try 
		{
			if (deleteCollege == null)
				deleteCollege = connection.prepareStatement("UPDATE CollegeTable SET active = '0' WHERE collegeID = ? ");
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
				deleteDepartment = connection.prepareStatement("UPDATE DepartmentTable SET active = '0' WHERE departmentID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete DepartmentTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete DepartmentTable");         
		return deleteDepartment;
	}
	
	public synchronized static PreparedStatement deleteUserInfo(Connection connection)
	{
		try 
		{
			if (deleteUserInfo == null)
				deleteUserInfo = connection.prepareStatement("UPDATE UserInfoTable SET active = '0' WHERE userInfoID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete UserInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete UserInfoTable");         
		return deleteUserInfo;
	}
	
	public synchronized static PreparedStatement deleteUserAccount(Connection connection)
	{
		try 
		{
			if (deleteUserAccount == null)
				deleteUserAccount = connection.prepareStatement("UPDATE userAccountTable SET active = '0' WHERE userAccountID = ? ");
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
				deleteSeminar = connection.prepareStatement("UPDATE SeminarTable  SET active = '0' WHERE seminarId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete SeminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete SeminarTable");         
		return deleteSeminar;
	}
	
	public synchronized static PreparedStatement deleteSession(Connection connection)
	{
		try 
		{
			if (deleteSession == null)
				deleteSession = connection.prepareStatement("UPDATE SessionTable SET active = '0' WHERE sessionID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete SessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete SessionTable");         
		return deleteSession;
	}
	
	public synchronized static PreparedStatement deleteSessionBySeminar(Connection connection)
	{
		try 
		{
			if (deleteSessionBySeminar == null)
				deleteSessionBySeminar = connection.prepareStatement("UPDATE SessionTable SET active = '0' WHERE seminarID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("deleteSessionBySeminar_ERR");
			e.printStackTrace();
		}
		System.out.println("deleteSessionBySeminar");         
		return deleteSessionBySeminar;
	}
	
	
	public synchronized static PreparedStatement deleteAttendance(Connection connection)
	{
		try 
		{
			if (deleteAttendance == null)
				deleteAttendance = connection.prepareStatement("DELETE FROM AttendanceTable WHERE attendanceId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete AttendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete AttendanceTable");         
		return deleteAttendance;
	}
	public synchronized static PreparedStatement deleteAttendance2(Connection connection)
	{
		try 
		{
			if (deleteAttendance2 == null)
				deleteAttendance2 = connection.prepareStatement("DELETE FROM AttendanceTable WHERE sessionID = ? and participantID =?");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete AttendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete AttendanceTable");         
		return deleteAttendance2;
	}
	public synchronized static PreparedStatement deleteAnnouncement(Connection connection)
	{
		try 
		{
			if (deleteAnnouncement == null)
				deleteAnnouncement = connection.prepareStatement("UPDATE AnnouncementTable SET active = '0' WHERE announcementID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete AnnouncementTable_ERR");
			e.printStackTrace();
		}
		System.out.println("delete AnnouncementTable");         
		return deleteAnnouncement;
	}	
	
	public synchronized static PreparedStatement autoDeleteAnnouncement(Connection connection)
	{
		try 
		{
			if (searchAnnouncementToDelete == null)
				searchAnnouncementToDelete = connection.prepareStatement("UPDATE AnnouncementTable SET active = '0' WHERE dateCreated < ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("delete searchAnnouncementToDelete_ERR");
			e.printStackTrace();
		}
		System.out.println("delete searchAnnouncementToDelete");         
		return searchAnnouncementToDelete;
	}
	
	
	

	public synchronized static PreparedStatement deleteVenue(Connection connection)
	{
		try 
		{
			if (deleteVenue == null)
				deleteVenue = connection.prepareStatement("UPDATE VenueTable SET active = '0' WHERE venueId = ? ");
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
				updateUserInfo = connection.prepareStatement("UPDATE UserInfoTable SET   lastName = ? , firstName = ? , middleName = ? WHERE userInfoID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update UserInfoTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update UserInfoTable");         
		return updateUserInfo;
	}
	
	public synchronized static PreparedStatement updateAccount(Connection connection)
	{
		try 
		{
			if (updateAccount== null)
				updateAccount = connection.prepareStatement("UPDATE AccountTable  SET email = ? , roleID=? WHERE accountID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update userInfoAccount_ERR");
			e.printStackTrace();
		}
		System.out.println("update userInfoAccount");         
		return updateAccount;
	}
	
	public synchronized static PreparedStatement updateUserAccount(Connection connection)
	{
		try 
		{
			if (updateUserAccount== null)
				updateUserAccount = connection.prepareStatement("UPDATE AccountTable  SET email = ?  WHERE accountID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update userInfoAccount_ERR");
			e.printStackTrace();
		}
		System.out.println("update userInfoAccount");         
		return updateUserAccount;
	}
	
	public synchronized static PreparedStatement updateCollege(Connection connection)
	{
		try 
		{
			if (updateCollege== null)
				updateCollege = connection.prepareStatement("UPDATE CollegeTable set CollegeName=? WHERE CollegeID = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("update CollegeTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update CollegeTable");         
		return updateCollege;
	}
	
	public synchronized static PreparedStatement updateSeminar(Connection connection)
	{
		try 
		{
			if (updateSeminar == null)
				updateSeminar = connection.prepareStatement("UPDATE SeminarTable  SET SeminarName = ? , Description = ? WHERE seminarID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update SeminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update SeminarTable");         
		return updateSeminar;
	}
	
	public synchronized static PreparedStatement updateSeminarStatus(Connection connection)
	{
		try 
		{
			if (updateSeminarStatus == null)
				updateSeminarStatus = connection.prepareStatement("UPDATE SeminarTable  SET completion = ?  WHERE seminarID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update SeminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update SeminarTable");         
		return updateSeminarStatus;
	}

	public synchronized static PreparedStatement updateSessionStatus(Connection connection)
	{
		try 
		{
			if (updateSessionStatus == null)
				updateSessionStatus = connection.prepareStatement("UPDATE SessionTable  SET completion = ?  WHERE (date = ? AND  EndTime <  ? AND StartTime < ?) OR  date < ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update updateSessionStatus_ERR");
			e.printStackTrace();
		}
		System.out.println("update updateSessionStatus");         
		return updateSessionStatus;
	}
	
	public synchronized static PreparedStatement updateSessionStatus4(Connection connection)
	{
		try 
		{
			if (updateSessionStatus4 == null)
				updateSessionStatus4 = connection.prepareStatement("UPDATE SessionTable  SET completion = ?  WHERE (date = ? AND StartTime <=  ? AND  EndTime >=  ?)  ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update updateSessionStatus4_ERR");
			e.printStackTrace();
		}
		System.out.println("update updateSessionStatus4");         
		return updateSessionStatus4;
	}
	
	
	public synchronized static PreparedStatement updateSessionStatus3(Connection connection)
	{
		try 
		{
			if (updateSessionStatus3 == null)
				updateSessionStatus3 = connection.prepareStatement("UPDATE SessionTable  SET completion = ?  WHERE (date = ? AND  StartTime >  ? AND endTime > ?) OR  date > ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update updateSessionStatus3_ERR");
			e.printStackTrace();
		}
		System.out.println("update updateSessionStatus3");         
		return updateSessionStatus3;
	}
	
	public synchronized static PreparedStatement updateSessionStatus2(Connection connection)
	{
		try 
		{
			if (updateSessionStatus2 == null)
				updateSessionStatus2 = connection.prepareStatement("UPDATE SessionTable  SET completion = ?  WHERE (date = ? AND  EndTime > ?) OR  date > ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update updateSessionStatus2_ERR");
			e.printStackTrace();
		}
		System.out.println("update updateSessionStatus2");         
		return updateSessionStatus2;
	}
	
	
	public synchronized static PreparedStatement updateSession(Connection connection)
	{
		try 
		{
			if (updateSession == null)
				updateSession = connection.prepareStatement("UPDATE SessionTable SET SessionName = ? , VenueID = ?, VenueRemarks = ?, capacity = ?, date=? ,startTime = ? , endTime=? , speakerID = ?  WHERE sessionID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update SessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update SessionTable");         
		return updateSession;
	}
	
	
	public synchronized static PreparedStatement updateTime(Connection connection)
	{
		try 
		{
			if (updateTime == null)
				updateTime = connection.prepareStatement("UPDATE AttendanceTable  SET timeIn = ?, timeOut = ? WHERE attendanceId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("updateTime updateTime_ERR");
			e.printStackTrace();
		}
		System.out.println("updateTime updateTime");         
		return updateTime;
	}
	
	public synchronized static PreparedStatement updateTimeIn(Connection connection)
	{
		try 
		{
			if (updateTimeIn == null)
				updateTimeIn = connection.prepareStatement("UPDATE AttendanceTable  SET timeIn = ? WHERE participantID = ? AND sessionID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("updateTimeIn updateTimeIn_ERR");
			e.printStackTrace();
		}
		System.out.println("updateTimeIn updateTimeIn");         
		return updateTimeIn;
	}
	
	public synchronized static PreparedStatement updateStatus(Connection connection)
	{
		try 
		{
			if (updateStatus == null)
				updateStatus = connection.prepareStatement("UPDATE AttendanceTable  SET status = ? WHERE attendanceId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("updateStatus updateStatus_ERR");
			e.printStackTrace();
		}
		System.out.println("updateStatus updateStatus");         
		return updateStatus;
	}
	
	public synchronized static PreparedStatement updateAnnouncement(Connection connection)
	{
		try 
		{
			if (updateAnnouncement == null)
				updateAnnouncement = connection.prepareStatement("UPDATE AnnouncementTable SET title = ? , content = ?  WHERE announcementID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update AnnouncementTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update AnnouncementTable");         
		return updateAnnouncement;
	}
	
	public synchronized static PreparedStatement updateVenue(Connection connection)
	{
		try 
		{
			if (updateVenue == null)
				updateVenue = connection.prepareStatement("UPDATE VenueTable SET venueName = ? WHERE venueID = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("update VenueTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update VenueTable");         
		return updateVenue;
	}
	
	public synchronized static PreparedStatement updateDepartment(Connection connection)
	{
		try 
		{
			if (updateDepartment == null)
				updateDepartment = connection.prepareStatement("UPDATE DepartmentTable SET departmentName = ? WHERE departmentID = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("update DepartmentTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update DepartmentTable");         
		return updateDepartment;
	}
	
	public synchronized static PreparedStatement updateAccountPassword(Connection connection)
	{
		try 
		{
			if (updateAccountPassword== null)
				updateAccountPassword = connection.prepareStatement("UPDATE AccountTable  SET password = ? WHERE accountID = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update userInfoAccountPassword_ERR");
			e.printStackTrace();
		}
		System.out.println("update userInfoAccountPassword");         
		return updateAccountPassword;
	}
	
	public synchronized static PreparedStatement updateAttendanceCertification(Connection connection)
	{
		try 
		{
			if (updateAttendanceCertification == null)
				updateAttendanceCertification = connection.prepareStatement("UPDATE AttendanceTable SET Certification = ?, CertificationRelease = ? WHERE attendanceId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update AttendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update AttendanceTable");         
		return updateAttendanceCertification;
	}
	
	
	public synchronized static PreparedStatement updateCertificationRelease(Connection connection)
	{
		try 
		{
			if (updateCertificationRelease == null)
				updateCertificationRelease = connection.prepareStatement("UPDATE AttendanceTable SET CertificationRelease = ? WHERE attendanceId = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("update AttendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("update AttendanceTable");         
		return updateCertificationRelease;
	}
	
	
	

	/*-----------------------------------------------------------------------------------------
	*****************************************COUNT!****************************************** 
	------------------------------------------------------------------------------------------*/
	
	public synchronized static PreparedStatement countSessions(Connection connection)
	{
		try 
		{
			if (countSessions == null)
				countSessions = connection.prepareStatement("SELECT COUNT(SessionID) FROM SessionTable WHERE SeminarID = ? and active> 0 ");
		} 
		catch (SQLException e) 
		{
			System.err.println("countSessions SessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("countSessions SessionTable");         
		return countSessions;
	}
	
	public synchronized static PreparedStatement countSessionsC(Connection connection)
	{
		try 
		{
			if (countSessionsC == null)
				countSessionsC = connection.prepareStatement("SELECT COUNT(SessionID) FROM SessionTable WHERE SeminarID = ? and active > 0  and completion = 1 ");
		} 
		catch (SQLException e) 
		{
			System.err.println("countSessionsC SessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("countSessionsC SessionTable");         
		return countSessionsC;
	}
	
	public synchronized static PreparedStatement countSessionParticipants(Connection connection)
	{
		try 
		{
			if (countSessionParticipants == null)
				countSessionParticipants = connection.prepareStatement("SELECT COUNT(AttendanceID) FROM AttendanceTable WHERE SessionID = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("countSessions attendanceTabele_ERR");
			e.printStackTrace();
		}
		System.out.println("countSessions AttendanceTable");         
		return countSessionParticipants;
	}
	
	public synchronized static PreparedStatement countRegisteredSessionParticipants(Connection connection)
	{
		try 
		{
			if (countRegisteredSessionParticipants == null)
				countRegisteredSessionParticipants = connection.prepareStatement("SELECT COUNT(AttendanceID) FROM AttendanceTable WHERE SessionID = ? AND TimeIn <> \"00:00:00\"");
		} 
		catch (SQLException e) 
		{
			System.err.println("countSessions attendanceTabele_ERR");
			e.printStackTrace();
		}
		System.out.println("countSessions AttendanceTable");         
		return countRegisteredSessionParticipants;
	}
	
	public synchronized static PreparedStatement countAllSessions(Connection connection)
	{
		try 
		{
			if (countAllSessions == null)
				countAllSessions = connection.prepareStatement("SELECT COUNT(m.sessionID) FROM SeminarTable AS g LEFT JOIN SessionTable AS m USING(seminarID) where m.active=1");
		} 
		catch (SQLException e) 
		{
			System.err.println("countAllSessions SessionTable_ERR");
			e.printStackTrace();
		}
		System.out.println("countAllSessions SessionTable");         
		return countAllSessions;
	}
	
	public synchronized static PreparedStatement countAllSeminars(Connection connection)
	{
		try 
		{
			if (countAllSeminars == null)
				countAllSeminars = connection.prepareStatement("SELECT COUNT(SeminarID) FROM SeminarTable WHERE active=1");
		} 
		catch (SQLException e) 
		{
			System.err.println("countAllSeminars SeminarTable_ERR");
			e.printStackTrace();
		}
		System.out.println("countAllSeminars SeminarTable");         
		return countAllSeminars;
	}
	
	public synchronized static PreparedStatement countAllAttendees(Connection connection)
	{
		try 
		{
			if (countAllAttendees == null)
				countAllAttendees = connection.prepareStatement("select count(t.attendanceID) from (select AttendanceTable.AttendanceID , SessionTable.SessionID , SeminarTable.SeminarID from AttendanceTable, SessionTable , SeminarTable where AttendanceTable.sessionID = SessionTable.SessionID and SeminarTable.SeminarID = SessionTable.SeminarID and SeminarTable.Active=1 and SessionTable.Active = 1) as t ");
		} 
		catch (SQLException e) 
		{
			System.err.println("countAllAttendees AttendanceTable_ERR");
			e.printStackTrace();
		}
		System.out.println("countAllAttendees AttendanceTable_ERR");         
		return countAllAttendees;
	}
	
	public synchronized static PreparedStatement login(Connection connection)
	{
		try 
		{
			if (login == null)
				login = connection.prepareStatement("SELECT a.AccountId , a.userName, a.password,a.active , u.userInfoId , u.firstName ,"
						+ " u.middleName , u.lastName, a.email , r.roleName , d.departmentName , c.collegeName FROM AccountTable as a , UserInfoTable as u , "
						+ "DepartmentTable as d , CollegeTable as c , RoleTable as r "
						+ "where a.active = 1 and a.userInfoId = u.userInfoId and u.departmentId = d.departmentId and d.collegeId = c.collegeId and a.roleId = r.roleId and a.username = ? and a.password = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("selectOne login_ERR");
			e.printStackTrace();
		}
		System.out.println("selectOne login");         
		return login;
	}
	
//---------------filter
	public synchronized static PreparedStatement FilterSessionsComp(Connection connection)
	{
		
		try 
		{
			if (filterComplete == null)
				filterComplete = connection.prepareStatement("SELECT SessionTable.*, SeminarTable.* , AccountTable.* , VenueTable.* , UserInfoTable.* FROM SessionTable, VenueTable, AccountTable, UserInfoTable , SeminarTable WHERE SessionTable.SpeakerID = AccountTable.accountID AND AccountTable.UserInfoID = UserInfoTable.UserInfoID AND VenueTable.venueID = SessionTable.venueID AND SessionTable.Active = 1 and SeminarTable.seminarID = SessionTable.seminarID and SessionTable.active > 0 and SeminarTable.seminarID=? and SessionTable.status = ? ORDER BY Date DESC");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT filterComplete_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT filterComplete");         
		return filterComplete;
	}
	
	public synchronized static PreparedStatement FilterSessionsCert(Connection connection)
	{
		
		try 
		{
			if (filterCert == null)
				filterCert = connection.prepareStatement("SELECT AttendanceTable.* , UserInfoTable.*, CollegeTable.* FROM AccountTable, AttendanceTable, UserInfoTable, DepartmentTable, CollegeTable WHERE AttendanceTable.participantID = AccountTable.AccountID AND AccountTable.userInfoID = UserInfoTable.userInfoID AND UserInfoTable.departmentID = DepartmentTable.departmentID AND DepartmentTable.collegeID = CollegeTable.collegeID AND AttendanceTable.certification = ? ");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT filterCerte_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT filterCert");         
		return filterCert;
	}
	
	public synchronized static PreparedStatement SearchName(Connection connection)
	{
		
		try 
		{
			if (searchName == null)
				searchName = connection.prepareStatement("SELECT a.AccountId , a.userName, a.password,a.active , u.userInfoId , u.firstName , u.middleName , u.lastName, "
						+ "a.email , r.roleName , d.departmentName , c.collegeName FROM AccountTable as a , UserInfoTable as u , DepartmentTable as d , CollegeTable as c , RoleTable as r"
						+ " where a.active = 1 and a.userInfoId = u.userInfoId and u.departmentId = d.departmentId and d.collegeId = c.collegeId and a.roleId = r.roleId and (u.lastName like ? OR u.MiddleName like ? OR u.firstName like ? OR d.departmentName like ? OR c.collegeName like ? OR r.roleName like ?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT searchName_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT searchName");         
		return searchName;
	}
	
	public synchronized static PreparedStatement SearchSeminar(Connection connection)
	{
		
		try 
		{
			if (searchSeminar == null)
				searchSeminar = connection.prepareStatement("SELECT * FROM SeminarTable WHERE Active = 1 AND (seminarName like ? OR DateCreated like ?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT searchSeminar_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT searchSeminar");         
		return searchSeminar;
	}

	
	
	public synchronized static PreparedStatement SearchHistory(Connection connection)
	{
		
		try 
		{
			if (searchHistory == null)
				searchHistory = connection.prepareStatement("SELECT a.*, s.*, sem.*,ac.*  FROM AttendanceTable as a, SessionTable as s, SeminarTable as sem, AccountTable as ac WHERE sem.seminarID = s.seminarID and a.sessionId = s.sessionId and ac.accountID = a.participantID and  ac.accountID = ? AND (sem.seminarName Like ? OR s.sessionName Like ? OR a.status like ? OR date like ?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT searchHistory_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT searchHistory");         
		return searchHistory;
	}

	public synchronized static PreparedStatement SearchMyHistory(Connection connection)
	{
		
		try 
		{
			if (searchMyHistory == null)
				searchMyHistory = connection.prepareStatement("SELECT a.*, s.*, sem.*,ac.*  FROM AttendanceTable as a, SessionTable as s, SeminarTable as sem, AccountTable as ac WHERE sem.seminarID = s.seminarID and a.sessionId = s.sessionId and ac.accountID = a.participantID and  ac.accountID = ? AND (sem.seminarName Like ? OR s.sessionName Like ? OR a.status like ? OR date like ?)");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT searchHistory_ERR");
			e.printStackTrace();
		}
		System.out.println("SELECT searchHistory");         
		return searchMyHistory;
	}
	

	public synchronized static PreparedStatement searchMyAttendance(Connection connection)
	{
		
		try 
		{
			if (searchMyAttendance == null)
				searchMyAttendance = connection.prepareStatement("select SessionTable.sessionID from SessionTable, AttendanceTable where AttendanceTable.sessionID=SessionTable.sessionID and AttendanceTable.participantID = ?");
		} 
		catch (SQLException e) 
		{
			System.err.println("SELECT searchMyAttendance");
			e.printStackTrace();
		}
		System.out.println("SELECT searchMyAttendance");         
		return searchMyAttendance;
	}
}