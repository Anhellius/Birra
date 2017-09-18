package birra.modelo.utiles;

import java.math.BigDecimal;

public class DoubleUtil {
	
	//Redondea el valor del valor recibido a la cantidad de decimal indicado.
	public static double round(double value, int places) {
	    if (places < 0) throw new IllegalArgumentException();

	    BigDecimal bd = new BigDecimal(value);
	    bd = bd.setScale(places, BigDecimal.ROUND_HALF_UP);
	    return bd.doubleValue();
	}
}
