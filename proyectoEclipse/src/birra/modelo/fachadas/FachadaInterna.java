package birra.modelo.fachadas;

import birra.modelo.db.PersistorHibernate;
import birra.modelo.dominioInterno.Agente;

public class FachadaInterna {	

	public static Agente getDatosAgente(int legajo) {

		String consulta ="select a"
				+ " From Agente a"
				+ " where a.legajo = "+ legajo;			
		
		return (Agente) PersistorHibernate.ejecutarConsultaUnique(consulta);
	}	
	
	public static Agente getDatosAgente(String mail) {

		String consulta ="select a"
				+ " From Agente a"
				+ " where a.mail = '"+ mail+"'";			
		
		return (Agente) PersistorHibernate.ejecutarConsultaUnique(consulta);
	}
}
