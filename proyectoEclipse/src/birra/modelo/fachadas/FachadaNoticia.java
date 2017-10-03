package birra.modelo.fachadas;

import java.util.List;

import birra.modelo.db.HibernateUtil;
import birra.modelo.db.PersistorHibernate;
import birra.modelo.dominio.Categorialistado;
import birra.modelo.dominio.Categorianoticia;
import birra.modelo.dominio.Clasificado;
import birra.modelo.dominio.Imagen;
import birra.modelo.dominio.Noticia;

public class FachadaNoticia {	
	
	@SuppressWarnings("unchecked")
	public static void grabar(Noticia c) throws Exception {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			HibernateUtil.getSessionFactory().getCurrentSession().saveOrUpdate(c);
			
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			HibernateUtil.getSessionFactory().getCurrentSession().close();
			throw e;
			
		} finally {
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		}
		
	}

	public static Imagen getImagen(int idImagen) {
		// TODO Auto-generated method stub
		return null;
	}

	public static List<Noticia> getNoticias() {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			String consulta = "select Noticia c "
					+ " from Noticia";
			
			List<Noticia> cl = (List<Noticia>)HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta).list();
			
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			
			return cl;
			
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			HibernateUtil.getSessionFactory().getCurrentSession().close();
			throw e;
			
		} finally {
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		}
	}
	
	


}
