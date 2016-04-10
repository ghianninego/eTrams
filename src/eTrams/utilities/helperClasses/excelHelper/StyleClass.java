package eTrams.utilities.helperClasses.excelHelper;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class StyleClass {
	//for headers with bg color
	public static void ColoredHeader(XSSFWorkbook workbook, CellStyle style, int size, String fontface, short color, short fontColor){
		XSSFFont font = workbook.createFont();
	    font.setFontName(fontface);
	    font.setColor(fontColor);
		style.setAlignment(CellStyle.ALIGN_CENTER);
	    style.setFont(font);
	    font.setFontHeightInPoints((short) size);
	    style.setFillForegroundColor(color);
	    style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	    style.setWrapText(true);
	}
	
	public static void ColoredHeaderItlcz(XSSFWorkbook workbook, CellStyle style, int size, String fontface, short color, short fontColor){
		XSSFFont font = workbook.createFont();
	    font.setFontName(fontface);
	    font.setColor(fontColor);
	    font.setBold(true);
	    font.setItalic(true);
		style.setAlignment(CellStyle.ALIGN_CENTER);
	    style.setFont(font);
	    font.setFontHeightInPoints((short) size);
	    style.setFillForegroundColor(color);
	    style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	    style.setWrapText(true);
	}
	
	public static void Header(XSSFWorkbook workbook, CellStyle style, int size, String fontface){
		XSSFFont font = workbook.createFont();
	    font.setFontName(fontface);
		style.setAlignment(CellStyle.ALIGN_CENTER);
	    style.setFont(font);
	    font.setBold(true);
	    font.setFontHeightInPoints((short) size);
	    style.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
	    style.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
	    style.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
	    style.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
	    style.setWrapText(true);
	}
	
	//contents
	public static void ColoredContent(XSSFWorkbook workbook, CellStyle style, short color, short fontcolor, int size, String fontface){
		XSSFFont font = workbook.createFont();
		font.setFontName(fontface);
		style.setAlignment(CellStyle.ALIGN_CENTER);
		style.setFont(font);
		font.setColor(fontcolor);
		font.setFontHeightInPoints((short)size);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setFillForegroundColor(color);
	    style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setDataFormat(workbook.createDataFormat().getFormat("0")); 			    		
	}	
	
	//contents
	public static void Content(XSSFWorkbook workbook, CellStyle style, short color, int size, String fontface){
		XSSFFont font = workbook.createFont();
		font.setColor(color);
	    font.setFontName(fontface);
		style.setAlignment(CellStyle.ALIGN_CENTER);
	    style.setFont(font);
	    font.setFontHeightInPoints((short)size);
	    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	    style.setDataFormat(workbook.createDataFormat().getFormat("0")); 
	    style.setWrapText(true);
	}
	
}
