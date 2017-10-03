package birra.modelo.fachadas;

import java.util.List;

import birra.modelo.db.PersistorHibernate;
import birra.modelo.utiles.Constantes;

public class FachadaLogin {
	
	/*public static AgenteEnrolado obtenerUsuarioPorMail(String usuarioLogin) {
		//armo dos consultas separadas, en la primera obtengo el agente con su dependencia y en la segunda los roles.
		//lo hago así porque es mucho más fácil manejar los casos en que el agente no tiene roles asignados (es un usuario de solo lectura).
		String consultaAgente = "select a "
				+ "from Agente a " 
				+ "join fetch a.dependenciaByIdDependenciaOrg depe "
				+ "join fetch depe.centroCosto cc "
				+ "where a.mail = '"+ usuarioLogin +"'";
		
		
		Agente a = (Agente)PersistorHibernate.ejecutarConsultaUnique(consultaAgente);
		
		String consultaRoles = "select distinct rol "
				+ "from Rol rol "
				+ "left join fetch rol.transicions trans "	
				+ "join rol.agentes a "
				+ "where a.mail = '"+ usuarioLogin +"'";
		
		List<Rol> roles = (List<Rol>) PersistorHibernate.ejecutarConsulta(consultaRoles);
		
		//Si no tiene ningun rol asignado en la base, es porque es un usuario tipoSolicitante, en sesion
		//guardo un rol Solicitante para que pueda realizar las acciones que podria llegar a tener como solicitante
		
		consultaRoles = "select distinct rol "
				+ "from Rol rol "
				+ "join fetch rol.transicions trans "						
				+ "where rol.idRol = "+Constantes.ROL_SOLICITANTE;
		
		Rol r =(Rol) PersistorHibernate.ejecutarConsultaUnique(consultaRoles);
		roles.add(r);		
		
		AgenteEnrolado ae = new AgenteEnrolado(a, roles);
		
		return ae;
	}	
	
	public static AgenteEnrolado obtenerUsuarioPorLegajo(int legajo) {
		//armo dos consultas separadas, en la primera obtengo el agente con su dependencia y en la segunda los roles.
		//lo hago así porque es mucho más fácil manejar los casos en que el agente no tiene roles asignados (es un usuario de solo lectura).
		String consultaAgente = "select a "
				+ "from Agente a " 
				+ "join fetch a.dependenciaByIdDependenciaOrg depe "
				+ "join fetch depe.centroCosto cc "
				+ "where a.legajo = "+ legajo;
		
		
		Agente a = (Agente)PersistorHibernate.ejecutarConsultaUnique(consultaAgente);
		
		String consultaRoles = "select distinct rol "
				+ "from Rol rol "
				+ "left join fetch rol.transicions trans "	
				+ "join rol.agentes a "
				+ "where a.legajo = "+ legajo;
		
		List<Rol> roles = (List<Rol>) PersistorHibernate.ejecutarConsulta(consultaRoles);
		
		//Si no tiene ningun rol asignado en la base, es porque es un usuario tipoSolicitante, en sesion
		//guardo un rol Solicitante para que pueda realizar las acciones que podria llegar a tener como solicitante
		
		consultaRoles = "select distinct rol "
				+ "from Rol rol "
				+ "join fetch rol.transicions trans "						
				+ "where rol.idRol = "+Constantes.ROL_SOLICITANTE;
		
		Rol r =(Rol) PersistorHibernate.ejecutarConsultaUnique(consultaRoles);
		roles.add(r);		
		
		AgenteEnrolado ae = new AgenteEnrolado(a, roles);
		
		return ae;*/
	}	
