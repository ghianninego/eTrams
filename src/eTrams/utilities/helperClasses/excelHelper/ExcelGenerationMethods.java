package eTrams.utilities.helperClasses.excelHelper;
import java.sql.Connection;
import java.util.Calendar;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFCell;

public class ExcelGenerationMethods {
	//faculty_report per month sheet
public static void F1(Connection conn, XSSFWorkbook wb){
		
		//set layout --->
		
		XSSFSheet sp = wb.createSheet("FacultyReport-Monthly");
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String fontface = "Calibri";
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int year = cal.get(Calendar.YEAR);
		
		String asOF = month + "/" + day + "/" + year;
		
		CellStyle s1 = wb.createCellStyle(); //TRAINING...& TITLE OF SHEET
		StyleClass.ColoredHeader(wb, s1, 10, fontface, HSSFColor.YELLOW.index, HSSFColor.BLACK.index);
		CellStyle s2 = wb.createCellStyle(); //ACAD YEAR HEADER & PER MONTH HEADER
		StyleClass.ColoredHeader(wb, s2, 10, fontface, HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s3 = wb.createCellStyle(); //AS OF HEADER
		StyleClass.ColoredHeader(wb, s3, 10, fontface, HSSFColor.PLUM.index, HSSFColor.BLACK.index);
		CellStyle s4 = wb.createCellStyle(); //MONTH 1
		StyleClass.ColoredHeaderItlcz(wb, s4, 10, fontface, HSSFColor.CORAL.index, HSSFColor.BLACK.index);
		CellStyle s5 = wb.createCellStyle(); //MONTH 2
		StyleClass.ColoredHeaderItlcz(wb, s5, 10, fontface, HSSFColor.LAVENDER.index, HSSFColor.BLACK.index);
		CellStyle s6 = wb.createCellStyle(); //MONTH 3
		StyleClass.ColoredHeaderItlcz(wb, s6, 9, fontface, HSSFColor.LIGHT_BLUE.index, HSSFColor.BLACK.index);
		CellStyle s7 = wb.createCellStyle(); //MONTH 4
		StyleClass.ColoredHeaderItlcz(wb, s7, 10, fontface, HSSFColor.LIGHT_GREEN.index, HSSFColor.BLACK.index);
		CellStyle s8 = wb.createCellStyle(); //MONTH 5
		StyleClass.ColoredHeaderItlcz(wb, s8, 10, fontface, HSSFColor.TEAL.index, HSSFColor.BLACK.index);
		CellStyle s9 = wb.createCellStyle(); //MONTH 6
		StyleClass.ColoredHeaderItlcz(wb, s9, 10, fontface, HSSFColor.ORANGE.index, HSSFColor.BLACK.index);
		CellStyle s10 = wb.createCellStyle(); //TITLE HEADER
		StyleClass.ColoredHeader(wb, s10, 10, fontface, HSSFColor.GREY_25_PERCENT.index, HSSFColor.BLACK.index);
		CellStyle s11 = wb.createCellStyle(); //CONTENT
		StyleClass.Content(wb, s11, HSSFColor.BLACK.index, 9, fontface);
		CellStyle s12 = wb.createCellStyle(); //per header
		StyleClass.ColoredHeaderItlcz(wb, s12, 11, "Courier New", HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s13 = wb.createCellStyle();
		StyleClass.ColoredContent(wb, s13, HSSFColor.RED.index, HSSFColor.BLACK.index, 9, fontface);
		
		sp.addMergedRegion(new CellRangeAddress(0,0,0,40));
		sp.addMergedRegion(new CellRangeAddress(1,1,0,40));
		sp.addMergedRegion(new CellRangeAddress(2,2,0,40));
		sp.addMergedRegion(new CellRangeAddress(3,3,0,40));
		sp.addMergedRegion(new CellRangeAddress(4,4,0,1));
		sp.addMergedRegion(new CellRangeAddress(4,4,2,4));
		sp.addMergedRegion(new CellRangeAddress(4,4,5,7));
		sp.addMergedRegion(new CellRangeAddress(4,4,8,10));
		sp.addMergedRegion(new CellRangeAddress(4,4,11,13));
		sp.addMergedRegion(new CellRangeAddress(4,4,14,16));
		sp.addMergedRegion(new CellRangeAddress(4,4,17,19));
		sp.addMergedRegion(new CellRangeAddress(4,4,20,22));
		sp.addMergedRegion(new CellRangeAddress(4,4,23,25));
		sp.addMergedRegion(new CellRangeAddress(4,4,26,28));
		sp.addMergedRegion(new CellRangeAddress(4,4,29,31));
		sp.addMergedRegion(new CellRangeAddress(4,4,32,34));
		sp.addMergedRegion(new CellRangeAddress(4,4,35,37));
		sp.addMergedRegion(new CellRangeAddress(4,4,38,40));
		
		row = sp.createRow(0); //-->
		
		cell = row.createCell(0);
		cell.setCellValue("TRAINING REGISTRATION AND ATTENDANCE MONITORING SHEET");
		cell.setCellStyle(s1);
		
		row = sp.createRow(1);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("ACADEMIC YEAR");
		cell.setCellStyle(s2);
		
		row = sp.createRow(2);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY - SESSION COUNT");
		cell.setCellStyle(s1);
		
		row = sp.createRow(3);
		
		cell = row.createCell(0);
		cell.setCellValue("AS OF " + asOF); 
		cell.setCellStyle(s3);
		
		row = sp.createRow(4);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("P E R  M O N T H  R E P O R T");
		cell.setCellStyle(s12);
		
		cell = row.createCell(2);
		cell.setCellValue("January");
		cell.setCellStyle(s4);
		
		cell = row.createCell(5);
		cell.setCellValue("February");
		cell.setCellStyle(s5);
		
		cell = row.createCell(8);
		cell.setCellValue("MARCH");
		cell.setCellStyle(s6);
		
		cell = row.createCell(11);
		cell.setCellValue("APRIL");
		cell.setCellStyle(s7);
		
		cell = row.createCell(14);
		cell.setCellValue("MAY");
		cell.setCellStyle(s8);
		
		cell = row.createCell(17);
		cell.setCellValue("JUNE");
		cell.setCellStyle(s9);
		
		cell = row.createCell(20);
		cell.setCellValue("JULY");
		cell.setCellStyle(s4);
		
		cell = row.createCell(23);
		cell.setCellValue("AUGUST");
		cell.setCellStyle(s5);
		
		cell = row.createCell(26);
		cell.setCellValue("SEPTEMBER");
		cell.setCellStyle(s6);
		
		cell = row.createCell(29);
		cell.setCellValue("OCTOBER");
		cell.setCellStyle(s7);
		
		cell = row.createCell(32);
		cell.setCellValue("NOVEMBER");
		cell.setCellStyle(s8);
		
		cell = row.createCell(35);
		cell.setCellValue("DECEMBER");
		cell.setCellStyle(s9);
		
		cell = row.createCell(38);
		cell.setCellValue("TOTAL");
		cell.setCellStyle(s12);
		
		sp.setColumnWidth(0, 8500);
		sp.setColumnWidth(1, 7000);
		for(int i = 2; i <= 40; i++){
			sp.setColumnWidth(i, 4000);
		}
		
		row = sp.createRow(5);
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY NAME");
		cell.setCellStyle(s10);
		
		cell = row.createCell(1);
		cell.setCellValue("COLLEGE");
		cell.setCellStyle(s10);
		
		for(int i = 2; i <= 40;){
			cell = row.createCell(i);
			cell.setCellValue("COMPLETED SESSIONS");
			cell.setCellStyle(s10);
			
			cell = row.createCell(i+1);
			cell.setCellValue("INCOMPLETED SESSIONS");
			cell.setCellStyle(s10);
			
			cell = row.createCell(i+2);
			cell.setCellValue("CERTIFICATIONS ACCEPTED");
			cell.setCellStyle(s10);
			
			i = i + 3;
		}
		
		// <--- set layout
		
		//retrieve db contents
		SqlOpsforExcelGen.faculty(conn, wb, sp, row, cell, s11);
		int x = 1; 
		
		for(int i = 2; i <= 37;){
			if(month < i-x){
				SqlOpsforExcelGen.session_monthly(conn, wb, sp, cell, s13, i, i-x, 1, month, i-x);
				SqlOpsforExcelGen.session_monthly(conn, wb, sp, cell, s13, i+1, i-x, 0,month, i-x);
				SqlOpsforExcelGen.certification_monthly(conn, wb, row, cell, sp, s13, i-x, i+2, month, i-x);
				System.out.println(i-x);
				x = x + 2;
				i = i + 3;
			}
			else{
				SqlOpsforExcelGen.session_monthly(conn, wb, sp, cell, s11, i, i-x, 1,month, i-x);
				SqlOpsforExcelGen.session_monthly(conn, wb, sp, cell, s11, i+1, i-x, 0,month, i-x);
				SqlOpsforExcelGen.certification_monthly(conn, wb, row, cell, sp, s11, i-x, i+2, month, i-x);
				System.out.println(i-x);
				x = x + 2;
				i = i + 3;
			}
		}
		
		
		//SET CELL FORMULA
		int y = sp.getLastRowNum(); 
		for(int i = 6; i <= y; i++){
			row = sp.getRow(i);
			int f = i+1; 
			
			cell = row.createCell(38);
			cell.setCellFormula("SUM(C" + f +",F" + f + ",I" + f + ",L" + f + ",O" + f
					+ ",R" + f + ",U" + f
					+ ",X" + f + ",AA" + f + ",AD" + f + ",AG" + f + ",AJ" + f + ")");
			cell.setCellStyle(s11);
			
			//D,G,J,M,P,S,V,Y,AB,AE,AH,AK
			cell = row.createCell(39);
			cell.setCellFormula("SUM(D" + f +",G" + f + ",J" + f + ",M" + f + ",P" + f
					+ ",S" + f + ",V" + f
					+ ",Y" + f + ",AB" + f + ",AE" + f + ",AH" + f + ",AK" + f + ")");
			cell.setCellStyle(s11);
			
			///E,H,K,N,Q,T,W,Z,AC,AF,AI,AL
			cell = row.createCell(40);
			cell.setCellFormula("SUM(E" + f +",H" + f + ",K" + f + ",N" + f + ",Q" + f
					+ ",T" + f + ",W" + f
					+ ",Z" + f + ",AC" + f + ",AF" + f + ",AI" + f + ",AL" + f + ")");
			cell.setCellStyle(s11);
		}
		
		
	}
	
	public static void F2(Connection conn, XSSFWorkbook wb){
		//faculty_report per term
		
		//set layout --->
		
		XSSFSheet sp = wb.createSheet("FacultyReport-PerTerm");
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String fontface = "Calibri";
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int year = cal.get(Calendar.YEAR);
		
		String asOF = month + "/" + day + "/" + year;
		
		CellStyle s1 = wb.createCellStyle(); //TRAINING...& TITLE OF SHEET
		StyleClass.ColoredHeader(wb, s1, 10, fontface, HSSFColor.YELLOW.index, HSSFColor.BLACK.index);
		CellStyle s2 = wb.createCellStyle(); //ACAD YEAR HEADER & PER MONTH HEADER
		StyleClass.ColoredHeader(wb, s2, 10, fontface, HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s3 = wb.createCellStyle(); //AS OF HEADER
		StyleClass.ColoredHeader(wb, s3, 10, fontface, HSSFColor.PLUM.index, HSSFColor.BLACK.index);
		CellStyle s4 = wb.createCellStyle(); //MONTH 1
		StyleClass.ColoredHeaderItlcz(wb, s4, 10, fontface, HSSFColor.CORAL.index, HSSFColor.BLACK.index);
		CellStyle s5 = wb.createCellStyle(); //MONTH 2
		StyleClass.ColoredHeaderItlcz(wb, s5, 10, fontface, HSSFColor.LAVENDER.index, HSSFColor.BLACK.index);
		CellStyle s6 = wb.createCellStyle(); //MONTH 3
		StyleClass.ColoredHeaderItlcz(wb, s6, 9, fontface, HSSFColor.LIGHT_BLUE.index, HSSFColor.BLACK.index);
		CellStyle s10 = wb.createCellStyle(); //TITLE HEADER
		StyleClass.ColoredHeader(wb, s10, 10, fontface, HSSFColor.GREY_25_PERCENT.index, HSSFColor.BLACK.index);
		CellStyle s11 = wb.createCellStyle(); //CONTENT
		StyleClass.Content(wb, s11, HSSFColor.BLACK.index, 9, fontface);
		CellStyle s12 = wb.createCellStyle(); //per header
		StyleClass.ColoredHeaderItlcz(wb, s12, 11, "Courier New", HSSFColor.BLACK.index, HSSFColor.WHITE.index);;
		CellStyle s13 = wb.createCellStyle();
		StyleClass.ColoredContent(wb, s13, HSSFColor.RED.index, HSSFColor.BLACK.index, 9, fontface);;
		
		sp.addMergedRegion(new CellRangeAddress(0,0,0,13));
		sp.addMergedRegion(new CellRangeAddress(1,1,0,13));
		sp.addMergedRegion(new CellRangeAddress(2,2,0,13));
		sp.addMergedRegion(new CellRangeAddress(3,3,0,13));
		sp.addMergedRegion(new CellRangeAddress(4,4,0,1));
		sp.addMergedRegion(new CellRangeAddress(4,4,2,4));
		sp.addMergedRegion(new CellRangeAddress(4,4,5,7));
		sp.addMergedRegion(new CellRangeAddress(4,4,8,10));
		sp.addMergedRegion(new CellRangeAddress(4,4,11,13));
		
		row = sp.createRow(0); //-->
		
		cell = row.createCell(0);
		cell.setCellValue("TRAINING REGISTRATION AND ATTENDANCE MONITORING SHEET");
		cell.setCellStyle(s1);
		
		row = sp.createRow(1);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("ACADEMIC YEAR");
		cell.setCellStyle(s2);
		
		row = sp.createRow(2);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY - SESSION COUNT");
		cell.setCellStyle(s1);
		
		row = sp.createRow(3);
		
		cell = row.createCell(0);
		cell.setCellValue("AS OF  " + asOF); //insert java get date here
		cell.setCellStyle(s3);
		
		row = sp.createRow(4);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("P E R  T E R M  R E P O R T");
		cell.setCellStyle(s12);
		
		cell = row.createCell(2);
		cell.setCellValue("FIRST TERM");
		cell.setCellStyle(s4);
		
		cell = row.createCell(5);
		cell.setCellValue("SECOND TERM");
		cell.setCellStyle(s5);
		
		cell = row.createCell(8);
		cell.setCellValue("THIRD TERM");
		cell.setCellStyle(s6);
		
		cell = row.createCell(11);
		cell.setCellValue("TOTAL");
		cell.setCellStyle(s12);
		
		sp.setColumnWidth(0, 8500);
		sp.setColumnWidth(1, 7000);
		for(int i = 2; i <= 13; i++){
			sp.setColumnWidth(i, 4000);
		}
		
		row = sp.createRow(5);
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY NAME");
		cell.setCellStyle(s10);
		
		cell = row.createCell(1);
		cell.setCellValue("COLLEGE");
		cell.setCellStyle(s10);
		
		for(int i = 2; i <= 13;){
			cell = row.createCell(i);
			cell.setCellValue("COMPLETED SESSIONS");
			cell.setCellStyle(s10);
			
			cell = row.createCell(i+1);
			cell.setCellValue("INCOMPLETED SESSIONS");
			cell.setCellStyle(s10);
			
			cell = row.createCell(i+2);
			cell.setCellValue("CERTIFICATIONS ACCEPTED");
			cell.setCellStyle(s10);
			
			i = i + 3;
		}
		// <--- set layout
		
		SqlOpsforExcelGen.faculty(conn, wb, sp, row, cell, s11);
		
		if(month > 7){ //1st term
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 2, 1, 8, 12, month, 7);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 3, 0, 8, 12, month,7);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s11, 4, 8, 12, month,7);

			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s13, 5, 1, 1, 5, 7, month);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s13, 6, 0, 1, 5, 7, month);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s13, 7, 1, 5, 7, month);
			
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s13, 8, 1, 6, 7, 7, month);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s13, 9, 0, 6, 7, 7, month);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s13, 10, 6, 7, 7, month);
		}
		else if(month < 6){ //2nd term
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 2, 1, 8, 12, 6,month);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 3, 0, 8, 12, 6,month);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s11, 4, 8, 12, 6,month);

			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 5, 1, 1, 5, 6,month);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 6, 0, 1, 5, 6,month);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s11, 7, 1, 5, 6,month);
			
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s13, 8, 1, 6, 7, month, 6);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s13, 9, 0, 6, 7, month, 6);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s13, 10, 6, 7, month, 6);
		}
		else if(month == 6 || month == 7){ //third term
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 2, 1, 8, 12, 7, 6);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 3, 0, 8, 12, 7, 6);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s11, 4, 8, 12, 7, 6);

			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 5, 1, 1, 5, 7, 6);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 6, 0, 1, 5, 7, 6);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s11, 7, 1, 5, 7, 6);
			
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 8, 1, 6, 7, 7, 6);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s11, 9, 0, 6, 7, 7, 6);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s11, 10, 6, 7, 7, 6);
		}
		else{
			
		}
		
		
		//SET CELL FORMULA
		int y = sp.getLastRowNum(); 
		for(int i = 6; i <= y; i++){
			row = sp.getRow(i);
			int f = i+1; 
			
			cell = row.createCell(11);
			cell.setCellFormula("SUM(C" + f +",F" + f + ",I" + f + ")");
			cell.setCellStyle(s11);
			
			//D,G,J,M,P,S,V,Y,AB,AE,AH,AK
			cell = row.createCell(12);
			cell.setCellFormula("SUM(D" + f +",G" + f + ",J" + f + ")");
			cell.setCellStyle(s11);
			
			///E,H,K,N,Q,T,W,Z,AC,AF,AI,AL
			cell = row.createCell(13);
			cell.setCellFormula("SUM(E" + f +",H" + f + ",K" + f + ")");
			cell.setCellStyle(s11);
		}
		
	}
	
	public static void F3(Connection conn, XSSFWorkbook wb){
		//faculty_report CURRENT TERM
		
		//set layout --->
		
		XSSFSheet sp = wb.createSheet("FacultyReport-CurrentTerm");
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String fontface = "Calibri";
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int year = cal.get(Calendar.YEAR);
		
		String asOF = month + "/" + day + "/" + year;
		
		CellStyle s1 = wb.createCellStyle(); //TRAINING...& TITLE OF SHEET
		StyleClass.ColoredHeader(wb, s1, 10, fontface, HSSFColor.YELLOW.index, HSSFColor.BLACK.index);
		CellStyle s2 = wb.createCellStyle(); //ACAD YEAR HEADER & PER MONTH HEADER
		StyleClass.ColoredHeader(wb, s2, 10, fontface, HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s3 = wb.createCellStyle(); //AS OF HEADER
		StyleClass.ColoredHeader(wb, s3, 10, fontface, HSSFColor.PLUM.index, HSSFColor.BLACK.index);
		CellStyle s4 = wb.createCellStyle(); //MONTH 1
		StyleClass.ColoredHeaderItlcz(wb, s4, 10, fontface, HSSFColor.CORAL.index, HSSFColor.BLACK.index);
		CellStyle s5 = wb.createCellStyle(); //TITLE HEADER
		StyleClass.ColoredHeader(wb, s5, 10, fontface, HSSFColor.GREY_25_PERCENT.index, HSSFColor.BLACK.index);
		CellStyle s6 = wb.createCellStyle(); //CONTENT
		StyleClass.Content(wb, s6, HSSFColor.BLACK.index, 9, fontface);
		CellStyle s7 = wb.createCellStyle(); //per header
		StyleClass.ColoredHeaderItlcz(wb, s7, 11, "Courier New", HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		
		sp.addMergedRegion(new CellRangeAddress(0,0,0,7));
		sp.addMergedRegion(new CellRangeAddress(1,1,0,7));
		sp.addMergedRegion(new CellRangeAddress(2,2,0,7));
		sp.addMergedRegion(new CellRangeAddress(3,3,0,7));
		sp.addMergedRegion(new CellRangeAddress(4,4,0,1));
		sp.addMergedRegion(new CellRangeAddress(4,4,2,4));
		sp.addMergedRegion(new CellRangeAddress(4,4,5,7));
		
		row = sp.createRow(0); //-->
		
		cell = row.createCell(0);
		cell.setCellValue("TRAINING REGISTRATION AND ATTENDANCE MONITORING SHEET");
		cell.setCellStyle(s1);
		
		row = sp.createRow(1);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("ACADEMIC YEAR");
		cell.setCellStyle(s2);
		
		row = sp.createRow(2);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY - SESSION COUNT");
		cell.setCellStyle(s1);
		
		row = sp.createRow(3);
		
		cell = row.createCell(0);
		cell.setCellValue("AS OF " + asOF); //insert java get date here
		cell.setCellStyle(s3);
		
		row = sp.createRow(4);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("C U R R E N T  T E R M  R E P O R T");
		cell.setCellStyle(s7);
		
		cell = row.createCell(2);
		cell.setCellValue("CURRENT TERM");
		cell.setCellStyle(s4);
		
		cell = row.createCell(5);
		cell.setCellValue("TOTAL");
		cell.setCellStyle(s7);
		
		sp.setColumnWidth(0, 8500);
		sp.setColumnWidth(1, 7000);
		for(int i = 2; i <= 13; i++){
			sp.setColumnWidth(i, 5600);
		}
		
		row = sp.createRow(5);
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY NAME");
		cell.setCellStyle(s5);
		
		cell = row.createCell(1);
		cell.setCellValue("COLLEGE");
		cell.setCellStyle(s5);
		
		for(int i = 2; i <= 7;){
			cell = row.createCell(i);
			cell.setCellValue("COMPLETED SESSIONS");
			cell.setCellStyle(s5);
			
			cell = row.createCell(i+1);
			cell.setCellValue("INCOMPLETED SESSIONS");
			cell.setCellStyle(s5);
			
			cell = row.createCell(i+2);
			cell.setCellValue("CERTIFICATIONS ACCEPTED");
			cell.setCellStyle(s5);
			
			i = i + 3;
		}
		// <--- set layout
		
		SqlOpsforExcelGen.faculty(conn, wb, sp, row, cell, s6);
		
		if(month == 1 || month == 2 || month == 3 || month == 4 || month == 5){
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s6, 2, 1, 1, 5, 2, 1); // randome number lang yung 2 and 1
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s6, 3, 0, 1, 5, 2,1);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s6, 4, 1, 5, 2,1);
		}
		else if(month == 8 || month == 9 || month == 10 || month == 11 || month == 12){
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s6, 2, 1, 8, 12, 2,1);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s6, 3, 0, 8, 12, 2,1);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s6, 4, 8, 12, 2,1);
		}
		else if(month == 6 || month == 7){
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s6, 2, 1, 6, 7,2,1);
			SqlOpsforExcelGen.session_count(conn, wb, sp, cell, s6, 3, 0, 6, 7, 2,1);
			SqlOpsforExcelGen.certificationPerterm(conn, wb, row, cell, sp, s6, 4, 6, 7, 2,1);
		}
		//SET CELL FORMULA
		int y = sp.getLastRowNum(); 
		for(int i = 6; i <= y; i++){
			row = sp.getRow(i);
			int f = i+1; 
			
			cell = row.createCell(5);
			cell.setCellFormula("SUM(C" + f + ")");
			cell.setCellStyle(s6);
			
			//D,G,J,M,P,S,V,Y,AB,AE,AH,AK
			cell = row.createCell(6);
			cell.setCellFormula("SUM(D" + f + ")");
			cell.setCellStyle(s6);
			
			///E,H,K,N,Q,T,W,Z,AC,AF,AI,AL
			cell = row.createCell(7);
			cell.setCellFormula("SUM(E" + f + ")");
			cell.setCellStyle(s6);
		}
	}
	
	public static void F4(Connection conn, XSSFWorkbook wb){
		//faculty_report CURRENT MONTH
		
		//set layout --->
		
		XSSFSheet sp = wb.createSheet("FacultyReport-CurrentWeek");
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String fontface = "Calibri";
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int year = cal.get(Calendar.YEAR);
		
		String asOF = month + "/" + day + "/" + year;
		
		CellStyle s1 = wb.createCellStyle(); //TRAINING...& TITLE OF SHEET
		StyleClass.ColoredHeader(wb, s1, 10, fontface, HSSFColor.YELLOW.index, HSSFColor.BLACK.index);
		CellStyle s2 = wb.createCellStyle(); //ACAD YEAR HEADER & PER MONTH HEADER
		StyleClass.ColoredHeader(wb, s2, 10, fontface, HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s3 = wb.createCellStyle(); //AS OF HEADER
		StyleClass.ColoredHeader(wb, s3, 10, fontface, HSSFColor.PLUM.index, HSSFColor.BLACK.index);
		CellStyle s4 = wb.createCellStyle(); //MONTH 1
		StyleClass.ColoredHeaderItlcz(wb, s4, 10, fontface, HSSFColor.CORAL.index, HSSFColor.BLACK.index);
		CellStyle s5 = wb.createCellStyle(); //TITLE HEADER
		StyleClass.ColoredHeader(wb, s5, 10, fontface, HSSFColor.GREY_25_PERCENT.index, HSSFColor.BLACK.index);
		CellStyle s6 = wb.createCellStyle(); //CONTENT
		StyleClass.Content(wb, s6, HSSFColor.BLACK.index, 9, fontface);
		CellStyle s7 = wb.createCellStyle(); //per header
		StyleClass.ColoredHeaderItlcz(wb, s7, 11, "Courier New", HSSFColor.BLACK.index, HSSFColor.WHITE.index);;
		
		sp.addMergedRegion(new CellRangeAddress(0,0,0,7));
		sp.addMergedRegion(new CellRangeAddress(1,1,0,7));
		sp.addMergedRegion(new CellRangeAddress(2,2,0,7));
		sp.addMergedRegion(new CellRangeAddress(3,3,0,7));
		sp.addMergedRegion(new CellRangeAddress(4,4,0,1));
		sp.addMergedRegion(new CellRangeAddress(4,4,2,4));
		sp.addMergedRegion(new CellRangeAddress(4,4,5,7));
		
		row = sp.createRow(0); //-->
		
		cell = row.createCell(0);
		cell.setCellValue("TRAINING REGISTRATION AND ATTENDANCE MONITORING SHEET");
		cell.setCellStyle(s1);
		
		row = sp.createRow(1);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("ACADEMIC YEAR");
		cell.setCellStyle(s2);
		
		row = sp.createRow(2);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY - SESSION COUNT");
		cell.setCellStyle(s1);
		
		row = sp.createRow(3);
		
		cell = row.createCell(0);
		cell.setCellValue("AS OF " + asOF); //insert java get date here
		cell.setCellStyle(s3);
		
		row = sp.createRow(4);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("C U R R E N T  W E E K  R E P O R T");
		cell.setCellStyle(s7);
		
		cell = row.createCell(2);
		cell.setCellValue("CURRENT WEEK");
		cell.setCellStyle(s4);
		
		cell = row.createCell(5);
		cell.setCellValue("TOTAL");
		cell.setCellStyle(s7);
		
		sp.setColumnWidth(0, 8500);
		sp.setColumnWidth(1, 7000);
		for(int i = 2; i <= 7; i++){
			sp.setColumnWidth(i, 5600);
		}
		
		row = sp.createRow(5);
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY NAME");
		cell.setCellStyle(s5);
		
		cell = row.createCell(1);
		cell.setCellValue("COLLEGE");
		cell.setCellStyle(s5);
		
		for(int i = 2; i <= 7;){
			cell = row.createCell(i);
			cell.setCellValue("COMPLETED SESSIONS");
			cell.setCellStyle(s5);
			
			cell = row.createCell(i+1);
			cell.setCellValue("INCOMPLETED SESSIONS");
			cell.setCellStyle(s5);
			
			cell = row.createCell(i+2);
			cell.setCellValue("CERTIFICATIONS ACCEPTED");
			cell.setCellStyle(s5);
			
			i = i + 3;
		}
		// <--- set layout
		
		cal.setTime(date);
		
		int exactDate = cal.get(Calendar.DATE);
		int weekDate = 0;
		
		int dayz = cal.get(Calendar.DAY_OF_WEEK);
		
		switch(dayz){
			case 1:
				weekDate = exactDate + 7;
				break;
			case 2:
				weekDate = exactDate + 6;
				break;
			case 3:
				weekDate = exactDate + 5;
				break;
			case 4:
				weekDate = exactDate + 4;
				break;
			case 5:
				weekDate = exactDate + 3;
				break;
			case 6:
				weekDate = exactDate + 2;
				break;
			case 7:
				weekDate = exactDate + 1;
				break;
		}
		
		SqlOpsforExcelGen.faculty(conn, wb, sp, row, cell, s6);
		
		SqlOpsforExcelGen.count_session_weekly(conn, wb, cell, sp, s6, 1, 2, month, exactDate, weekDate);;
		SqlOpsforExcelGen.count_session_weekly(conn, wb, cell, sp, s6, 0, 3, month, exactDate, weekDate);;
		SqlOpsforExcelGen.certificationWeekly(conn, wb, row, cell, sp, s6, 4, month, exactDate, weekDate);
		
		int y = sp.getLastRowNum(); 
		for(int i = 6; i <= y; i++){
			row = sp.getRow(i);
			int f = i+1; 
			
			cell = row.createCell(5);
			cell.setCellFormula("SUM(C" + f + ")");
			cell.setCellStyle(s6);
			
			//D,G,J,M,P,S,V,Y,AB,AE,AH,AK
			cell = row.createCell(6);
			cell.setCellFormula("SUM(D" + f + ")");
			cell.setCellStyle(s6);
			
			///E,H,K,N,Q,T,W,Z,AC,AF,AI,AL
			cell = row.createCell(7);
			cell.setCellFormula("SUM(E" + f + ")");
			cell.setCellStyle(s6);
		}
		
	}
	
	public static void F5(Connection conn, XSSFWorkbook wb){
		//coordination_report PER MONTH 
		
		//set layout --->
		
		XSSFSheet sp = wb.createSheet("CoordinatorReport-Monthly");
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String fontface = "Calibri";
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int year = cal.get(Calendar.YEAR);
		
		String asOF = month + "/" + day + "/" + year;
		
		CellStyle s1 = wb.createCellStyle(); //TRAINING...& TITLE OF SHEET
		StyleClass.ColoredHeader(wb, s1, 10, fontface, HSSFColor.YELLOW.index, HSSFColor.BLACK.index);
		CellStyle s2 = wb.createCellStyle(); //ACAD YEAR HEADER & PER MONTH HEADER
		StyleClass.ColoredHeader(wb, s2, 10, fontface, HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s3 = wb.createCellStyle(); //AS OF HEADER
		StyleClass.ColoredHeader(wb, s3, 10, fontface, HSSFColor.PLUM.index, HSSFColor.BLACK.index);
		CellStyle s4 = wb.createCellStyle(); //MONTH 1
		StyleClass.ColoredHeaderItlcz(wb, s4, 10, fontface, HSSFColor.CORAL.index, HSSFColor.BLACK.index);
		CellStyle s5 = wb.createCellStyle(); //MONTH 2
		StyleClass.ColoredHeaderItlcz(wb, s5, 10, fontface, HSSFColor.LAVENDER.index, HSSFColor.BLACK.index);
		CellStyle s6 = wb.createCellStyle(); //MONTH 3
		StyleClass.ColoredHeaderItlcz(wb, s6, 9, fontface, HSSFColor.LIGHT_BLUE.index, HSSFColor.BLACK.index);
		CellStyle s7 = wb.createCellStyle(); //MONTH 4
		StyleClass.ColoredHeaderItlcz(wb, s7, 10, fontface, HSSFColor.LIGHT_GREEN.index, HSSFColor.BLACK.index);
		CellStyle s8 = wb.createCellStyle(); //MONTH 5
		StyleClass.ColoredHeaderItlcz(wb, s8, 10, fontface, HSSFColor.TEAL.index, HSSFColor.BLACK.index);
		CellStyle s9 = wb.createCellStyle(); //MONTH 6
		StyleClass.ColoredHeaderItlcz(wb, s9, 10, fontface, HSSFColor.ORANGE.index, HSSFColor.BLACK.index);
		CellStyle s10 = wb.createCellStyle(); //TITLE HEADER
		StyleClass.ColoredHeader(wb, s10, 10, fontface, HSSFColor.GREY_25_PERCENT.index, HSSFColor.BLACK.index);
		CellStyle s11 = wb.createCellStyle(); //CONTENT
		StyleClass.Content(wb, s11, HSSFColor.BLACK.index, 9, fontface);
		CellStyle s12 = wb.createCellStyle(); //per header
		StyleClass.ColoredHeaderItlcz(wb, s12, 11, "Courier New", HSSFColor.BLACK.index, HSSFColor.WHITE.index);;
		CellStyle s13 = wb.createCellStyle(); //per header
		StyleClass.ColoredContent(wb, s13, HSSFColor.RED.index, HSSFColor.BLACK.index, 9, fontface);
		
		
		sp.addMergedRegion(new CellRangeAddress(0,0,0,14));
		sp.addMergedRegion(new CellRangeAddress(1,1,0,14));
		sp.addMergedRegion(new CellRangeAddress(2,2,0,14));
		sp.addMergedRegion(new CellRangeAddress(3,3,0,14));
		sp.addMergedRegion(new CellRangeAddress(4,4,0,1));
		
		row = sp.createRow(0); //-->
		
		cell = row.createCell(0);
		cell.setCellValue("TRAINING REGISTRATION AND ATTENDANCE MONITORING SHEET");
		cell.setCellStyle(s1);
		
		row = sp.createRow(1);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("ACADEMIC YEAR");
		cell.setCellStyle(s2);
		
		row = sp.createRow(2);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("COORDINATOR - SESSION FACILITATED COUNT");
		cell.setCellStyle(s1);
		
		row = sp.createRow(3);
		
		cell = row.createCell(0);
		cell.setCellValue("AS OF " +asOF); //insert java get date here
		cell.setCellStyle(s3);
		
		row = sp.createRow(4);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("P E R  M O N T H  R E P O R T");
		cell.setCellStyle(s12);
		
		cell = row.createCell(2);
		cell.setCellValue("January");
		cell.setCellStyle(s4);
		
		cell = row.createCell(3);
		cell.setCellValue("February");
		cell.setCellStyle(s5);
		
		cell = row.createCell(4);
		cell.setCellValue("MARCH");
		cell.setCellStyle(s6);
		
		cell = row.createCell(5);
		cell.setCellValue("APRIL");
		cell.setCellStyle(s7);
		
		cell = row.createCell(6);
		cell.setCellValue("MAY");
		cell.setCellStyle(s8);
		
		cell = row.createCell(7);
		cell.setCellValue("JUNE");
		cell.setCellStyle(s9);
		
		cell = row.createCell(8);
		cell.setCellValue("JULY");
		cell.setCellStyle(s4);
		
		cell = row.createCell(9);
		cell.setCellValue("AUGUST");
		cell.setCellStyle(s5);
		
		cell = row.createCell(10);
		cell.setCellValue("SEPTEMBER");
		cell.setCellStyle(s6);
		
		cell = row.createCell(11);
		cell.setCellValue("OCTOBER");
		cell.setCellStyle(s7);
		
		cell = row.createCell(12);
		cell.setCellValue("NOVEMBER");
		cell.setCellStyle(s8);
		
		cell = row.createCell(13);
		cell.setCellValue("DECEMBER");
		cell.setCellStyle(s9);
		
		cell = row.createCell(14);
		cell.setCellValue("TOTAL");
		cell.setCellStyle(s12);
		
		sp.setColumnWidth(0, 8500);
		sp.setColumnWidth(1, 7000);
		for(int i = 2; i <= 14; i++){
			sp.setColumnWidth(i, 4000);
		}
		
		row = sp.createRow(5);
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY NAME");
		cell.setCellStyle(s10);
		
		cell = row.createCell(1);
		cell.setCellValue("COLLEGE");
		cell.setCellStyle(s10);
		
		for(int i = 2; i <= 14; i++){
			cell = row.createCell(i);
			cell.setCellValue("FACILITATED SESSIONS");
			cell.setCellStyle(s10);
		}
		// <--- set layout
		
		SqlOpsforExcelGen.coordinator(conn, wb, sp, row, cell, s11);
		
		for(int i = 2; i<=13; i++){
			if(month < i-1){
				SqlOpsforExcelGen.coordinate_monthly(conn, wb, row, cell, sp, s13, i, i-1, month, i-1);
			}
			
			else{
				SqlOpsforExcelGen.coordinate_monthly(conn, wb, row, cell, sp, s11, i, i-1, month, month);
			}
		}
		
		//=SUM(C7:N7)
		int y = sp.getLastRowNum(); 
		for(int i = 6; i <= y; i++){
			row = sp.getRow(i);
			int f = i+1; 
			
			cell = row.createCell(14);
			cell.setCellFormula("SUM(C" + f + ":N" + f + ")");
			cell.setCellStyle(s11);
		}

		
	}

	public static void F6(Connection conn, XSSFWorkbook wb){
		//coordination_report PER term 
		
		//set layout --->
		
		XSSFSheet sp = wb.createSheet("CoordinatorReport-PerTerm");
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String fontface = "Calibri";
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int year = cal.get(Calendar.YEAR);
		
		String asOF = month + "/" + day + "/" + year;
		
		CellStyle s1 = wb.createCellStyle(); //TRAINING...& TITLE OF SHEET
		StyleClass.ColoredHeader(wb, s1, 10, fontface, HSSFColor.YELLOW.index, HSSFColor.BLACK.index);
		CellStyle s2 = wb.createCellStyle(); //ACAD YEAR HEADER & PER MONTH HEADER
		StyleClass.ColoredHeader(wb, s2, 10, fontface, HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s3 = wb.createCellStyle(); //AS OF HEADER
		StyleClass.ColoredHeader(wb, s3, 10, fontface, HSSFColor.PLUM.index, HSSFColor.BLACK.index);
		CellStyle s4 = wb.createCellStyle(); //MONTH 1
		StyleClass.ColoredHeaderItlcz(wb, s4, 10, fontface, HSSFColor.CORAL.index, HSSFColor.BLACK.index);
		CellStyle s5 = wb.createCellStyle(); //MONTH 2
		StyleClass.ColoredHeaderItlcz(wb, s5, 10, fontface, HSSFColor.LAVENDER.index, HSSFColor.BLACK.index);
		CellStyle s6 = wb.createCellStyle(); //MONTH 3
		StyleClass.ColoredHeaderItlcz(wb, s6, 9, fontface, HSSFColor.LIGHT_BLUE.index, HSSFColor.BLACK.index);
		CellStyle s7 = wb.createCellStyle(); //TITLE HEADER
		StyleClass.ColoredHeader(wb, s7, 10, fontface, HSSFColor.GREY_25_PERCENT.index, HSSFColor.BLACK.index);
		CellStyle s8 = wb.createCellStyle(); //CONTENT
		StyleClass.Content(wb, s8, HSSFColor.BLACK.index, 9, fontface);
		CellStyle s9 = wb.createCellStyle(); //per header
		StyleClass.ColoredHeaderItlcz(wb, s9, 11, "Courier New", HSSFColor.BLACK.index, HSSFColor.WHITE.index);;
		CellStyle s10 = wb.createCellStyle(); //per header
		StyleClass.ColoredContent(wb, s10, HSSFColor.RED.index, HSSFColor.BLACK.index, 9, fontface);;
		
		sp.addMergedRegion(new CellRangeAddress(0,0,0,5));
		sp.addMergedRegion(new CellRangeAddress(1,1,0,5));
		sp.addMergedRegion(new CellRangeAddress(2,2,0,5));
		sp.addMergedRegion(new CellRangeAddress(3,3,0,5));
		sp.addMergedRegion(new CellRangeAddress(4,4,0,1));
		
		row = sp.createRow(0); //-->
		
		cell = row.createCell(0);
		cell.setCellValue("TRAINING REGISTRATION AND ATTENDANCE MONITORING SHEET");
		cell.setCellStyle(s1);
		
		row = sp.createRow(1);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("ACADEMIC YEAR");
		cell.setCellStyle(s2);
		
		row = sp.createRow(2);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("COORDINATOR - SESSION FACILITATED COUNT");
		cell.setCellStyle(s1);
		
		row = sp.createRow(3);
		
		cell = row.createCell(0);
		cell.setCellValue("AS OF " + asOF); //insert java get date here
		cell.setCellStyle(s3);
		
		row = sp.createRow(4);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("P E R  T E R M  R E P O R T");
		cell.setCellStyle(s9);
		
		cell = row.createCell(2);
		cell.setCellValue("FIRST TERM");
		cell.setCellStyle(s4);
		
		cell = row.createCell(3);
		cell.setCellValue("SECOND TERM");
		cell.setCellStyle(s5);
		
		cell = row.createCell(4);
		cell.setCellValue("THIRD TERM");
		cell.setCellStyle(s6);
		
		cell = row.createCell(5);
		cell.setCellValue("TOTAL");
		cell.setCellStyle(s9);
		
		sp.setColumnWidth(0, 8500);
		sp.setColumnWidth(1, 7000);
		for(int i = 2; i <= 13; i++){
			sp.setColumnWidth(i, 5500);
		}
		
		row = sp.createRow(5);
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY NAME");
		cell.setCellStyle(s7);
		
		cell = row.createCell(1);
		cell.setCellValue("COLLEGE");
		cell.setCellStyle(s7);
		
		for(int i = 2; i <= 5; i++){
			cell = row.createCell(i);
			cell.setCellValue("FACILITATED SESSIONS");
			cell.setCellStyle(s7);
		}
		// <--- set layout
		
		SqlOpsforExcelGen.coordinator(conn, wb, sp, row, cell, s8);
		
		if(month > 7 && month < 7){
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s8, 2, 8, 12, month, 7);
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s10, 3, 1, 5, 7,month);
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s10, 4, 6, 7, 7,month);
		}
		else if(month < 6){
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s8, 2, 8, 12, 6, month);
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s8, 3, 1, 5, 6, month);
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s10, 4, 6, 7,month,6);
		}
		else if(month == 6 || month == 7){
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s8, 2, 8, 12, 7,6);
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s8, 3, 1, 5,7,6);
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s8, 4, 6, 7,7,6);
		}
		int y = sp.getLastRowNum(); 
		for(int i = 6; i <= y; i++){
			row = sp.getRow(i);
			int f = i+1; 
			
			cell = row.createCell(5);
			cell.setCellFormula("SUM(C" + f + ":E" + f + ")");
			cell.setCellStyle(s8);
		}

	}
	
	public static void F7(Connection conn, XSSFWorkbook wb){
		//coordination_report PER MONTH 
		
		//set layout --->
		
		XSSFSheet sp = wb.createSheet("CoordinatorReport-CurrentTerm");
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String fontface = "Calibri";
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int year = cal.get(Calendar.YEAR);
		
		String asOF = month + "/" + day + "/" + year;
		
		CellStyle s1 = wb.createCellStyle(); //TRAINING...& TITLE OF SHEET
		StyleClass.ColoredHeader(wb, s1, 10, fontface, HSSFColor.YELLOW.index, HSSFColor.BLACK.index);
		CellStyle s2 = wb.createCellStyle(); //ACAD YEAR HEADER & PER MONTH HEADER
		StyleClass.ColoredHeader(wb, s2, 10, fontface, HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s3 = wb.createCellStyle(); //AS OF HEADER
		StyleClass.ColoredHeader(wb, s3, 10, fontface, HSSFColor.PLUM.index, HSSFColor.BLACK.index);
		CellStyle s4 = wb.createCellStyle(); //MONTH 1
		StyleClass.ColoredHeaderItlcz(wb, s4, 10, fontface, HSSFColor.LIGHT_GREEN.index, HSSFColor.BLACK.index);
		CellStyle s5 = wb.createCellStyle(); //TITLE HEADER
		StyleClass.ColoredHeader(wb, s5, 10, fontface, HSSFColor.GREY_25_PERCENT.index, HSSFColor.BLACK.index);
		CellStyle s6 = wb.createCellStyle(); //CONTENT
		StyleClass.Content(wb, s6, HSSFColor.BLACK.index, 9, fontface);
		CellStyle s7 = wb.createCellStyle(); //per header
		StyleClass.ColoredHeaderItlcz(wb, s7, 11, "Courier New", HSSFColor.BLACK.index, HSSFColor.WHITE.index);;
		
		sp.addMergedRegion(new CellRangeAddress(0,0,0,3));
		sp.addMergedRegion(new CellRangeAddress(1,1,0,3));
		sp.addMergedRegion(new CellRangeAddress(2,2,0,3));
		sp.addMergedRegion(new CellRangeAddress(3,3,0,3));
		sp.addMergedRegion(new CellRangeAddress(4,4,0,1));
		
		row = sp.createRow(0); //-->
		
		cell = row.createCell(0);
		cell.setCellValue("TRAINING REGISTRATION AND ATTENDANCE MONITORING SHEET");
		cell.setCellStyle(s1);
		
		row = sp.createRow(1);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("ACADEMIC YEAR");
		cell.setCellStyle(s2);
		
		row = sp.createRow(2);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("COORDINATOR - SESSION FACILITATED COUNT");
		cell.setCellStyle(s1);
		
		row = sp.createRow(3);
		
		cell = row.createCell(0);
		cell.setCellValue("AS OF " + asOF); //insert java get date here
		cell.setCellStyle(s3);
		
		row = sp.createRow(4);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("C U R R E N T  T E R M  R E P O R T");
		cell.setCellStyle(s7);
		
		cell = row.createCell(2);
		cell.setCellValue("CURRENT TERM");
		cell.setCellStyle(s4);
		
		cell = row.createCell(3);
		cell.setCellValue("TOTAL");
		cell.setCellStyle(s7);
		
		sp.setColumnWidth(0, 8500);
		sp.setColumnWidth(1, 7000);
		sp.setColumnWidth(2, 5500);
		sp.setColumnWidth(3, 5500);
		
		row = sp.createRow(5);
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY NAME");
		cell.setCellStyle(s5);
		
		cell = row.createCell(1);
		cell.setCellValue("COLLEGE");
		cell.setCellStyle(s5);
		
		for(int i = 2; i <= 3; i++){
			cell = row.createCell(i);
			cell.setCellValue("FACILITATED SESSIONS");
			cell.setCellStyle(s5);
		}
		// <--- set layout
		
		SqlOpsforExcelGen.coordinator(conn, wb, sp, row, cell, s6);
		
		if(month == 1 || month == 2 || month == 3 || month == 4 || month == 5){
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s6, 2, 1, 5,2,1);
		}
		else if(month == 8 || month == 9 || month == 10 || month == 11 || month == 12){
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s6, 2, 8, 12,2,1);
		}
		else if(month == 6 || month == 7){
			SqlOpsforExcelGen.coordinator(conn, wb, row, cell, sp, s6, 2, 6, 7,2,1);
		}
		
		//SET CELL FORMULA
		int y = sp.getLastRowNum(); 
		for(int i = 6; i <= y; i++){
			row = sp.getRow(i);
			int f = i+1; 
			
			cell = row.createCell(3);
			cell.setCellFormula("SUM(C" + f +")");
			cell.setCellStyle(s6);
		}
	}
	
	public static void F8(Connection conn, XSSFWorkbook wb){
		//coordination_report PER MONTH 
		
		//set layout --->
		
		XSSFSheet sp = wb.createSheet("CoordinatorReport-CurrentWeek");
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String fontface = "Calibri";
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int year = cal.get(Calendar.YEAR);
		
		String asOF = month + "/" + day + "/" + year;
		
		CellStyle s1 = wb.createCellStyle(); //TRAINING...& TITLE OF SHEET
		StyleClass.ColoredHeader(wb, s1, 10, fontface, HSSFColor.YELLOW.index, HSSFColor.BLACK.index);
		CellStyle s2 = wb.createCellStyle(); //ACAD YEAR HEADER & PER MONTH HEADER
		StyleClass.ColoredHeader(wb, s2, 10, fontface, HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s3 = wb.createCellStyle(); //AS OF HEADER
		StyleClass.ColoredHeader(wb, s3, 10, fontface, HSSFColor.PLUM.index, HSSFColor.BLACK.index);
		CellStyle s4 = wb.createCellStyle(); //MONTH 1
		StyleClass.ColoredHeaderItlcz(wb, s4, 10, fontface, HSSFColor.LIGHT_GREEN.index, HSSFColor.BLACK.index);
		CellStyle s5 = wb.createCellStyle(); //TITLE HEADER
		StyleClass.ColoredHeader(wb, s5, 10, fontface, HSSFColor.GREY_25_PERCENT.index, HSSFColor.BLACK.index);
		CellStyle s6 = wb.createCellStyle(); //CONTENT
		StyleClass.Content(wb, s6, HSSFColor.BLACK.index, 9, fontface);
		CellStyle s7 = wb.createCellStyle(); //per header
		StyleClass.ColoredHeaderItlcz(wb, s7, 11, "Courier New", HSSFColor.BLACK.index, HSSFColor.WHITE.index);;
		
		sp.addMergedRegion(new CellRangeAddress(0,0,0,3));
		sp.addMergedRegion(new CellRangeAddress(1,1,0,3));
		sp.addMergedRegion(new CellRangeAddress(2,2,0,3));
		sp.addMergedRegion(new CellRangeAddress(3,3,0,3));
		sp.addMergedRegion(new CellRangeAddress(4,4,0,1));
		
		row = sp.createRow(0); //-->
		
		cell = row.createCell(0);
		cell.setCellValue("TRAINING REGISTRATION AND ATTENDANCE MONITORING SHEET");
		cell.setCellStyle(s1);
		
		row = sp.createRow(1);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("ACADEMIC YEAR");
		cell.setCellStyle(s2);
		
		row = sp.createRow(2);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("COORDINATOR - SESSION FACILITATED COUNT");
		cell.setCellStyle(s1);
		
		row = sp.createRow(3);
		
		cell = row.createCell(0);
		cell.setCellValue("AS OF " + asOF); //insert java get date here
		cell.setCellStyle(s3);
		
		row = sp.createRow(4);//-->
		
		cell = row.createCell(0);
		cell.setCellValue("C U R R E N T  W E E K  R E P O R T");
		cell.setCellStyle(s7);
		
		cell = row.createCell(2);
		cell.setCellValue("CURRENT WEEK");
		cell.setCellStyle(s4);
		
		cell = row.createCell(3);
		cell.setCellValue("TOTAL");
		cell.setCellStyle(s7);
		
		sp.setColumnWidth(0, 8500);
		sp.setColumnWidth(1, 7000);
		sp.setColumnWidth(2, 5500);
		sp.setColumnWidth(3, 5500);
		
		row = sp.createRow(5);
		
		cell = row.createCell(0);
		cell.setCellValue("FACULTY NAME");
		cell.setCellStyle(s5);
		
		cell = row.createCell(1);
		cell.setCellValue("COLLEGE");
		cell.setCellStyle(s5);
		
		for(int i = 2; i <= 3; i++){
			cell = row.createCell(i);
			cell.setCellValue("FACILITATED SESSIONS");
			cell.setCellStyle(s5);
		}
		// <--- set layout
		
		cal.setTime(date);
		
		int exactDate = cal.get(Calendar.DATE);
		int weekDate = 0;
		int dayZ = cal.get(Calendar.DAY_OF_WEEK);
		
		switch(dayZ){
			case 1:
				weekDate = exactDate + 7;
				break;
			case 2:
				weekDate = exactDate + 6;
				break;
			case 3:
				weekDate = exactDate + 5;
				break;
			case 4:
				weekDate = exactDate + 4;
				break;
			case 5:
				weekDate = exactDate + 3;
				break;
			case 6:
				weekDate = exactDate + 2;
				break;
			case 7:
				weekDate = exactDate + 1;
				break;
		}
		
		SqlOpsforExcelGen.coordinator(conn, wb, sp, row, cell, s6);
		SqlOpsforExcelGen.coordinate_weekly(conn, wb, row, cell, sp, s6, 2, month, exactDate, weekDate);
		
		
		//SET CELL FORMULA
				int y = sp.getLastRowNum(); 
				for(int i = 6; i <= y; i++){
					row = sp.getRow(i);
					int f = i+1; 
					
					cell = row.createCell(3);
					cell.setCellFormula("SUM(C" + f + ")");
					cell.setCellStyle(s6);
				}		
	}
	
	public static void Sem_Ses_Record(Connection conn, XSSFWorkbook monthSh, String month, String sheetName, int monthNum){
		XSSFSheet spst = monthSh.createSheet(sheetName);
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String fontface = "Calibri";
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int monthZ = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int year = cal.get(Calendar.YEAR);
		
		String asOF = monthZ + "/" + day + "/" + year;
		
		CellStyle s1 = monthSh.createCellStyle(); //HEADER 
		StyleClass.ColoredHeader(monthSh, s1, 11, fontface, HSSFColor.YELLOW.index, HSSFColor.BLACK.index);
		CellStyle s2 = monthSh.createCellStyle(); //SEMESTER HEADER 
		StyleClass.ColoredHeader(monthSh, s2, 11, fontface, HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s3 = monthSh.createCellStyle(); //TITLE HEADER
		StyleClass.ColoredHeader(monthSh, s3, 10, fontface, HSSFColor.GREY_25_PERCENT.index, HSSFColor.BLACK.index);
		CellStyle s4 = monthSh.createCellStyle(); //AS OF HEADER
		StyleClass.ColoredHeader(monthSh, s4, 10, fontface, HSSFColor.PLUM.index, HSSFColor.BLACK.index);
		CellStyle s5 = monthSh.createCellStyle(); //CONTENT
		StyleClass.Content(monthSh, s5, HSSFColor.BLACK.index, 9, fontface);
		
		spst.addMergedRegion(new CellRangeAddress(0,0,0,7));
		spst.addMergedRegion(new CellRangeAddress(1,1,0,7));
		spst.addMergedRegion(new CellRangeAddress(2,2,0,7));
		spst.addMergedRegion(new CellRangeAddress(3,3,0,7));
		
		row = spst.createRow(0); //
		
		cell = row.createCell(0); 
		cell.setCellValue("TRAINING REGISTRATION AND ATTENDANCE MONITORING SHEET");
		cell.setCellStyle(s1);
		
		row = spst.createRow(1); //
		
		cell = row.createCell(0);
		cell.setCellValue("MONTH OF " + month);
		cell.setCellStyle(s2);
		
		row = spst.createRow(2); //
		
		cell = row.createCell(0);
		cell.setCellValue("SEMINAR-SESSION RECORDS");
		cell.setCellStyle(s1);
		
		row = spst.createRow(3); //
		
		cell = row.createCell(0);
		cell.setCellValue("AS OF " + asOF);
		cell.setCellStyle(s4);
		
		row = spst.createRow(4); //
		
		cell = row.createCell(0);
		cell.setCellValue("COLLEGE");
		cell.setCellStyle(s3);
		
		cell = row.createCell(1);
		cell.setCellValue("DATE");
		cell.setCellStyle(s3);
		
		cell = row.createCell(2);
		cell.setCellValue("SEMINAR NAME");
		cell.setCellStyle(s3);
		cell = row.createCell(3);
		cell.setCellValue("SESSION NAME");
		cell.setCellStyle(s3);
		
		cell = row.createCell(4);
		cell.setCellValue("VENUE NAME");
		cell.setCellStyle(s3);
		
		cell = row.createCell(5);
		cell.setCellValue("STATUS");
		cell.setCellStyle(s3);
		
		cell = row.createCell(6);
		cell.setCellValue("CAPACITY");
		cell.setCellStyle(s3);
		
		cell = row.createCell(7);
		cell.setCellValue("ATTENDEES");
		cell.setCellStyle(s3);
		
		SqlOpsforExcelGen.session_seminar_permonth(conn, monthSh, row, cell, spst, s5, monthNum);
		SqlOpsforExcelGen.attendee_count(conn, monthSh, row, cell, spst, s5, 7, monthNum);
		
		spst.setColumnWidth(0, 8500);
		spst.setColumnWidth(1, 3000);
		spst.setColumnWidth(2, 8500);
		spst.setColumnWidth(3, 8500);
		spst.setColumnWidth(4, 8000);
		spst.setColumnWidth(5, 4000);
		spst.setColumnWidth(6, 4000);
		spst.setColumnWidth(7, 4000);
	}	
	
	public static void Sem_Ses_Record_term(Connection conn, XSSFWorkbook monthSh){
		XSSFSheet spst = monthSh.createSheet("Seminar & Session-Per Term");
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String fontface = "Calibri";
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int monthZ = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		int year = cal.get(Calendar.YEAR);
		
		String asOF = monthZ + "/" + day + "/" + year;
		
		CellStyle s1 = monthSh.createCellStyle(); //HEADER 
		StyleClass.ColoredHeader(monthSh, s1, 11, fontface, HSSFColor.YELLOW.index, HSSFColor.BLACK.index);
		CellStyle s2 = monthSh.createCellStyle(); //SEMESTER HEADER 
		StyleClass.ColoredHeader(monthSh, s2, 11, fontface, HSSFColor.BLACK.index, HSSFColor.WHITE.index);
		CellStyle s3 = monthSh.createCellStyle(); //TITLE HEADER
		StyleClass.ColoredHeader(monthSh, s3, 10, fontface, HSSFColor.GREY_25_PERCENT.index, HSSFColor.BLACK.index);
		CellStyle s4 = monthSh.createCellStyle(); //AS OF HEADER
		StyleClass.ColoredHeader(monthSh, s4, 10, fontface, HSSFColor.PLUM.index, HSSFColor.BLACK.index);
		CellStyle s5 = monthSh.createCellStyle(); //CONTENT
		StyleClass.Content(monthSh, s5, HSSFColor.BLACK.index, 9, fontface);
		CellStyle s7 = monthSh.createCellStyle(); //1st 
		StyleClass.ColoredHeader(monthSh, s7, 11, fontface, HSSFColor.LIGHT_GREEN.index, HSSFColor.BLACK.index);
		CellStyle s8 = monthSh.createCellStyle(); //2nd
		StyleClass.ColoredHeader(monthSh, s8, 10, fontface, HSSFColor.LIGHT_CORNFLOWER_BLUE.index, HSSFColor.BLACK.index);
		CellStyle s9 = monthSh.createCellStyle(); //3rd
		StyleClass.ColoredHeader(monthSh, s9, 10, fontface, HSSFColor.LAVENDER.index, HSSFColor.BLACK.index);
		CellStyle s10 = monthSh.createCellStyle(); //not available
		StyleClass.ColoredContent(monthSh, s10, HSSFColor.RED.index, HSSFColor.BLACK.index, 9, fontface);
		
		spst.addMergedRegion(new CellRangeAddress(0,0,0,23));
		spst.addMergedRegion(new CellRangeAddress(1,1,0,23));
		spst.addMergedRegion(new CellRangeAddress(2,2,0,23));
		spst.addMergedRegion(new CellRangeAddress(3,3,0,23));
		spst.addMergedRegion(new CellRangeAddress(4,4,0,7));
		spst.addMergedRegion(new CellRangeAddress(4,4,8,15));
		spst.addMergedRegion(new CellRangeAddress(4,4,16,23));
		
		row = spst.createRow(0); //
		
		cell = row.createCell(0); 
		cell.setCellValue("TRAINING REGISTRATION AND ATTENDANCE MONITORING SHEET");
		cell.setCellStyle(s1);
		
		row = spst.createRow(1); //
		
		cell = row.createCell(0);
		cell.setCellValue("SEMINAR-SESSION RECORDS");
		cell.setCellStyle(s2);
		
		row = spst.createRow(2); //
		
		cell = row.createCell(0);
		cell.setCellValue("PER TERM RECORD");
		cell.setCellStyle(s1);
		
		row = spst.createRow(3); //
		
		cell = row.createCell(0);
		cell.setCellValue("AS OF " + asOF);
		cell.setCellStyle(s4);
		
		row = spst.createRow(4); //
		
		cell = row.createCell(0);
		cell.setCellValue("FIRST TERM");
		cell.setCellStyle(s7);
		
		cell = row.createCell(8);
		cell.setCellValue("SECOND TERM");
		cell.setCellStyle(s8);
		
		cell = row.createCell(16);
		cell.setCellValue("THIRD TERM");
		cell.setCellStyle(s9);
		
		row = spst.createRow(5); //
		
		for(int i = 0; i <= 23;){
			cell = row.createCell(i);
			cell.setCellValue("COLLEGE");
			cell.setCellStyle(s3);
			spst.setColumnWidth(i, 4500);
			
			cell = row.createCell(i+1);
			cell.setCellValue("DATE");
			cell.setCellStyle(s3);
			spst.setColumnWidth(i+1, 3500);
			
			cell = row.createCell(i+2);
			cell.setCellValue("SEMINAR NAME");
			cell.setCellStyle(s3);
			spst.setColumnWidth(i+2, 7000);
			
			cell = row.createCell(i+3);
			cell.setCellValue("SESSION NAME");
			cell.setCellStyle(s3);
			spst.setColumnWidth(i+3, 7000);
			
			cell = row.createCell(i+4);
			cell.setCellValue("VENUE NAME");
			cell.setCellStyle(s3);
			spst.setColumnWidth(i+4, 6500);
			
			cell = row.createCell(i+5);
			cell.setCellValue("STATUS");
			cell.setCellStyle(s3);
			spst.setColumnWidth(i+5, 5500);

			cell = row.createCell(i+6);
			cell.setCellValue("CAPACITY");
			cell.setCellStyle(s3);
			spst.setColumnWidth(i+6, 4500);
			
			cell = row.createCell(i+7);
			cell.setCellValue("ATTENDEES");
			cell.setCellStyle(s3);
			spst.setColumnWidth(i+7, 4500);

			i = i + 8;
		}
		
		if(monthZ > 7){
			SqlOpsforExcelGen.session_seminar(conn, monthSh, row, cell, spst, s5, 0, 8, 12);
			SqlOpsforExcelGen.session_seminar(conn, monthSh, row, cell, spst, s5, 8, 1, 5);
			SqlOpsforExcelGen.session_seminar(conn, monthSh, row, cell, spst, s5, 16, 6, 7);
			SqlOpsforExcelGen.attendee_perterm(conn, monthSh, row, cell, spst, s5, 7, 8, 12, 2,1, monthZ);
			SqlOpsforExcelGen.attendee_perterm(conn, monthSh, row, cell, spst, s10, 15, 1, 5, 1,2, monthZ);
			SqlOpsforExcelGen.attendee_perterm(conn, monthSh, row, cell, spst, s10, 23, 6, 7, 1,2, monthZ);
			
			row = spst.getRow(6);
			spst.addMergedRegion(new CellRangeAddress(6,6,8,22));
			cell = row.createCell(8);
			cell.setCellValue("NOT YET AVAILABLE");
			cell.setCellStyle(s10);
			
		}
		else if(monthZ < 6){
			SqlOpsforExcelGen.session_seminar(conn, monthSh, row, cell, spst, s5, 0, 8, 12);
			SqlOpsforExcelGen.session_seminar(conn, monthSh, row, cell, spst, s5, 8, 1, 5);
			SqlOpsforExcelGen.session_seminar(conn, monthSh, row, cell, spst, s5, 16, 6, 7);
			SqlOpsforExcelGen.attendee_perterm(conn, monthSh, row, cell, spst, s5, 7, 8, 12, 6,monthZ, monthZ);
			SqlOpsforExcelGen.attendee_perterm(conn, monthSh, row, cell, spst, s5, 15, 1, 5, 6,monthZ, monthZ);
			SqlOpsforExcelGen.attendee_perterm(conn, monthSh, row, cell, spst, s10, 23, 6, 7, monthZ,6, monthZ);
			
			row = spst.getRow(6);
			spst.addMergedRegion(new CellRangeAddress(6,6,16,22));
			cell = row.createCell(16);
			cell.setCellValue("NOT YET AVAILABLE");
			cell.setCellStyle(s10);
			
		}
		else if(monthZ == 6 || monthZ ==7){
			SqlOpsforExcelGen.session_seminar(conn, monthSh, row, cell, spst, s5, 0, 8, 12);
			SqlOpsforExcelGen.session_seminar(conn, monthSh, row, cell, spst, s5, 8, 1, 5);
			SqlOpsforExcelGen.session_seminar(conn, monthSh, row, cell, spst, s5, 16, 6, 7);
			SqlOpsforExcelGen.attendee_perterm(conn, monthSh, row, cell, spst, s5, 7, 8, 12, 2,1, monthZ);
			SqlOpsforExcelGen.attendee_perterm(conn, monthSh, row, cell, spst, s5, 15, 1, 5, 2,1, monthZ);
			SqlOpsforExcelGen.attendee_perterm(conn, monthSh, row, cell, spst, s5, 23, 6, 7, 2,1, monthZ);
		}
		
	}	
	
	public static void monthlyRecord(Connection conn, XSSFWorkbook annual){
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int month = cal.get(Calendar.MONTH) + 1;
		
		switch(month){
			case 1:
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				break;
			case 2:
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				break;
			case 3: 
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MARCH", "MARCH SEMINAR-SESSION", 3);
				break;
			case 4:
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MARCH", "MARCH SEMINAR-SESSION", 3);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "APRIL", "APRIL SEMINAR-SESSION", 4);
				break;
			case 5:
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MARCH", "MARCH SEMINAR-SESSION", 3);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "APRIL", "APRIL SEMINAR-SESSION", 4);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MAY", "MAY SEMINAR-SESSION", 5);
				break;
			case 6:
				ExcelGenerationMethods.Sem_Ses_Record_term(conn, annual);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MARCH", "MARCH SEMINAR-SESSION", 3);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "APRIL", "APRIL SEMINAR-SESSION", 4);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MAY", "MAY SEMINAR-SESSION", 5);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JUNE", "JUNE SEMINAR-SESSION", 6);
				break;
			case 7:
				ExcelGenerationMethods.Sem_Ses_Record_term(conn, annual);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MARCH", "MARCH SEMINAR-SESSION", 3);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "APRIL", "APRIL SEMINAR-SESSION", 4);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MAY", "MAY SEMINAR-SESSION", 5);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JUNE", "JUNE SEMINAR-SESSION", 6);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JULY", "JULY SEMINAR-SESSION", 7);
				break;
			case 8:
				ExcelGenerationMethods.Sem_Ses_Record_term(conn, annual);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MARCH", "MARCH SEMINAR-SESSION", 3);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "APRIL", "APRIL SEMINAR-SESSION", 4);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MAY", "MAY SEMINAR-SESSION", 5);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JUNE", "JUNE SEMINAR-SESSION", 6);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JULY", "JULY SEMINAR-SESSION", 7);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "AUGUST", "AUGUST SEMINAR-SESSION", 8);
				break;
			case 9:
				ExcelGenerationMethods.Sem_Ses_Record_term(conn, annual);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MARCH", "MARCH SEMINAR-SESSION", 3);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "APRIL", "APRIL SEMINAR-SESSION", 4);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MAY", "MAY SEMINAR-SESSION", 5);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JUNE", "JUNE SEMINAR-SESSION", 6);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JULY", "JULY SEMINAR-SESSION", 7);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "AUGUST", "AUGUST SEMINAR-SESSION", 8);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "SEPTEMBER", "SEPTEMBER SEMINAR-SESSION", 9);
				break;
			case 10:
				ExcelGenerationMethods.Sem_Ses_Record_term(conn, annual);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MARCH", "MARCH SEMINAR-SESSION", 3);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "APRIL", "APRIL SEMINAR-SESSION", 4);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MAY", "MAY SEMINAR-SESSION", 5);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JUNE", "JUNE SEMINAR-SESSION", 6);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JULY", "JULY SEMINAR-SESSION", 7);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "AUGUST", "AUGUST SEMINAR-SESSION", 8);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "SEPTEMBER", "SEPTEMBER SEMINAR-SESSION", 9);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "OCTOBER", "OCTOBER SEMINAR-SESSION", 10);
				break;
			case 11:
				ExcelGenerationMethods.Sem_Ses_Record_term(conn, annual);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MARCH", "MARCH SEMINAR-SESSION", 3);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "APRIL", "APRIL SEMINAR-SESSION", 4);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MAY", "MAY SEMINAR-SESSION", 5);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JUNE", "JUNE SEMINAR-SESSION", 6);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JULY", "JULY SEMINAR-SESSION", 7);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "AUGUST", "AUGUST SEMINAR-SESSION", 8);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "SEPTEMBER", "SEPTEMBER SEMINAR-SESSION", 9);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "OCTOBER", "OCTOBER SEMINAR-SESSION", 10);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "NOVEMBER", "NOVEMBER SEMINAR-SESSION", 11);
				break;
			case 12:
				ExcelGenerationMethods.Sem_Ses_Record_term(conn, annual);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "January", "January SEMINAR-SESSION", 1);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "February", "February SEMINAR-SESSION", 2);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MARCH", "MARCH SEMINAR-SESSION", 3);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "APRIL", "APRIL SEMINAR-SESSION", 4);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "MAY", "MAY SEMINAR-SESSION", 5);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JUNE", "JUNE SEMINAR-SESSION", 6);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "JULY", "JULY SEMINAR-SESSION", 7);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "AUGUST", "AUGUST SEMINAR-SESSION", 8);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "SEPTEMBER", "SEPTEMBER SEMINAR-SESSION", 9);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "OCTOBER", "OCTOBER SEMINAR-SESSION", 10);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "NOVEMBER", "NOVEMBER SEMINAR-SESSION", 11);
				ExcelGenerationMethods.Sem_Ses_Record(conn, annual, "DECEMBER", "DECEMBER SEMINAR-SESSION", 12);
				break;
		}
	}

	
	
}
