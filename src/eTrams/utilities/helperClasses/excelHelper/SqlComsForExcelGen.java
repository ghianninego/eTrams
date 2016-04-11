package eTrams.utilities.helperClasses.excelHelper;

public interface SqlComsForExcelGen {
	String show_faculty = 
			 " select distinct AccountTable.AccountID, CONCAT(UserInfoTable.FirstName, ' ', UserInfoTable.LastName)  "  +
			 " as Faculty, CollegeTable.CollegeName  "  +
			 " FROM AccountTable, DepartmentTable, CollegeTable, UserInfoTable  "  +
			 " WHERE   "  +
			 " UserInfoTable.UserInfoID = AccountTable.UserInfoID AND CollegeTable.CollegeID = DepartmentTable.collegeID  "  +
			 " AND (AccountTable.RoleID = ? AND AccountTable.Active = ?) " ;
	
	String show_coordinator = 
			 " select distinct AccountTable.AccountID, CONCAT(UserInfoTable.FirstName, ' ', UserInfoTable.LastName)  "  +
			 " as Faculty, CollegeTable.CollegeName  "  +
			 " FROM AccountTable, DepartmentTable, CollegeTable, UserInfoTable  "  +
			 " WHERE   "  +
			 " UserInfoTable.UserInfoID = AccountTable.UserInfoID AND CollegeTable.CollegeID = DepartmentTable.collegeID  "  +
			 " AND (AccountTable.RoleID = ? AND AccountTable.Active = ?) " ;
	
	String show_college = 
			 " SELECT CollegeID, CollegeName  "  +
			 " from CollegeTable  "  +
			 " where Active = ? " ;
	
	String count_user =
			 " select COUNT(*) from accounttable " ;
	
	String count_session_total = 
			 " select COUNT(*) from SessionTable " ;
	
	String count_session_monthly =  
			 " SELECT COUNT(DISTINCT SessionTable.SessionID) AS ATTENDED  "  +
			 " FROM AttendanceTable,SessionTable,SeminarTable,AccountTable  "  +
			 " WHERE SessionTable.SessionID = AttendanceTable.SessionID  "  + //
			 " AND  "  +
			 " SessionTable.SeminarID = SeminarTable.SeminarID  "  + //SessionTable.SeminarID = SeminarTable.SeminarID
			 " AND "  +
			 " AttendanceTable.ParticipantID = AccountTable.AccountID  "  + //
			 " AND  "  +
			 " (AccountTable.RoleID = ? and AccountTable.UserInfoID = ? and EXTRACT(MONTH FROM SessionTable.date) = ? and SessionTable.Completion = ?) " ;
	
	String count_session = 
			 " SELECT COUNT(DISTINCT SessionTable.SessionID) AS ATTENDED  "  +
			 " FROM AttendanceTable,SessionTable,SeminarTable,AccountTable "  +
			 " WHERE SessionTable.SessionID = AttendanceTable.SessionID  "  + //
			 " AND  "  +
			 " SessionTable.SeminarID = SeminarTable.SeminarID  "  + //SessionTable.SeminarID = SeminarTable.SeminarID
			 " AND "  +
			 " AttendanceTable.ParticipantID = AccountTable.AccountID  "  + //
			 " AND  "  +
			 " (AccountTable.RoleID = ? and AccountTable.UserInfoID = ? and EXTRACT(MONTH FROM SessionTable.date) between ? and ? and SessionTable.Completion = ?) " ;
	
	String count_session_weekly = 
			 " SELECT COUNT(DISTINCT SessionTable.SessionID) AS ATTENDED  "  +
			 " FROM AttendanceTable,SessionTable,SeminarTable,AccountTable "  +
			 " WHERE SessionTable.SessionID = AttendanceTable.SessionID  "  + //
			 " AND  "  +
			 " SessionTable.SeminarID = SeminarTable.SeminarID  "  + //SessionTable.SeminarID = SeminarTable.SeminarID
			 " AND "  +
			 " AttendanceTable.ParticipantID = AccountTable.AccountID  "  + //
			 " AND  "  +
			 " (AccountTable.RoleID = ? and AccountTable.UserInfoID = ? and EXTRACT(MONTH FROM SessionTable.date) = ? and  EXTRACT(DAY FROM SessionTable.Date) between ? and ?  "  +
			 " and SessionTable.Completion = ?) " ;
	
//---------------
	String seminar_session_monthly = 
			 " SELECT DISTINCT CollegeTable.CollegeName, SessionTable.Date, SeminarTable.SeminarName, SessionTable.SessionName, VenueTable.VenueName, SessionTable.Completion as status, SessionTable.Capacity  "  +
			 " FROM CollegeTable, SessionTable, SeminarTable, VenueTable, UserInfoTable, DepartmentTable, AccountTable  "  +
			 " Where SessionTable.SeminarID = SeminarTable.SeminarID  "  +
			 " and SessionTable.VenueID = VenueTable.VenueID  "  +
			 " and SeminarTable.CreatorID = AccountTable.AccountID  "  +
			 " and AccountTable.UserInfoID = UserInfoTable.UserInfoID  "  +
			 " and UserInfoTable.DepartmentID = DepartmentTable.DepartmentID  "  +
			 " and DepartmentTable.CollegeID = CollegeTable.CollegeID  "  +
			 " and  "  +
			 " (EXTRACT(MONTH FROM SessionTable.Date) = ? and SeminarTable.Active = ? and SessionTable.Active = ?) " ;
	
	String seminar_session = 
			 " SELECT DISTINCT CollegeTable.CollegeName, SessionTable.Date, SeminarTable.SeminarName, SessionTable.SessionName, VenueTable.VenueName, SessionTable.Completion as status, SessionTable.Capacity  "  +
			 " FROM CollegeTable, SessionTable, SeminarTable, VenueTable, UserInfoTable, DepartmentTable, AccountTable    "  +
			 " Where SessionTable.SeminarID = SeminarTable.SeminarID  "  +
			 " and SessionTable.VenueID = VenueTable.VenueID  "  +
			 " and SeminarTable.CreatorID = AccountTable.AccountID  "  +
			 " and AccountTable.UserInfoID = UserInfoTable.UserInfoID  "  +
			 " and UserInfoTable.DepartmentID = DepartmentTable.DepartmentID  "  +
			 " and DepartmentTable.CollegeID = CollegeTable.CollegeID  "  +
			 " and  "  +
			 " (EXTRACT(MONTH FROM SessionTable.Date) between ? and ? and SeminarTable.Active = ? and SessionTable.Active = ?) " ;
	
//---------------------	
	String certification_monthly = 
			 " select COUNT(DISTINCT AttendanceTable.SessionID) as Certs  "  + 
			 " FROM AttendanceTable, RoleTable, AccountTable "  +
			 " where  "  +
			 " AccountTable.UserInfoID = AttendanceTable.ParticipantID  "  +
			 " and  "  +
			 " (AccountTable.RoleID = ? and AttendanceTable.ParticipantID = ? and EXTRACT(MONTH FROM AttendanceTable.CertificationRelease) = ? and AttendanceTable.Certification = ?) " ;
			
	String certification_weekly = 
			 " select COUNT(DISTINCT AttendanceTable.SessionID) as Certs  "  + 
			 " FROM AttendanceTable, RoleTable, AccountTable   "  +
			 " where  "  +
			 " AccountTable.UserInfoID = AttendanceTable.ParticipantID  "  +
			 " and  "  +
			 " (AccountTable.RoleID = ? and AttendanceTable.ParticipantID = ? and EXTRACT(MONTH FROM AttendanceTable.CertificationRelease) = ?  " +
			 " and EXTRACT(DAY from attendanceTable.CertificationRelease) between ? and ? and AttendanceTable.Certification = ? )" ;
	
	String certification_count = 
			" select COUNT(DISTINCT AttendanceTable.SessionID) as Certs " + 
			" FROM AttendanceTable, RoleTable, AccountTable " +
			" where " +
			" AccountTable.UserInfoID = AttendanceTable.ParticipantID  "+  
			" and   " +
			" (AccountTable.RoleID = ? and AttendanceTable.ParticipantID = ? and EXTRACT(MONTH FROM AttendanceTable.CertificationRelease) between ? and ? and AttendanceTable.Certification = ? )" ;
	
	
	String coordinate_monthly =
			 " SELECT COUNT(DISTINCT SessionTable.SessionID) from SessionTable, AccountTable  "  +
			 " where  "  +
			 " AccountTable.accountid = SessionTable.speakerID  "  +
			 " and (SessionTable.speakerid = ? and SessionTable.active = ? and EXTRACT(MONTH FROM SessionTable.date) = ? and AccountTable.roleid = ?)  " ;
	
	String coordinate_count = 
		     " SELECT COUNT(DISTINCT SessionTable.SessionID) from SessionTable, AccountTable  "  +
			 " where  "  +
			 " AccountTable.accountid = SessionTable.speakerID  "  +
			 " and (SessionTable.speakerid = ? and SessionTable.active = ? and EXTRACT(MONTH FROM SessionTable.date) between ? and ? and AccountTable.roleid = ?) " ;

	String coordinate_weekly = 
		     " SELECT COUNT(DISTINCT SessionTable.SessionID) from SessionTable, AccountTable  "  +
			 " where  "  +
			 " AccountTable.accountid = SessionTable.speakerID  "  +
			 " and (SessionTable.speakerid = ? and SessionTable.active = ? and EXTRACT(MONTH FROM SessionTable.date) = ? and AccountTable.roleid = ?  " 
			+  " and EXTRACT(DAY from SessionTable.date) between ? and ?) " ;
	
	String attendee_count = 
			 " SELECT COUNT(distinct AttendanceTable.participantid) FROM AttendanceTable, SessionTable, AccountTable, SeminarTable  "  +
			 " where  "  +
			 " AttendanceTable.participantid = AccountTable.accountid  "  +
			 " and AttendanceTable.sessionID = SessionTable.SessionID  "  +
			 " and SessionTable.seminarId = SeminarTable.seminarId   "  +
			 " and(AttendanceTable.sessionID = ? and EXTRACT(MONTH FROM SessionTable.date) = ? and SessionTable.Active = ?) " ;
	
	String attendee_count_perterm = 
			 " SELECT COUNT(distinct AttendanceTable.participantid) FROM AttendanceTable, SessionTable, AccountTable, SeminarTable  "  +
			 " where  "  +
			 " AttendanceTable.participantid = AccountTable.accountid  "  +
			 " and AttendanceTable.sessionID = SessionTable.SessionID  "  +
			 " and SessionTable.seminarId = SeminarTable.seminarId   "  +
			 " and(AttendanceTable.sessionID = ? and EXTRACT(MONTH FROM SessionTable.date) between ? and ? and SessionTable.Active = ?) " ;
			

}
