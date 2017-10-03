package birra.modelo.fachadas;

import java.util.List;

import birra.modelo.db.HibernateUtil;
import birra.modelo.db.PersistorHibernate;
import birra.modelo.dominio.Categorialistado;
import birra.modelo.dominio.Categorianoticia;
import birra.modelo.dominio.Sponsor;

public class FachadaSponsor {	
	
	@SuppressWarnings("unchecked")
	public static void grabar(Sponsor c) throws Exception {
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
	
	public static List<Sponsor> getSponsors() {
		// TODO Auto-generated method stub
		return null;
	}



}
