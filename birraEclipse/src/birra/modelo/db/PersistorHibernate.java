package birra.modelo.db;

// Generated 03/04/2012 16:04:19 by Hibernate Tools 3.4.0.CR1

import static org.hibernate.criterion.Example.create;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.PropertyValueException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.hibernate.type.Type;

import birra.modelo.tipificaciones.Combo;
import birra.modelo.tipificaciones.IPersistible;

public abstract class PersistorHibernate {

	private static final Log log = LogFactory.getLog(PersistorHibernate.class);
	private static final SessionFactory sessionFactory = getSessionFactory();

	protected static SessionFactory getSessionFactory() {
		try {
			return HibernateUtil.getSessionFactory();
		} catch (Exception e) {
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public static void persist(IPersistible transientInstance) throws PropertyValueException, RuntimeException {
		try {
			
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}else{
				sessionFactory.getCurrentSession().clear();
			}
			sessionFactory.getCurrentSession().persist(transientInstance);
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();
			sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();
			sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	
	@SuppressWarnings("rawtypes")
	public static List ejecutarConsulta(String consulta) throws PropertyValueException, RuntimeException {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}else{
				sessionFactory.getCurrentSession().clear();
			}
			
			Query query = sessionFactory.getCurrentSession().createQuery(consulta);
			
			List l = query.list();
			
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return l;
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();
			sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();
			sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings("rawtypes")
	public static List ejecutarConsultaSQL(String consulta, Class miClase) throws PropertyValueException, RuntimeException {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}else{
				sessionFactory.getCurrentSession().clear();
			}
			
			Query query = sessionFactory.getCurrentSession().createSQLQuery(consulta)
					.setResultTransformer(Transformers.aliasToBean(miClase));

			List l = query.list();
			
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return l;
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	/**
	 * 
	 * @param consulta El sql en formato {CALL nombreDelStoredProcedure(?,?,?,?)}
	 * @param inValores Un array de Object, donde cada elemento sea el valor de uno de los parametros
	 * @param inTipos Un array de Class, donde cada elemento sea el tipo de dato de hibernate (de los que estan en org.hibernate.type) de uno de los parametros
	 * @param tipoRetorno El Class cuyos setters seran invocados por el ResultTransformer de hibernate.
	 * @return
	 * @throws PropertyValueException
	 * @throws RuntimeException
	 */
	@SuppressWarnings("rawtypes")
	public static List ejecutarStoredProcedureSQL(String consulta, Object[] inValores, Class[] inTipos, Class tipoRetorno) throws PropertyValueException, RuntimeException {
		
		try {
			Type[] tipos = new Type[inTipos.length];
			
			try {
			
				for (int i = 0; i < inTipos.length; i++) {
						tipos[i] = (Type) inTipos[i].newInstance();
				}
				
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			
			
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}else{
				sessionFactory.getCurrentSession().clear();
			}
			
			Query query = sessionFactory.getCurrentSession().createSQLQuery(consulta)
					.setResultTransformer(Transformers.aliasToBean(tipoRetorno))
					.setParameters(inValores, tipos);
			
			List l = query.list();
			
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return l;
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings("rawtypes")
	public static Object ejecutarStoredProcedureSQLUnique(String consulta, Object[] inValores, Class[] inTipos) throws PropertyValueException, RuntimeException {
		
		try {
			Type[] tipos = new Type[inTipos.length];
			
			try {
			
				for (int i = 0; i < inTipos.length; i++) {
						tipos[i] = (Type) inTipos[i].newInstance();
				}
				
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			
			
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}else{
				sessionFactory.getCurrentSession().clear();
			}
			
			Query query = sessionFactory.getCurrentSession().createSQLQuery(consulta)
					.setParameters(inValores, tipos);
			
			Object l = query.uniqueResult();
			
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return l;		
		
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	
	public static Object ejecutarConsultaUnique(String consulta) throws PropertyValueException, RuntimeException {
		try {			
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}else{
				sessionFactory.getCurrentSession().clear();
			}
			
			Query query = sessionFactory.getCurrentSession().createQuery(consulta);
			
			Object c = query.uniqueResult();
			
			sessionFactory.getCurrentSession().getTransaction().commit();			
			
			return c;
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	public static void update(IPersistible transientInstance) throws PropertyValueException, RuntimeException {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}else{
				sessionFactory.getCurrentSession().clear();
			}
			sessionFactory.getCurrentSession().update(transientInstance);
			sessionFactory.getCurrentSession().getTransaction().commit();
			
		} catch (PropertyValueException e) {
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}

	public static IPersistible findById(int id, String tipo) throws RuntimeException {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			IPersistible instance = (IPersistible) sessionFactory.getCurrentSession().get(tipo, id);
			sessionFactory.getCurrentSession().getTransaction().commit();
			return instance;
			
		} catch (RuntimeException re) {
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	public static void saveOrUpdate(IPersistible instance) {
		try {
			
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings("rawtypes")
	public static IPersistible findByCriteria(Class e, String field, int fieldValue) {
		try {			
			
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}		
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(e);			
			IPersistible instance = (IPersistible) criteria.add(Restrictions.eq(field, fieldValue)).uniqueResult();
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return instance;
			
		} catch (RuntimeException re) {
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}

	@SuppressWarnings("unchecked")
	public static List<IPersistible> findByExample(IPersistible instance) throws RuntimeException {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			List<IPersistible> results = (List<IPersistible>) sessionFactory.getCurrentSession()
																	.createCriteria(instance.getClass())
																		.add(create(instance))
																			.list();
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return Collections.unmodifiableList(results);
			
		} catch (RuntimeException re) {
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	public static long getValorConsulta(String consulta) throws RuntimeException {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			Query q = sessionFactory.getCurrentSession().createQuery(consulta);
			long i = 0 ;
			try{
				i = (Long) q.uniqueResult();
			}catch(NullPointerException e){
				
			}			
			
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return i;			
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	public static BigDecimal getValorConsultaBigDecimal(String consulta) throws RuntimeException {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			Query q = sessionFactory.getCurrentSession().createQuery(consulta);
			BigDecimal i =  new BigDecimal(0) ;
			try{
				i = (BigDecimal) q.uniqueResult();
			}catch(NullPointerException e){
				
			}	
			
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return i;			
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	public static BigDecimal getValorConsultaSQLBigDecimal(String consulta) throws RuntimeException {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			Query q = sessionFactory.getCurrentSession().createSQLQuery(consulta);
			BigDecimal i =  new BigDecimal(0) ;
			try{
				i = (BigDecimal) q.uniqueResult();
			}catch(NullPointerException e){
				
			}			
			sessionFactory.getCurrentSession().getTransaction().commit();
			return i;			
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	public static int getValorConsultaInteger(String consulta) throws RuntimeException {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			Query q = sessionFactory.getCurrentSession().createQuery(consulta);
			int i = 0 ;
			try{
				Double p = (Double) q.uniqueResult();
				i = p.intValue();
			}catch(NullPointerException e){
				
			}			
			sessionFactory.getCurrentSession().getTransaction().commit();
			return i;			
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	public static Integer getValorConsultaSQL(String consulta) throws RuntimeException {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			Query q = sessionFactory.getCurrentSession().createSQLQuery(consulta);
			Integer i = 0 ;
			try{
				i = (Integer) q.uniqueResult();
			}catch(NullPointerException e){
				
			}			
			sessionFactory.getCurrentSession().getTransaction().commit();
			return i;			
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static List<IPersistible> getCombo(String tipo, String orderBy) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		try{
		
			Class c = Class.forName(tipo);
			IPersistible p = (IPersistible)c.newInstance();
	
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			List<IPersistible> results = (List<IPersistible>) sessionFactory.getCurrentSession()
																	.createCriteria(p.getClass())
																		.addOrder(Order.asc(orderBy))
																		.add(create(p))
																			.list();
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return Collections.unmodifiableList(results);
		} catch (Exception e) {	
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
		}
		finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static List<IPersistible> getComboV(String v) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		try{
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			/*int count = StringUtils.countMatches(v, ".");
			if (count==2)
				v=v.substring(v.indexOf(".")+1,v.lastIndexOf("."));
			else 
				v=v.substring(v.indexOf(".",v.indexOf(".")+1)+1,v.lastIndexOf("."));*/
			
			String consulta = "select * from v"+v;
			
			Query query = sessionFactory.getCurrentSession().createSQLQuery(consulta).setResultTransformer(Transformers.aliasToBean(Combo.class));					
			List<IPersistible> results = (List<IPersistible>)query.list();
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return Collections.unmodifiableList(results);
		} catch (Exception e) {	
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
		}
		finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static List<IPersistible> getComboVConID(String v, String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		try{
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			String consulta = "select * from v"+v + " where id ="+id;
			
			Query query = sessionFactory.getCurrentSession().createSQLQuery(consulta).setResultTransformer(Transformers.aliasToBean(Combo.class));					
			List<IPersistible> results = (List<IPersistible>)query.list();
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return Collections.unmodifiableList(results);
		} catch (Exception e) {	
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
		}
		finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static List<IPersistible> getCombo2(String tipo, String orderBy) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		
		try{
			Class c = Class.forName(tipo);
			IPersistible p = (IPersistible)c.newInstance();
	
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			List<IPersistible> results = (List<IPersistible>) sessionFactory.getCurrentSession()
																	.createCriteria(p.getClass())
																		.addOrder(Order.asc(orderBy))																	
																			.list();
			
			sessionFactory.getCurrentSession().getTransaction().commit();
			return Collections.unmodifiableList(results);
			
		} catch (Exception e) {	
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
		}
		finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings({ "unchecked" })
	public static List<IPersistible> getComboVista(String vista) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		try{
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from "+vista+" order by descripcion")
					.setResultTransformer(Transformers.aliasToBean(Combo.class));
			
			List<IPersistible> results = query.list();
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return Collections.unmodifiableList(results);
		} catch (Exception e) {	
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
		}
		finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings({ "unchecked" })
	public static List<IPersistible> getComboVistaOtraBase(String vista, String base , String order) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		try{
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from "+base+".dbo."+vista+" order by "+order)
					.setResultTransformer(Transformers.aliasToBean(Combo.class));
			
			List<IPersistible> results = query.list();
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return Collections.unmodifiableList(results);
			
		} catch (Exception e) {	
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
		}
		finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings({ "unchecked" })
	public static List<IPersistible> getComboVistaOtraBaseConFiltroNeg(String vista, String base , String order, String campo, Integer valor) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		try{
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from "+base+".dbo."+vista+" WHERE "+campo+" != "+valor +"  order by "+order)
					.setResultTransformer(Transformers.aliasToBean(Combo.class));
			
			List<IPersistible> results = query.list();
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return Collections.unmodifiableList(results);
		} catch (Exception e) {	
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
		}
		finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings({ "unchecked" })
	public static List<IPersistible> getComboVistaGerentes(String vista, String base , String order, String campo, Integer valor) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		try{
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			Query query = sessionFactory.getCurrentSession().createSQLQuery("select legajo, nombre from "+base+".dbo."+vista+" WHERE "+campo+" != "+valor +"  order by nivel DESC, nombre")
					.setResultTransformer(Transformers.aliasToBean(Combo.class));
			
			List<IPersistible> results = query.list();
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return Collections.unmodifiableList(results);
		} catch (Exception e) {	
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
		}
		finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	@SuppressWarnings({ "unchecked" })
	public static List<IPersistible> getComboVistaPorTipo(String vista, String campo, Integer valor) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		try{
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			List<IPersistible> results = sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM "+vista+" WHERE "+campo+" = "+valor +" ORDER BY descripcion")
					.setResultTransformer(Transformers.aliasToBean(Combo.class)).list();		
			
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return Collections.unmodifiableList(results);
		} catch (Exception e) {	
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
		}
		finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	public static boolean ejecutarConsultaBoolean(String consulta) {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			Query query = (sessionFactory.getCurrentSession().createQuery(consulta));
			
			
			return query.list().size()>0;
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}
		finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	public static boolean ejecutarConsultaSQLBoolean(String consulta) {
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			Query query = (sessionFactory.getCurrentSession().createSQLQuery(consulta));

			return query.list().size()>0;
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}
	
	public static IPersistible merge(IPersistible detachedInstance) {		
		
		try {
			if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
				sessionFactory.getCurrentSession().beginTransaction();
			}
			
			IPersistible result = (IPersistible) sessionFactory.getCurrentSession().merge(detachedInstance);
			
			sessionFactory.getCurrentSession().getTransaction().commit();
			
			return result;
			
		} catch (RuntimeException re) {
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}finally{
			sessionFactory.getCurrentSession().close();
	    }
	}

	public static void clear() {
		sessionFactory.getCurrentSession().clear();
		
	}

	
	//NO CHEQUEADAS ABAJO
	public void attachDirty(IPersistible instance) {
		log.debug("attaching dirty Proveedores instance");
		
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
			
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	@SuppressWarnings("deprecation")
	public void attachClean(IPersistible instance) {
		log.debug("attaching clean Proveedores instance");
		
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
			
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static void delete(IPersistible persistentInstance) {		
		
		try {
			sessionFactory.getCurrentSession().beginTransaction();
			sessionFactory.getCurrentSession().delete(persistentInstance);
			sessionFactory.getCurrentSession().getTransaction().commit();
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}
	}
	
	@SuppressWarnings("rawtypes")
	public static void deleteById(Class clase, int id) {
		
		if (!sessionFactory.getCurrentSession().getTransaction().isActive()){
			sessionFactory.getCurrentSession().beginTransaction();
		}else{
			sessionFactory.getCurrentSession().clear();
		}
		
		try {	
			sessionFactory.getCurrentSession().delete(sessionFactory.getCurrentSession().load(clase,id));
			sessionFactory.getCurrentSession().getTransaction().commit();
			
		} catch (PropertyValueException e) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw e;
			
		} catch (RuntimeException re) {			
			sessionFactory.getCurrentSession().getTransaction().rollback();	sessionFactory.getCurrentSession().close();
			throw re;
		}
	}

}