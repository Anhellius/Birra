package birra.modelo.fachadas;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import birra.modelo.db.HibernateUtil;
import birra.modelo.db.PersistorHibernate;
import birra.modelo.dominio.Accion;
import birra.modelo.dominio.Adjunto;
import birra.modelo.dominio.AgenteEnrolado;
import birra.modelo.dominio.Pedido;
import birra.modelo.dominio.Rol;
import birra.modelo.dominio.Transicion;
import birra.modelo.tipificaciones.Combo;
import birra.modelo.tipificaciones.IEntidadWorkflow;
import birra.modelo.tipificaciones.ListadoAuditoria;
import birra.modelo.utiles.Constantes;
import birra.modelo.utiles.StringUtil;

public class FachadaPedido {	
	
	@SuppressWarnings("unchecked")
	public static List<Pedido> getPedidosSolicitados(AgenteEnrolado a, Pedido pParaFiltrar) throws Exception {
				
		Set<Transicion> todosLasTransiciones =  new HashSet<Transicion>();
		
		String consulta ="select distinct p"
				+ " From Pedido p"
				+ " join fetch p.estado est"
				+ " join fetch p.tipoPedidoWeb tpw"
				+ " left join fetch p.tecnicoAsignado ta";
		
		/* Aca habria que definir los tipos de roles, usuario estandar, usuario con acciones y un super usuario. 
		 * Lo que esta hecho ahora utiliza el nivel vertical para saber que tipo de usuario es
		 * Pero falta la logica para el super usuario
		 * */
		
		String trans = "";
		
		for (Rol i : a.getRoles()) {
			if(i.getIdRol()==Constantes.ROL_SOLICITANTE){
				//Recorro todos los roles para acceder a todas las transiciones posibles que tiene ese usuario
				for (Transicion j : i.getTransicions()) {	
					trans=trans+j.getIdTransicion()+",";
					todosLasTransiciones.add(j);
				}
			}
		}
		
		//si es un usuario pete, les filtro para ver los pedidos de su centro de costo
		// si es un usuario admin nivel 2 solamente podra ver los pedidos en los cuales tienen alguna transicion en comun el pedido y el usuario logueado
		
		consulta = consulta + " left join fetch est.transicionsForIdEstadoInicial transi "
				+ " left join fetch transi.estadoByIdEstadoFinal ef "
				+ " where p.agenteSolicitante.legajo="+a.getAgente().getLegajo()
				+ " order by p.idPedido desc";
		
		List<Pedido> p = PersistorHibernate.ejecutarConsulta(consulta);
		
		//filtro las transiciones que no tiene permitidas
		for (Pedido p2 : p) {
			p2.getEstado().getTransicionsForIdEstadoInicial().retainAll(todosLasTransiciones);				
		}
		return p;
	}
	
	@SuppressWarnings({ "unchecked", "unused" })
	public static List<Pedido> getPedidosParaAdminTabs(AgenteEnrolado a,  int tabs) throws Exception {
		
		/**
		 * 1 - Asignados Abiertos Propios
		 * 2 - Sin Asignar
		 * 3 - Asignados Abiertos 
		 * 4 - Todos
		 */
		
		String filtroTabs = "";
		if (tabs == 1)filtroTabs = " where ta.legajo = "+a.getAgente().getLegajo() +" AND (est.idEstado in (2,3,6,7))  ";
		if (tabs == 2)filtroTabs = " where (est.idEstado = 1)  ";
		if (tabs == 3)filtroTabs = " where (est.idEstado in (2,3,6,7))  ";
		if (tabs == 4)filtroTabs = "";
				
		
		
		String consulta ="select distinct p"
				+ " From Pedido p"
				+ " join fetch p.estado est"
				+ " join fetch p.tipoPedidoWeb tpw"
				+ " left join fetch p.tecnicoAsignado ta"
				+ " join fetch p.agenteSolicitante ae"
				+ " join fetch ae.dependenciaByIdDependenciaOper depOp"
				+ " join fetch depOp.centroCosto cc";
				
					
		
		/* Aca habria que definir los tipos de roles, usuario estandar, usuario con acciones y un super usuario. 
		 * Lo que esta hecho ahora utiliza el nivel vertical para saber que tipo de usuario es
		 * Pero falta la logica para el super usuario
		 * */
		
		String trans = "";
		Set<Transicion> todosLasTransicionesPrivativas =  new HashSet<Transicion>();
		Set<Transicion> todosLasTransiciones =  new HashSet<Transicion>();
		for (Rol i : a.getRoles()) {	
			//Recorro todos los roles para acceder a todas las transiciones posibles que tiene ese usuario
			if(i.getIdRol()!=Constantes.ROL_SOLICITANTE){
				for (Transicion j : i.getTransicions()) {	
					todosLasTransiciones.add(j);
					if(j.isPrivativaDuenio())
						todosLasTransicionesPrivativas.add(j);
				}
			}
		}
	
	
		consulta = consulta + " left join fetch est.transicionsForIdEstadoInicial transi "
				+ " left join fetch transi.estadoByIdEstadoFinal ef "
				+filtroTabs;
	
		
		List<Pedido> p = PersistorHibernate.ejecutarConsulta(consulta);	
		
		//Aca elimino las transiciones que son solo para el Dueño o tecnico asignado. la transicion es privativa
		for (Pedido p2 : p) {			
		
			//si no soy el dueño elimino las transiciones privativas
			if(p2.getTecnicoAsignado()!=null && p2.getTecnicoAsignado().getLegajo()!=a.getAgente().getLegajo()){
				p2.getEstado().getTransicionsForIdEstadoInicial().removeAll(todosLasTransicionesPrivativas);
			}
			
			p2.getEstado().getTransicionsForIdEstadoInicial().retainAll(todosLasTransiciones);	
			
			
		}
					
		return p;
	}
	
	@SuppressWarnings("unchecked")
	public static List<ListadoAuditoria> getPedidosParaAuditoria(Combo c) throws Exception {
		
		String filtro = "";
		
		if (c != null){
			if (c.getFechaDesde()!= null && c.getFechaHasta()!= null){
				filtro = "WHERE FechaPasajeProduccion BETWEEN CONVERT(DATETIME, '" + StringUtil.fechaAString(c.getFechaDesde()) + "', 102) AND CONVERT(DATETIME, '" +StringUtil.fechaAStringSetHora(c.getFechaHasta()) + "', 102)";
			}else{
				if (c.getFechaDesde()!= null){
					filtro = "WHERE FechaPasajeProduccion BETWEEN CONVERT(DATETIME, '" + StringUtil.fechaAString(c.getFechaDesde()) + "', 102) AND CONVERT(DATETIME, '2099-01-01 00:00:00', 102)";
				}
				if (c.getFechaHasta()!= null){
					filtro = "WHERE FechaPasajeProduccion BETWEEN CONVERT(DATETIME, '1979-01-01 00:00:00', 102) AND CONVERT(DATETIME, '" +StringUtil.fechaAStringSetHora(c.getFechaHasta()) + "', 102)";
				}
			}			
		} 
		String consulta ="select * from vAuditoria "+ filtro;
		
		System.out.println(consulta);
		
		List<ListadoAuditoria> p = PersistorHibernate.ejecutarConsultaSQL(consulta, ListadoAuditoria.class);	
					
		return p;
	}
	
	
	@SuppressWarnings("unchecked")
	public static ArrayList<Combo> getResumenPedidosParaAdmin(AgenteEnrolado user, int i) {
		
		String consulta = "";
		if(i==1) consulta = " select * from vResumenGral order by ordenado";
		if(i==2) consulta = " SELECT  COUNT(idPedido) AS cantidad, 'Abiertos' AS descripcion, 1 as ordenado"
							+" FROM            dbo.Pedido AS p"
							+" WHERE     p.idEstado in(2,3,6,7) and p.legajoTecnico="+user.getAgente().getLegajo()
							+" union"
							+" SELECT        COUNT(idPedido) AS cantidad, 'UAT' AS descripcion, 2 as ordenado"
							+" FROM            dbo.Pedido AS p"
							+" WHERE     p.idEstado in(3) and p.legajoTecnico="+user.getAgente().getLegajo()
							+" union"
							+" SELECT        COUNT(idPedido) AS cantidad, 'UAT(Aprobado)' AS descripcion,3 as ordenado"
							+" FROM            dbo.Pedido AS p"
							+" WHERE     p.idEstado in(6) and p.legajoTecnico="+user.getAgente().getLegajo()
							+"  order by ordenado";
		
		
		ArrayList<Combo> p = (ArrayList<Combo>) PersistorHibernate.ejecutarConsultaSQL(consulta, Combo.class);
		return p;		
	}	
	

	private static String prepararCamposBusqueda(Pedido pParaFiltrar) {
		
		String filtro = "";
		
		if (pParaFiltrar != null){			
			
			if (pParaFiltrar.getIdPedido() != 0)
				filtro = filtro + "(p.idPedido = "+ pParaFiltrar.getIdPedido()+") AND";
			
			if (pParaFiltrar.getEstado() != null)
				filtro = filtro + " (p.estado.idEstado = "+ pParaFiltrar.getEstado().getIdEstado() +") AND";
			
			/*if (pParaFiltrar.getCentroCosto() != null)
				filtro = filtro + " (p.centroCosto.centroCosto = "+ pParaFiltrar.getCentroCosto().getCentroCosto() +") AND";
			
			if (pParaFiltrar.getOrigen() != null)
				filtro = filtro + " (p.origen.idOrigen = "+ pParaFiltrar.getOrigen().getIdOrigen() +") AND";*/
			
			
			
			filtro = filtro.substring(0,filtro.length()-4);	
		}
		
			return filtro;
	}

	public static Transicion getTransicion(int idTransicion) {
		String consulta ="select t"
				+ " From Transicion t"
				+ " left join fetch t.accions acc"
				+ " left join fetch acc.listadoCampos listadoCampos"
				+ " left join fetch listadoCampos.campo c"
				+ " where acc.tipoAccion.idTipoAccion="+Constantes.tipoAccionGrabar+" AND t.idTransicion="+idTransicion;						
		
		Transicion t = (Transicion) PersistorHibernate.ejecutarConsultaUnique(consulta);			
		
		return t;
	}

	@SuppressWarnings("unchecked")
	public static void grabar(ArrayList<IEntidadWorkflow> objetosPersistibles,ArrayList<IEntidadWorkflow> objsEliminables, Transicion t) throws Exception {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}
			
			List<Accion> acciones = (List<Accion>) HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(Accion.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).add(Restrictions.eq("transicion.idTransicion",t.getIdTransicion())).list();
			
			for (Accion a : acciones) {
				a.ejecutarAccion(objetosPersistibles);
			}
			
			if (objsEliminables!=null){
				for (IEntidadWorkflow ie : objsEliminables) {
					HibernateUtil.getSessionFactory().getCurrentSession().delete(HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(ie.getClass().getName()).add(Restrictions.eq(ie.getIdName(),ie.getId())).uniqueResult());
				}
			}
			//Si estoy en la ultima transicion, o en alguna que se borran archivos entro aca
			if(t.getIdTransicion()==Constantes.TRANSICION_QUE_BORRA_ARCHIVOS_T6 ||
					t.getIdTransicion()==Constantes.TRANSICION_QUE_BORRA_ARCHIVOS_T13 ||
					t.getIdTransicion()==Constantes.TRANSICION_QUE_BORRA_ARCHIVOS_T16
					){
				//Siempre el primer objeto es el pedido(OJO IGUAL)
				Pedido p = (Pedido)objetosPersistibles.get(0);
				FachadaPedido.eliminarAdjuntosFisicosPorIdPedido(p.getId());
			}
			
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			HibernateUtil.getSessionFactory().getCurrentSession().close();
			throw e;
			
		} finally {
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		}
		
	}


	@SuppressWarnings("unchecked")
	public static Pedido getPedidoPorId(int idPedido) {		
		
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}
			
			String consulta ="select distinct p"
					+ " From Pedido p"
					+ " join fetch p.estado est "
					+ " join fetch p.tipoPedidoWeb tpw"
					+ " left join fetch p.tecnicoAsignado ta"
					+ " join fetch p.agenteSolicitante ae"
					+ " join fetch ae.dependenciaByIdDependenciaOper depOp"
					+ " join fetch depOp.centroCosto cc"
					+ " left join fetch p.logs lg"
					+ " left join fetch lg.agente alg"
					+ " left join fetch p.responsable responsable"					
					+ " where p.idPedido = :idPedido";
			
			Pedido p = (Pedido) HibernateUtil.getSessionFactory().getCurrentSession().
					createQuery(consulta).
					setParameter("idPedido", idPedido).
					uniqueResult();		
			
			consulta ="select a"
					+ " From Adjunto a"
					+ " where a.pedido.idPedido="+idPedido;			
					
			List<Adjunto> l =(List<Adjunto>)HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta).list();
						
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			
			System.out.println(l.isEmpty());
			
			if (p!=null && l!=null)p.setAdjuntos(l);
			
			return p;
			
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			HibernateUtil.getSessionFactory().getCurrentSession().close();
			throw e;
			
		} finally {
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		}
		
	}	
	
	@SuppressWarnings("unchecked")
	public static List<Transicion> getTransicionesPorIdestado(int idEstado) {					
			String consulta ="select t "
					+ " From Transicion t"
					+ " join fetch t.estadoByIdEstadoInicial est"
					+ " where est = "+idEstado;
			
			return (List<Transicion>) PersistorHibernate.ejecutarConsulta(consulta);			
	}

	public static Adjunto getAdjunto(int idAdjunto) {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()){
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			}else{
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}	

			String consulta = "select new ar.gob.inti.birra.modelo.dominio.Adjunto"
					+ "(a.idAdjunto,a.nombreArchivo,a.mime,a.tamanio)"			
					+ " from Adjunto a "				
					+ " where a.idAdjunto = "+ idAdjunto;
			
			Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta);
			
			return (Adjunto) query.uniqueResult();

			
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		    throw e;
		}finally{
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		}
	}
	
	@SuppressWarnings("unchecked")
	private static void eliminarAdjuntosFisicosPorIdPedido(int idPedido) throws IOException {
		
			String consulta = "select new ar.gob.inti.birra.modelo.dominio.Adjunto"
					+ "(a.idAdjunto,a.nombreArchivo)"			
					+ " from Adjunto a "				
					+ " where a.pedido.idPedido = "+ idPedido;
			
			Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta);
			
			List<Adjunto> adBorrar = (List<Adjunto>) query.list();
			
			for (Adjunto i : adBorrar) {
				i.borrarArchivoFisico(idPedido);
			}
		
	}

	

	@SuppressWarnings("unchecked")
	public static List<Pedido> getResultadoBusqueda(Pedido pedido) {
		String filtro = prepararCamposBusqueda(pedido);
		
		if (filtro.length()>0)filtro= "WHERE " + filtro;
		
		String consulta ="select distinct p"
				+ " From Pedido p"
				+ " join fetch p.estado e"
				+ " join fetch p.centroCosto cc"
				+ " left join p.items pi"
				+ " left join fetch p.tipoTramite tt "
				+ filtro;				
		
		return PersistorHibernate.ejecutarConsulta(consulta);
	}


	
}
