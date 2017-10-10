package birra.modelo.fachadas;

import java.io.File;
import java.util.List;
import java.util.Random;

import birra.modelo.db.HibernateUtil;
import birra.modelo.db.PersistorHibernate;
import birra.modelo.dominio.CategoriaListado;
import birra.modelo.dominio.CategoriaNoticia;
import birra.modelo.dominio.Clasificado;
import birra.modelo.dominio.Imagen;
import birra.modelo.dominio.Noticia;
import birra.modelo.dominio.Sponsor;
import birra.modelo.utiles.Constantes;
import birra.modelo.utiles.StringUtil;
import net.sourceforge.stripes.action.FileBean;

public class FachadaNoticia {	
	
	@SuppressWarnings("unchecked")
	public static void grabar(Noticia c, String path) throws Exception {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			HibernateUtil.getSessionFactory().getCurrentSession().saveOrUpdate(c);
			
			if (c.getImagenPrincipal() != null){			
				String dirGuardadoArchivos = path;		
				
				String nombreFinal = c.getIdNoticia()+"_principal."+StringUtil.getExtesionNombre(c.getImagenPrincipal().getFileName());
				c.getImagenPrincipal().save(new File(dirGuardadoArchivos+"/"+nombreFinal));
				
				Imagen i = new Imagen(nombreFinal,c.getImagenPrincipal().getSize(),c.getImagenPrincipal().getContentType(),Constantes.IMAGEN_N_PRINCIPAL,c);				
				
				HibernateUtil.getSessionFactory().getCurrentSession().saveOrUpdate(i);
			}
			
			if (c.getImagenesGrilla() != null){
				Random randomGenerator = new Random();
				   
				for (FileBean im : c.getImagenesGrilla()) {
					if (im!=null){
						int j=randomGenerator.nextInt(100000);
						String dirGuardadoArchivos = path;		
						
						String nombreFinal = c.getIdNoticia()+"_grilla_"+j+"."+StringUtil.getExtesionNombre(im.getFileName());
						im.save(new File(dirGuardadoArchivos+"/"+nombreFinal));
						
						Imagen i = new Imagen(nombreFinal,im.getSize(),im.getContentType(),Constantes.IMAGEN_N_GRILLA,c);				
						
						HibernateUtil.getSessionFactory().getCurrentSession().saveOrUpdate(i);
					}
				}				
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
			
			String consulta = "select c "
					+ " from Noticia c"
					+ " join fetch c.categorianoticia cl";
				
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

	public static Noticia getNoticiaPorId(int id) {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			String consulta = "select c "
					+ " from Noticia c"
					+ " join fetch c.categorianoticia d"
					+ " left join fetch c.imagens i"
					+ " where c.idNoticia = " + id;
			
			Noticia cl = (Noticia)HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta).uniqueResult();
			
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

	public static List<Noticia> getNoticiasPorIdCategoria(int id) {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			String consulta = "select c "
					+ " from Noticia c"
					+ " join fetch c.categorianoticia cl"
					+ " where cl.idCategoriaNoticia="+id;
				
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

	public static List<Noticia> getUltimasNoticias() {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			String consulta = "select c "
					+ " from Noticia c"
					+ " join fetch c.categorianoticia cl"
					+ " where publicada = 1";
				
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

	public static List<Noticia> getUltimasNoticiasPorIdCategoriayCantidad(int idCategoria, int cantidad) {
		try {
			if (!HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().isActive()) {
				HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			} else {
				HibernateUtil.getSessionFactory().getCurrentSession().clear();
			}		
			
			String consulta = "select c "
					+ " from Noticia c"
					+ " join fetch c.categorianoticia cl"					
					+ " where publicada = 1 and cl.idCategoriaNoticia="+idCategoria
					+ " order by c.fecha desc";
				
			List<Noticia> cl = (List<Noticia>)HibernateUtil.getSessionFactory().getCurrentSession().createQuery(consulta).setMaxResults(cantidad).list();
			
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
