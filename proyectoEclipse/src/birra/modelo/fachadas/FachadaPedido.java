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
import birra.modelo.dominio.Imagen;
import birra.modelo.dominio.Noticia;
import birra.modelo.dominio.Imagen;
import birra.modelo.tipificaciones.Combo;
import birra.modelo.tipificaciones.IEntidadWorkflow;
import birra.modelo.tipificaciones.ListadoAuditoria;
import birra.modelo.utiles.Constantes;
import birra.modelo.utiles.StringUtil;

public class FachadaPedido {	
		
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
	public static Noticia getPedidoPorId(int idPedido) {		
		
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
			
			Noticia p = (Noticia) HibernateUtil.getSessionFactory().getCurrentSession().
					createQuery(consulta).
					setParameter("idPedido", idPedido).
					uniqueResult();		
			
			consulta ="select a"
					+ " From Imagen a"
					+ " where a.pedido.idPedido="+idPedido;			
					
			List<Imagen> l =(List<Imagen>)HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta).list();
						
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();			
			
			return p;
			
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			HibernateUtil.getSessionFactory().getCurrentSession().close();
			throw e;
			
		} finally {
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		}
		
	}	
	
	

	public static Imagen getImagen(int idImagen) {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()){
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			}else{
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}	

			String consulta = "select new ar.gob.inti.birra.modelo.dominio.Imagen"
					+ "(a.idImagen,a.nombreArchivo,a.mime,a.tamanio)"			
					+ " from Imagen a "				
					+ " where a.idImagen = "+ idImagen;
			
			Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta);
			
			return (Imagen) query.uniqueResult();

			
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		    throw e;
		}finally{
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		}
	}
	
	@SuppressWarnings("unchecked")
	private static void eliminarImagensFisicosPorIdPedido(int idPedido) throws IOException {
		
			String consulta = "select new ar.gob.inti.birra.modelo.dominio.Imagen"
					+ "(a.idImagen,a.nombreArchivo)"			
					+ " from Imagen a "				
					+ " where a.pedido.idPedido = "+ idPedido;
			
			Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta);
			
			List<Imagen> adBorrar = (List<Imagen>) query.list();
			
			for (Imagen i : adBorrar) {
				//i.borrarArchivoFisico(idPedido);
			}
		
	}
}
