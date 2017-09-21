package birra.modelo.fachadas;

import java.util.ArrayList;
import java.util.List;

import birra.modelo.db.HibernateUtil;
import birra.modelo.tipificaciones.ErrorExcepcion;
import birra.modelo.utiles.Mail;
import birra.modelo.utiles.Mailer;

public class FachadaExcepciones {

	public static int reportarExcepcion(Exception e,String ip, String header,String usuario,String sistema, String metodo ) {
		
		String from = "sistemas@inti.gob.ar";
		String asunto = "["+sistema+"] Reporte de excepcion";		
		
		List<String> destinatarios = new ArrayList<String>();

		destinatarios.add("sistemas@inti.gob.ar");
		
		String mensaje = "Usuario: " + usuario + ", ip: "+ip+ "-  metodo:"+metodo+ " - " + sistema + ", Excepcion:"+e.getClass().getName()+",Header:"+header+"\n\n";
		String stack="";
		mensaje = mensaje.concat(e.toString() + "\n\n");
		for (StackTraceElement el : e.getStackTrace()) {
			stack = stack.concat(el.toString()+ "\n");
		}
		
		mensaje = mensaje + stack;
		
		Mail mail = new Mail(from, destinatarios, asunto,mensaje);
		//Mailer.enviarMensaje(mail);
		e.printStackTrace();
		
		ErrorExcepcion err = new ErrorExcepcion(sistema,usuario, stack,metodo,e.getClass().getName(),header); 
		int idExcepcion = 0;
		try{
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			ErrorExcepcion err2 = (ErrorExcepcion)HibernateUtil.getSessionFactory().getCurrentSession().merge(err);	
			
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			idExcepcion = err2.getIdExcepcion();			
			
		}catch (Exception k){
			k.printStackTrace();
			System.out.println("No se puede conectar para grabar el error.");
		}
		finally{
			HibernateUtil.getSessionFactory().getCurrentSession().close();
		}
		
		return idExcepcion;
	}
}