package birra.modelo.fachadas;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import birra.modelo.db.HibernateUtil;
import birra.modelo.db.PersistorHibernate;
import birra.modelo.dominio.CategoriaListado;
import birra.modelo.dominio.CategoriaNoticia;
import birra.modelo.dominio.Imagen;
import birra.modelo.dominio.Noticia;

public class FachadaImagen {	

	public static CategoriaNoticia getCatNoticiaPorId(int id) {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			String consulta = "select c "
					+ " from CategoriaNoticia c"
					+ " where c.idCategoriaNoticia = " + id;
			
			CategoriaNoticia cl = (CategoriaNoticia)HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta).uniqueResult();
			
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

	public static void eliminarImagen(int id, String path) throws Exception {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			String consulta = "select i "
					+ " from Imagen i"
					+ " where i.idImagen = " + id;
			
			Imagen cl = (Imagen)HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta).uniqueResult();
			
		
			//Si no lo encuentra, no tira exception.
			Files.deleteIfExists(Paths.get(path+"/"+cl.getNombreArchivo()));
			
			HibernateUtil.getSessionFactory().getCurrentSession().delete(cl);			
			
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();			
			
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			HibernateUtil.getSessionFactory().getCurrentSession().close();
			throw e;
			
		} finally {
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		}
		
	}



}
