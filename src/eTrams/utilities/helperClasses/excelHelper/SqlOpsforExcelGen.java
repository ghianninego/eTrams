package eTrams.utilities.helperClasses.excelHelper;
import java.sql.*;
import java.util.*;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class SqlOpsforExcelGen implements SqlComsForExcelGen{
//paakidelete para makaconnect sa db niyo. :)
	
	/**SQL OPS + APACHE POI EXCEL GENERATION**/
	
	public static int countcollege(Connection conn){
		int x = 0; 
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(count_college);
			
			while(rs.next()){
				x = x  + rs.getInt(1);
			}
		}
		catch(Exception y){
			y.printStackTrace();
		}
		return x;
	}
	
	public static boolean partOf(Connection conn, int roleID, int accountID){
		boolean verdict = false;
		try{
			ResultSet rs = null;
			PreparedStatement pstmt = conn.prepareStatement(member);
			pstmt.setInt(2, roleID);
			pstmt.setInt(1, accountID);
				
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				verdict = true;
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
		
		return verdict;
	}
	
	public static boolean partOfSeshTable(Connection conn, int sessionID){
		boolean verdict = false;
		try{
			ResultSet rs = null;
			PreparedStatement pstmt = conn.prepareStatement(member2);
			pstmt.setInt(2, 1);
			pstmt.setInt(1, sessionID);
				
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				verdict = true;
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
		
		return verdict;
	}
	
	public static boolean partOfSeshTable2(Connection conn, int sessionID, int date){
		boolean verdict = false;
		try{
			ResultSet rs = null;
			PreparedStatement pstmt = conn.prepareStatement(member3);
			pstmt.setInt(1, sessionID);
			pstmt.setInt(2, 1);
			pstmt.setInt(3, date);
				
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				verdict = true;
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
		
		return verdict;
	}
	
	public static void colleges(Connection conn, XSSFWorkbook wb, XSSFSheet spst, XSSFRow row, XSSFCell cell, CellStyle style){
		try{
			int x = 6;
			XSSFCell cell2 = null;
			PreparedStatement pstmt = conn.prepareStatement(show_college);
			ResultSet rs = null;
			pstmt.setInt(1, 1);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				row = spst.createRow(x);
				
				cell = row.createCell(0);
				cell2 = row.createCell(1);
				
				int z = rs.getInt(1);
				String y = rs.getString(2);
				
				cell.setCellValue(z);
				cell.setCellStyle(style);
				
				cell2.setCellValue(y);
				cell2.setCellStyle(style);
				
				x++;
				
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void faculty(Connection conn, XSSFWorkbook wb, XSSFSheet spst, XSSFRow row, XSSFCell cell, CellStyle style){
		try{
			int countcollege = countcollege(conn);
			int x = 6;
			XSSFCell cell2 = null;
			XSSFCell cell3 = null;
			PreparedStatement pstmt = conn.prepareStatement(show_faculty);
			ResultSet rs = null;
			pstmt.setInt(1, 3);
			pstmt.setInt(2, 1);
			
			
			rs = pstmt.executeQuery();
			
				while(rs.next()){
					row = spst.createRow(x);
					
					cell = row.createCell(0);
					cell2 = row.createCell(1);
					cell3 = row.createCell(2);
					
					cell.setCellValue(rs.getString(2));
					cell.setCellStyle(style);
					
					cell2.setCellValue(rs.getString(3));
					cell2.setCellStyle(style);
					
					x++;
				}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}

	public static void coordinator(Connection conn, XSSFWorkbook wb, XSSFSheet spst, XSSFRow row, XSSFCell cell, CellStyle style){
		try{
			int x = 6;
			XSSFCell cell2 = null;
			XSSFCell cell3 = null;
			PreparedStatement pstmt = conn.prepareStatement(show_coordinator);
			ResultSet rs = null;
			pstmt.setInt(1, 2);
			pstmt.setInt(2, 1);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				row = spst.createRow(x);
				
				cell = row.createCell(0);
				cell2 = row.createCell(1);
				cell3 = row.createCell(2);
				
				cell.setCellValue(rs.getString(2));
				cell.setCellStyle(style);
				
				cell2.setCellValue(rs.getString(3));
				cell2.setCellStyle(style);
				
				x++;
				
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static int UserAccountTotal(Connection conn){
		
		int x = 0;
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(count_user);
			
			while(rs.next()){
				x = rs.getInt(1);
			}
			
		}
		catch(Exception y){
			y.printStackTrace();
		}
		
		return x;
	}
	
	public static int SessionTotal(Connection conn){
		int x = 0;
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(count_session_total);
			
			while(rs.next()){
				x = rs.getInt(1);
			}
			return x;
		}
		catch(Exception y){
			y.printStackTrace();
		}
		
		return x;
	}
	
	public static void session_monthly(Connection conn, XSSFWorkbook wb, XSSFSheet spst, XSSFCell cell, CellStyle style, int column, int month, int d1, int d2){
		try{
			int facultyCt = UserAccountTotal(conn);
			//System.out.println(facultyCt + "-facultyct");
			int x = 6;
			
			ResultSet rs = null;
			PreparedStatement pstmt = conn.prepareStatement(count_session_monthly); 
			pstmt.setInt(1, 3);
			pstmt.setInt(3, month);
			pstmt.setString(4, "Complete");
			//pstmt.setString(4, "'Complete'");
			
			for(int j = 1; j <= facultyCt; j++){
				if(partOf(conn,3,j)){
					pstmt.setInt(2, j);
					
					rs = pstmt.executeQuery();
						
					while(rs.next()){
						XSSFRow row = spst.getRow(x);
						if(row != null){
							cell = row.createCell(column);
							if(d1 < d2){
								cell.setCellValue("NOT YET AVAILABLE");
								cell.setCellStyle(style);
							}
							else{
								cell.setCellValue(rs.getInt(1));
								cell.setCellStyle(style);
							}
						}
						
						x = x + 1;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void session_monthly_incomp(Connection conn, XSSFWorkbook wb, XSSFSheet spst, XSSFCell cell, CellStyle style, int column, int month, int d1, int d2){
		try{
			int facultyCt = UserAccountTotal(conn);
			//System.out.println(facultyCt + "-facultyct");
			int x = 6;
			
			ResultSet rs = null;
			PreparedStatement pstmt = conn.prepareStatement(count_session_monthly_incomp); 
			pstmt.setInt(1, 3);
			pstmt.setInt(3, month);
			pstmt.setString(4, "Incomplete");
			//pstmt.setString(4, "'Incomplete'");
			
			for(int j = 1; j <= facultyCt; j++){
				if(partOf(conn,3,j)){
					pstmt.setInt(2, j);
					
					rs = pstmt.executeQuery();
						
					while(rs.next()){
						XSSFRow row = spst.getRow(x);
						if(row != null){
							cell = row.createCell(column);
							if(d1 < d2){
								cell.setCellValue("NOT YET AVAILABLE");
								cell.setCellStyle(style);
							}
							else{
								cell.setCellValue(rs.getInt(1));
								cell.setCellStyle(style);
							}
						}
						
						x = x + 1;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void session_count(Connection conn, XSSFWorkbook wb, XSSFSheet spst, XSSFCell cell, CellStyle style, int column, int month1, int month5, int d1, int d2){
		try{
			int facultyCt = UserAccountTotal(conn);
			int x = 6;
			
			ResultSet rs = null;
			PreparedStatement pstmt = conn.prepareStatement(count_session); 
			pstmt.setInt(1, 3);
			pstmt.setInt(3, month1);
			pstmt.setInt(4, month5);
			pstmt.setString(5, "Complete");
			//pstmt.setString(5, "'Complete'");

			
			for(int j = 1; j <= facultyCt; j++){
				if(partOf(conn,3,j)){
					pstmt.setInt(2, j);
					
					rs = pstmt.executeQuery();
						
					while(rs.next()){
						XSSFRow row = spst.getRow(x);
						if(row != null){
							cell = row.createCell(column);
							if(d1 < d2){
								cell.setCellValue("NOT YET AVAILABLE");
								cell.setCellStyle(style);
							}
							else{
								cell.setCellValue(rs.getInt(1));
								cell.setCellStyle(style);
							}
							//x = x + 1;
						}
						x = x + 1;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void session_count_incomp(Connection conn, XSSFWorkbook wb, XSSFSheet spst, XSSFCell cell, CellStyle style, int column, int month1, int month5, int d1, int d2){
		try{
			int facultyCt = UserAccountTotal(conn);
			int x = 6;
			
			ResultSet rs = null;
			PreparedStatement pstmt = conn.prepareStatement(count_session_incomp); 
			pstmt.setInt(1, 3);
			pstmt.setInt(3, month1);
			pstmt.setInt(4, month5);
			pstmt.setString(5, "Incomplete");
			//pstmt.setString(5, "'Incomplete'");

			
			for(int j = 1; j <= facultyCt; j++){
				if(partOf(conn,3,j)){
					pstmt.setInt(2, j);
					
					rs = pstmt.executeQuery();
						
					while(rs.next()){
						XSSFRow row = spst.getRow(x);
						if(row != null){
							cell = row.createCell(column);
							if(d1 < d2){
								cell.setCellValue("NOT YET AVAILABLE");
								cell.setCellStyle(style);
							}
							else{
								cell.setCellValue(rs.getInt(1));
								cell.setCellStyle(style);
							}
							//x = x + 1;
						}
						x = x + 1;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void count_session_weekly(Connection conn, XSSFWorkbook wb, XSSFCell cell, XSSFSheet spst, CellStyle style, int column, int month, int date, int date1){
		try{
			int facultyCt = UserAccountTotal(conn);
			int x = 6;
			
			ResultSet rs = null;
			PreparedStatement pstmt = conn.prepareStatement(count_session_weekly); 
			pstmt.setInt(1, 3);
			pstmt.setInt(3, month);
			pstmt.setInt(4, date);
			pstmt.setInt(5, date1);
			pstmt.setString(6, "Complete");
			//pstmt.setString(6, "'Complete'");

			
			for(int j = 1; j <= facultyCt; j++){
				if(partOf(conn,3,j)){
					pstmt.setInt(2, j);
					
					rs = pstmt.executeQuery();
						
					while(rs.next()){
						XSSFRow row = spst.getRow(x);
						if(row != null){
							cell = row.createCell(column);
							cell.setCellValue(rs.getInt(1));
							cell.setCellStyle(style);
							//x = x + 1;
						}
						x = x + 1;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void count_session_weekly_incomp(Connection conn, XSSFWorkbook wb, XSSFCell cell, XSSFSheet spst, CellStyle style, int column, int month, int date, int date1){
		try{
			int facultyCt = UserAccountTotal(conn);
			int x = 6;
			
			ResultSet rs = null;
			PreparedStatement pstmt = conn.prepareStatement(count_session_weekly_incomp); 
			pstmt.setInt(1, 3);
			pstmt.setInt(3, month);
			pstmt.setInt(4, date);
			pstmt.setInt(5, date1);
			pstmt.setString(6, "Incomplete");
			//pstmt.setString(6, "'Incomplete'"); 

			
			for(int j = 1; j <= facultyCt; j++){
				if(partOf(conn,3,j)){
					pstmt.setInt(2, j);
					
					rs = pstmt.executeQuery();
						
					while(rs.next()){
						XSSFRow row = spst.getRow(x);
						if(row != null){
							cell = row.createCell(column);
							cell.setCellValue(rs.getInt(1));
							cell.setCellStyle(style);
							//x = x + 1;
						}
						x = x + 1;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void session_seminar_permonth(Connection conn, XSSFWorkbook wb, XSSFRow row, XSSFCell c1, XSSFSheet spst, CellStyle style, int month){
		try{
			int x = 5;
			PreparedStatement pstmt = conn.prepareStatement(seminar_session_monthly);
			ResultSet rs = null;
			
			c1 = null;
			XSSFCell c2 = null;
			XSSFCell c3 = null;
			XSSFCell c4 = null;
			XSSFCell c5 = null;
			XSSFCell c6 = null;
			XSSFCell c7 = null;
			
			pstmt.setInt(1, month);
			pstmt.setInt(2, 1);
			pstmt.setInt(3, 1);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				row = spst.createRow(x);
				if(row != null){
					
					c1 = row.createCell(0);
					c1.setCellValue(rs.getString(1));
					
					c2 = row.createCell(1);
					c2.setCellValue(rs.getString(2));
					
					c3 = row.createCell(2);
					c3.setCellValue(rs.getString(3));
					
					c4 = row.createCell(3);
					c4.setCellValue(rs.getString(4));
					
					c5 = row.createCell(4);
					c5.setCellValue(rs.getString(5));
					
					c6 = row.createCell(5);
					int f = rs.getInt(6);
					if(f==1){
						c6.setCellValue("COMPLETED");
					}
					else{
						c6.setCellValue("NOT YET COMPLETED");
					}
					
					c7 = row.createCell(6);
					c7.setCellValue(rs.getInt(7));
					c7.setCellStyle(style);
					
					c1.setCellStyle(style);
					c2.setCellStyle(style);
					c3.setCellStyle(style);
					c4.setCellStyle(style);
					c5.setCellStyle(style);
					c6.setCellStyle(style);
					c7.setCellStyle(style);
					
					//x++;
				}
				x++;
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void session_seminar(Connection conn, XSSFWorkbook wb, XSSFRow row, XSSFCell c1, XSSFSheet spst, CellStyle style, int column, int month1, int month5){
		try{
			int x = 6;
			PreparedStatement pstmt = conn.prepareStatement(seminar_session);
			ResultSet rs = null;
			
			c1 = null;
			XSSFCell c2 = null;
			XSSFCell c3 = null;
			XSSFCell c4 = null;
			XSSFCell c5 = null;
			XSSFCell c6 = null;
			XSSFCell c7 = null;
			
			pstmt.setInt(1, month1);
			pstmt.setInt(2, month5);
			pstmt.setInt(3, 1);
			pstmt.setInt(4, 1);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				row = spst.createRow(x);
				if(row != null){
					c1 = row.createCell(column);
					c1.setCellValue(rs.getString(1));
					
					c2 = row.createCell(column+1);
					c2.setCellValue(rs.getString(2));
					
					c3 = row.createCell(column+2);
					c3.setCellValue(rs.getString(3));
					
					c4 = row.createCell(column+3);
					c4.setCellValue(rs.getString(4));
					
					c5 = row.createCell(column+4);
					c5.setCellValue(rs.getString(5));
					
					c6 = row.createCell(column+5);
					int f = rs.getInt(6);
					if(f==1){
						c6.setCellValue("COMPLETED");
					}
					else{
						c6.setCellValue("NOT YET COMPLETED");
					}
					
					c7 = row.createCell(column+6);
					c7.setCellValue(rs.getInt(7));
					
					c1.setCellStyle(style);
					c2.setCellStyle(style);
					c3.setCellStyle(style);
					c4.setCellStyle(style);
					c5.setCellStyle(style);
					c6.setCellStyle(style);
					c7.setCellStyle(style);
					
					//x++;
				}
				x++;
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void certification_monthly(Connection conn, XSSFWorkbook wb, XSSFRow row, XSSFCell c1, XSSFSheet spst, CellStyle style, int month, int column, int d1, int d2){
		try{
			int x = 6;
			int userCount = UserAccountTotal(conn);
			PreparedStatement pstmt = conn.prepareStatement(certification_monthly);
			ResultSet rs = null;
			pstmt.setInt(1, 3);
			pstmt.setInt(3, month);
			pstmt.setInt(4, 1);
			
			for(int i = 1; i <= userCount; i++){
				if(partOf(conn,3,i)){
					pstmt.setInt(2, i);
					
					rs = pstmt.executeQuery(); 
					
					while(rs.next()){
						row = spst.getRow(x);
						if(row != null){
							c1 = row.createCell(column);
							if(d1 < d2){
								c1.setCellValue("NOT YET AVAILABLE");
								c1.setCellStyle(style);
							}
							else{
								c1.setCellValue(rs.getInt(1));
								c1.setCellStyle(style);
							}
						}
						x++;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void certificationPerterm(Connection conn, XSSFWorkbook wb, XSSFRow row, XSSFCell c1, XSSFSheet spst, CellStyle style, int column, int month1, int month5, int d1, int d2){
		try{
			int x = 6;
			int userCount = UserAccountTotal(conn);
			PreparedStatement pstmt = conn.prepareStatement(certification_count);
			ResultSet rs = null;
			
			pstmt.setInt(1, 3);
			pstmt.setInt(3, month1);
			pstmt.setInt(4, month5);
			pstmt.setInt(5, 1);
			
			for(int i = 1; i <= userCount; i++){
				if(partOf(conn,3,i)){
					pstmt.setInt(2, i);
					
					rs = pstmt.executeQuery(); 
					
					while(rs.next()){
						row = spst.getRow(x);
						if(row != null){
							c1 = row.createCell(column);
							if(d1 < d2){
								c1.setCellValue("NOT YET AVAILABLE");
								c1.setCellStyle(style);
							}
							else{
								c1.setCellValue(rs.getInt(1));
								c1.setCellStyle(style);
							}
							
							//x = x + 1;
						}
						x++;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void certificationWeekly(Connection conn, XSSFWorkbook wb, XSSFRow row, XSSFCell c1, XSSFSheet spst, CellStyle style, int column, int month1, int date1, int date2){
		try{
			int x = 6;
			int userCount = UserAccountTotal(conn);
			PreparedStatement pstmt = conn.prepareStatement(certification_weekly);
			ResultSet rs = null;
			
			pstmt.setInt(1, 3);
			pstmt.setInt(3, month1);
			pstmt.setInt(4, date1);
			pstmt.setInt(5, date2);
			pstmt.setInt(6, 1);
			
			for(int i = 1; i <= userCount; i++){
				if(partOf(conn,3,i)){
					pstmt.setInt(2, i);
					
					rs = pstmt.executeQuery(); 
					
					while(rs.next()){
						row = spst.getRow(x);
						if(row != null){
							c1 = row.createCell(column);
							
							c1.setCellValue(rs.getInt(1));
							c1.setCellStyle(style);
							
							//x = x + 1;
						}
						x = x + 1;
					}
				}
				else{
					//do nothing;
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void coordinate_monthly(Connection conn, XSSFWorkbook wb, XSSFRow row, XSSFCell c1, XSSFSheet spst, CellStyle style, int column, int month, int d1, int d2){
		try{
			int x = 6;
			int userCount = UserAccountTotal(conn);
			PreparedStatement pstmt = conn.prepareStatement(coordinate_monthly);
			ResultSet rs = null;
			
			pstmt.setInt(2, 1);
			pstmt.setInt(3, month);
			pstmt.setInt(4, 2);
			
			for(int i = 1; i <= userCount; i++){
				if(partOf(conn,2,i)){
					pstmt.setInt(1, i);
					
					rs = pstmt.executeQuery(); 
					
					while(rs.next()){
						row = spst.getRow(x);
						if(row != null){
							c1 = row.createCell(column);
							if(d1<d2){
								c1.setCellValue("NOT YET AVAILABLE");
								c1.setCellStyle(style);
							}
							else{
								c1.setCellValue(rs.getInt(1));
								c1.setCellStyle(style);
							}
							//x = x + 1;
						}
						x = x + 1;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void coordinator(Connection conn, XSSFWorkbook wb, XSSFRow row, XSSFCell c1, XSSFSheet spst, CellStyle style, int column, int month1, int m5, int d1, int d2){
		try{
			int x = 6;
			int userCount = UserAccountTotal(conn);
			PreparedStatement pstmt = conn.prepareStatement(coordinate_count);
			ResultSet rs = null;
			
			pstmt.setInt(2, 1);
			pstmt.setInt(3, month1);
			pstmt.setInt(4, m5);
			pstmt.setInt(5, 2);
			
			for(int i = 1; i <= userCount; i++){
				if(partOf(conn,2,i)){
					pstmt.setInt(1, i);
					
					rs = pstmt.executeQuery(); 
					
					while(rs.next()){
						row = spst.getRow(x);
						if(row != null){
							c1 = row.createCell(column);
							if(d1<d2){
								c1.setCellValue("NOT YET AVAILABLE");
								c1.setCellStyle(style);	
							}
							else{
								c1.setCellValue(rs.getInt(1));
								c1.setCellStyle(style);
							}
							//x = x + 1;
						}
						x = x + 1;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void coordinate_weekly(Connection conn, XSSFWorkbook wb, XSSFRow row, XSSFCell c1, XSSFSheet spst, CellStyle style, int column, int month, int date1, int date2){
		try{
			int x = 6;
			int userCount = UserAccountTotal(conn);
			PreparedStatement pstmt = conn.prepareStatement(coordinate_weekly);
			ResultSet rs = null;
			
			pstmt.setInt(2, 1);
			pstmt.setInt(3, month);
			pstmt.setInt(4, 2);
			pstmt.setInt(5, date1);
			pstmt.setInt(6, date2);
			
			for(int i = 1; i <= userCount; i++){
				if(partOf(conn,2,i)){
					pstmt.setInt(1, i);
					
					rs = pstmt.executeQuery(); 
					
					while(rs.next()){
						row = spst.getRow(x);
						if(row != null){
							c1 = row.createCell(column);
							
							c1.setCellValue(rs.getInt(1));
							c1.setCellStyle(style);
							
							//x = x + 1;
						}
						x = x + 1;
					}
				}
				else{
					//do nothing
				}
			}
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void attendee_count(Connection conn, XSSFWorkbook wb, XSSFRow row, XSSFCell cell, XSSFSheet spst, CellStyle style, int column, int month1){
		try{
			int x = 5; 
			
			PreparedStatement pstmt = conn.prepareStatement(attendee_count);
			ResultSet rs = null;
			int session = SessionTotal(conn);
			
			pstmt.setInt(2, month1);
			pstmt.setInt(3, 1);
			
			for(int i = 1; i <= session; i++){
				if(partOfSeshTable(conn,i)){
					pstmt.setInt(1, i);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						row = spst.getRow(x);
						if(row != null){
							cell = row.createCell(column);
							cell.setCellValue(rs.getInt(1));
							cell.setCellStyle(style);
						}
						x++;
					}
				}
				else{
					//do nothing
				}
				
			}
			
		}
		catch(Exception x){
			x.printStackTrace();
		}
	}
	
	public static void attendee_perterm(Connection conn, XSSFWorkbook wb, XSSFRow row, XSSFCell cell, XSSFSheet spst, CellStyle style, int column, int month1, int month5, int d1, int d5, int term){
		//term = month talaga 'to. XD
		try{
			int x = 6; 
			
			PreparedStatement pstmt = conn.prepareStatement(attendee_count_perterm);
			ResultSet rs = null;
			int session = SessionTotal(conn);
			
			pstmt.setInt(2, month1);
			pstmt.setInt(3, month5);
			pstmt.setInt(4, 1);
			
			for(int i = 1; i <= session; i++){
				if(partOfSeshTable2(conn,i,term)){
					pstmt.setInt(1, i);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						row = spst.getRow(x);
						
						if(row != null){
							cell = row.createCell(column);
							
							if(d1>d5){
								if(rs.getInt(1) == 0){
									if(month1 == 1){ // second term <-first at third mawawalan ng record-> //column 15
										if(term == 1 || term == 2 || term == 3 || term == 4 || term == 5){
											cell.setCellValue(rs.getInt(1));
											cell.setCellStyle(style);
										}
										else{
											XSSFCell c1 = row.getCell(column-15); //no records sa first term //0
											XSSFCell c3 = row.getCell(column+1); // no record sa third term //16
											
											if((c1.getStringCellValue()).equals("") || (c3.getStringCellValue()).equals("NOT YET AVAILABLE") 
													|| (c3.getStringCellValue()).equals("")){
												c1 = row.getCell(column-8); //7
												c3 = row.getCell(column+8); //23
												if(!c1.getStringCellValue().equals("0") || !c3.getStringCellValue().equals("")
														|| c1.getStringCellValue().equals("0") || c3.getStringCellValue().equals("")){
													c1.setCellValue("");
													c3.setCellValue("");
												}
											}
										}
									}
									
									else if(month1 == 6){ //third term <--first at second mawawalan--> // column 23
										if(term == 6 || term == 7){
											cell.setCellValue(rs.getInt(1));
											cell.setCellStyle(style);
										}
										else{
											XSSFCell c2 = row.getCell(column-23); //no records sa first term
											XSSFCell c3 = row.getCell(column-16); // no record sa second term
											
											if((c2.getStringCellValue()).equals("") || (c3.getStringCellValue()).equals("")){
												c2 = row.getCell(column-16);
												c3 = row.getCell(column-8);
												if(!c2.getStringCellValue().equals("") || !c3.getStringCellValue().equals("")){
													c2.setCellValue("");
													c3.setCellValue("");
												}
												
											}
										}
									}
									
									else if(month1 == 8){ //first term <--third at second mawawalan--> //column 7
										if(term == 8 || term == 9 || term == 10 || term == 11 || term == 12){
											cell.setCellValue(rs.getInt(1));
											cell.setCellStyle(style);
										}
										else{
											XSSFCell c1 = row.getCell(column + 1); //second
											XSSFCell c2 = row.getCell(column + 9); //third
											
											/*if((c1.getStringCellValue()).equals("NOT YET AVAILABLE") || (c2.getStringCellValue()).equals("NOT YET AVAILABLE") || 
													c1 != null || c2 != null){
												c1 = row.getCell(column+8);
												c2 = row.getCell(column+16);
												if(!c1.getStringCellValue().equals("") || !c2.getStringCellValue().equals("")){ //
													c1.setCellValue("");
													c2.setCellValue("");
												}
												
											}*/
										}
									}
								}
								else{
									cell.setCellValue(rs.getInt(1));
									cell.setCellStyle(style);
								}
							}
							else{
								cell.setCellValue("NOT YET AVAILABLE");
								cell.setCellStyle(style);
							}
							
						}
						
						x++;
					}
				}
				else{
					//do nothing
				}
			}
		}
			
		catch(Exception x){
			x.printStackTrace();
		}
	}
}




