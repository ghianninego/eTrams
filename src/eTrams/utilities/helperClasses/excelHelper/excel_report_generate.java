package eTrams.utilities.helperClasses.excelHelper;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Connection;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import eTrams.utilities.databaseUtilities.*;

public class excel_report_generate{
	public static void EXCEL_GENERATE(HttpServletResponse response, Connection connection){
		try{
			response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
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
		    
		    ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
		    annual.write(outByteStream);
		    byte [] out = outByteStream.toByteArray();
		    response.setHeader("Content-Disposition", "attachment; filename=ETRAMS-REPORT.xlsx"); 
		    //if gusto niyo palitan name, pakichange nalang yung filename :))))))))))
		    
		    OutputStream outstream = response.getOutputStream();
		    outstream.write(out);
		    outstream.flush();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		finally{
			System.out.println("SUCCESS");
		}
	}
}
