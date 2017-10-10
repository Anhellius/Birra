package birra.modelo.utiles;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public abstract class StringUtil {
	
	/**
	 * Devuelve un Date que proviene de parsear el string o nulo si el string no representa una fecha
	 * @param inString 
	 * @return un Date o nulo si el string no representa una fecha
	 */
	public static Date stringAFecha(String inString) {
		SimpleDateFormat unDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		try {
			return unDateFormat.parse(inString);
		} catch (ParseException e) {
			return null;
		}
	}
	
	public static Date stringAFecha(String inString, String patron) {
		SimpleDateFormat unDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			Date dateStr = unDateFormat.parse(inString);
			String formattedDate = unDateFormat.format(dateStr);
			
			Date fmtDate = unDateFormat.parse(formattedDate);
			unDateFormat = new SimpleDateFormat(patron);
			
			return unDateFormat.parse(unDateFormat.format(fmtDate));
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * Devuelve un String de la forma aaaa/mm/dd HH:mm:ss, para insertar en campos datetime de sql server
	 * @param inDate
	 * @return String
	 */
	public static String fechaAString(Date inDate) {
		String retval = "";

		if (inDate != null) {
			DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			retval = sdf.format(inDate);
		}

		return retval;
	}
	
	/**
	 * Devuelve un String de la forma aaaa/mm/dd HH:mm:ss, para insertar en campos datetime de sql server con seteo de Hora
	 * @param inDate
	 * @return String
	 */
	@SuppressWarnings("deprecation")
	public static String fechaAStringSetHora(Date inDate) {
		String retval = "";
		
		inDate.setHours(23);
		
		if (inDate != null) {
			DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			retval = sdf.format(inDate);
		}

		return retval;
	}
	
	public static String fechaAString(Date inDate, String patron) {
		String retval = "";

		if (inDate != null) {
			DateFormat sdf = new SimpleDateFormat(patron);
			retval = sdf.format(inDate);
		}

		return retval;
	}
	
	public static Date getFechaActualInDate() throws ParseException {
		SimpleDateFormat unDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		String retval = unDateFormat.format(new Date());
		
		return unDateFormat.parse(retval);
		
	}
	
	public static int getMesActual() {
		Calendar now = Calendar.getInstance();
		return now.get(Calendar.MONTH) + 1;
		
	}
	
	public static int getAnioActual() {
		Calendar now = Calendar.getInstance();
		return now.get(Calendar.YEAR);
		
	}

	public static String getFechaActual() {
		Calendar now = Calendar.getInstance();
		String d = (now.get(Calendar.DAY_OF_MONTH))+"/"+(now.get(Calendar.MONTH) + 1)+"/"+now.get(Calendar.YEAR);
		return d;
	}

	public static String getExtesionNombre(String fileName) {
		return fileName.substring(fileName.indexOf(".")+1,fileName.length());
	}
	
}