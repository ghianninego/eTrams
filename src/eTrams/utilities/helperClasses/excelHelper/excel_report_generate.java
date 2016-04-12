package eTrams.utilities.helperClasses.excelHelper;

import java.net.URLEncoder;
import java.sql.Connection;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import eTrams.utilities.databaseUtilities.*;

public class excel_report_generate{
	public static void EXCEL_GENERATE(HttpServletResponse response, Connection connection){
		try{
			XSSFWorkbook annual = new XSSFWorkbook();
			Connection conn = connection; //-----pakigamit yung db mo :))
			//Connection conn = DatabaseDataSource.getDBConnection();
			
			ExcelGenerationMethods.F1(conn, annual);
			ExcelGenerationMethods.F2(conn, annual);
			ExcelGenerationMethods.F3(conn, annual);
			ExcelGenerationMethods.F4(conn, annual);
			ExcelGenerationMethods.F5(conn, annual);
			ExcelGenerationMethods.F6(conn, annual);
			ExcelGenerationMethods.F7(conn, annual);
			ExcelGenerationMethods.F8(conn, annual);
			ExcelGenerationMethods.Sem_Ses_Record_term(conn, annual);
			ExcelGenerationMethods.monthlyRecord(conn, annual);
			
			response.getOutputStream();
			response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet; charset=UTF-8");
		    annual.write(response.getOutputStream());
			//annual.write(fileout);
			//fileout.close();
		    response.getOutputStream().close(); 
		    String filename = "ETRAMS_REPORT.xlsx";
		    response.setCharacterEncoding("UTF-8");
		    response.setHeader("Content-Disposition","attachment; filename="+URLEncoder.encode(filename, "UTF-8"));
			//response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");          
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		finally{
			System.out.println("SUCCESS");
		}
	}
}

