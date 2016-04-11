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
	
	public static String convertTime(String time){
		String[] x =time.split(":");
		String q ="";
		if(Integer.parseInt(x[0])>=12){
			if(Integer.parseInt(x[0])>12)
				x[0] = ""+(Integer.parseInt(x[0]) - 12);
			q = "pm";
		}
		else{
			q = "am";
		}
		
		if(x[0].equals("00")){
			x[0]="12";
		}
		return x[0]+":"+x[1]+" "+q;
	}
	
	
	public static String numberToStringDate(String x){
		switch(x.toUpperCase()){

			case "01":
				return "January";
			case "02":
				return "February";
			
			case "03":
				return "March";
		
			case "04":
				return "April";
			case "05":
				return "May";
				
			case "06":
				return "June";
			case "07":
				return "July";
			
			case "08":
				return "August";
			
			case "09":
				return "September";
			
			case "10":
				return "October";
			
			case "11":
				return "November";
			
			case "12":
				return "December";
			default:
				return x;
		}
	}
	
	public static String convertToStringDate(String date){
		String[] newDate = date.split("-");
		return numberToStringDate(newDate[1])+" "+newDate[2] + " " + newDate[0];
	}
	
}
