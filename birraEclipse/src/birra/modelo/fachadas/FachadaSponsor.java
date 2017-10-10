package birra.modelo.fachadas;

import java.io.File;
import java.util.List;
import java.util.Properties;

import birra.modelo.db.HibernateUtil;
import birra.modelo.db.PersistorHibernate;
import birra.modelo.dominio.CategoriaListado;
import birra.modelo.dominio.CategoriaNoticia;
import birra.modelo.dominio.Clasificado;
import birra.modelo.dominio.Imagen;
import birra.modelo.dominio.Sponsor;
import birra.modelo.utiles.Constantes;
import birra.modelo.utiles.StringUtil;

public class FachadaSponsor {	
	
	@SuppressWarnings("unchecked")
	public static void grabar(Sponsor c, String path) throws Exception {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}	
						
			HibernateUtil.getSessionFactory().getCurrentSession().saveOrUpdate(c);
			
			if (c.getLogo() != null){			
				String dirGuardadoArchivos = path;		
				
				String nombreFinal = c.getIdSponsor()+"_logo."+StringUtil.getExtesionNombre(c.getLogo().getFileName());
				c.getLogo().save(new File(dirGuardadoArchivos+"/"+nombreFinal));
				
				Imagen i = new Imagen(nombreFinal,c.getLogo().getSize(),c.getLogo().getContentType(),Constantes.IMAGEN_S_LOGO,c);				
				
				HibernateUtil.getSessionFactory().getCurrentSession().saveOrUpdate(i);
			}
			
			if (c.getFondo() != null){			
				String dirGuardadoArchivos = path;		
				
				String nombreFinal = c.getIdSponsor()+"_fondo."+StringUtil.getExtesionNombre(c.getFondo().getFileName());
				c.getFondo().save(new File(dirGuardadoArchivos+"/"+nombreFinal));
				System.out.println(dirGuardadoArchivos+"/"+nombreFinal);
				Imagen i = new Imagen(nombreFinal,c.getFondo().getSize(),c.getFondo().getContentType(),Constantes.IMAGEN_S_FONDO,c);				
				
				HibernateUtil.getSessionFactory().getCurrentSession().saveOrUpdate(i);
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
	
	public static List<Sponsor> getSponsors() {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			String consulta = "select c "
					+ " from Sponsor c";
			
			List<Sponsor> cl = (List<Sponsor>)HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta).list();
			
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

	public static Sponsor getPorId(int id) {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			String consulta = "select c "
					+ " from Sponsor c"
					+ " where c.idSponsor = " + id;
			
			Sponsor cl = (Sponsor)HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta).uniqueResult();
			
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

	public static void actualizarPublicada(int id, boolean publicada, String objeto) {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			String consulta = "update "+objeto+" set publicada= "+publicada
					+ " where id"+objeto+" = " + id;
			
			HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta).executeUpdate();
			
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			
			
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			HibernateUtil.getSessionFactory().getCurrentSession().close();
			throw e;
			
		} finally {
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		}
		
	}

	public static List<Sponsor> getSponsorsHabilitados() {
		// TODO Auto-generated method stub
		return null;
	}

}
