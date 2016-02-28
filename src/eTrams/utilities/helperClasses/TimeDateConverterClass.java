package eTrams.utilities.helperClasses;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

// rearranges the string to the desired date format for sql date
public class TimeDateConverterClass {

	public static String convertToSQLDateFormat(String date)
	{
		String result[] = date.split("/");
		String stringSQLDate = result[2] + "-" + result[0] + "-" + result[1];
		return stringSQLDate;
	}
	
	public static String convertToSQLTimeFormat(String time)
	{
	   try 
	   {
		   SimpleDateFormat displayFormat = new SimpleDateFormat("HH:mm");
		   SimpleDateFormat parseFormat = new SimpleDateFormat("hh:mm a");
		   Date date = parseFormat.parse(time);
		   return (displayFormat.format(date) + ":00");
	   } catch (ParseException e) 
	   {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return ("00:00:00");
	   }
	}
	
	
}
