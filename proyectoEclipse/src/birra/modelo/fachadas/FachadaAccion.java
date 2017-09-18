package birra.modelo.fachadas;

import birra.modelo.db.PersistorHibernate;
import birra.modelo.dominio.Accion;

public class FachadaAccion {	
	
	public static Accion getAccionPorIdTransicionYTipoAccion(int idTransicion, int idTipoAccion) {
		String consulta ="select a"
				+ " from Accion a"
				+ " join fetch a.campos"
				+ " join fetch a.transicion"	
				+ " where a.tipoAccion.idTipoAccion=" +idTipoAccion+ " AND a.transicion.idTransicion="+idTransicion;						
		
		return (Accion) PersistorHibernate.ejecutarConsultaUnique(consulta);
	}
}
