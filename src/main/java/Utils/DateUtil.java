package Utils;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateUtil {
	public static Date getDate(String dt) {
		Date d = null;
		SimpleDateFormat sd = new SimpleDateFormat("yyyy/mm/dd");
		try {
			java.util.Date d2 = sd.parse(dt);
			d = new Date(d2.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return d;
	}
	public static Date getDate2(String dt) {
		Date d = null;
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-mm-dd");
		try {
			java.util.Date d2 = sd.parse(dt);
			d = new Date(d2.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return d;
	}
}
