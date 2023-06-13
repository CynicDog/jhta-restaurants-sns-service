package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	public static Date stringToDate(String stringDate) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		
		
		try { 
			Date date = dateFormat.parse(stringDate);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;  
	}
}
