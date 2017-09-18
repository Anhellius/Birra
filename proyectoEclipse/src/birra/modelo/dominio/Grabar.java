package birra.modelo.dominio;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import org.hibernate.Query;

import birra.modelo.db.HibernateUtil;
import birra.modelo.tipificaciones.IEntidadMM;
import birra.modelo.tipificaciones.IEntidadWorkflow;
import birra.modelo.utiles.Constantes;

public class Grabar {
	private Accion accion;
	
	public Grabar(Accion accion) {
		this.accion = accion;
	}

	public void ejecutar(ArrayList<IEntidadWorkflow> objPersistibles) throws IOException {
		for (IEntidadWorkflow obj : objPersistibles) {			
			//Solamente entra en el update si el objeto que me viene del actionBean tiene algun dato cargado
			if (obj != null) {
				
				//Levanto el nombre de la clase y tambien en mapeo, es como se llama el objeto en el mapeo de hibernate(debe ser el mismo que se guarda en Campo)
				String objeto = obj.getClass().getSimpleName();
				String mapeo = objeto.toLowerCase();
								
				boolean soyMapeoManyToMany=obj.getSoyManyToMany();
				//Si no es un objeto relacional de muchos a muchos entro aca
				if(!soyMapeoManyToMany){
				
					//Si el objeto tiene un id distinto de cero, hago el update
					if (obj.getId() != 0) {
						//Si igualmente tiene ID 0, pero estoy obligado a grabarlo, le hago un save
						if (obj.isObligadoAGrabar())HibernateUtil.getSessionFactory().getCurrentSession().save(obj);
						else{
							String update = "UPDATE " +objeto+ " " +mapeo+ " SET ";
							
							//Armo toda la lista de campos que hay que updatear, agregando solamente los que corresponden a este objeto en particular
							Iterator<Campo> i = this.getAccion().getCampos().iterator();
							boolean tieneCampoParaActualizar = false;
							while (i.hasNext()) {
								Campo campo = (Campo) i.next();
								
								if (campo != null) {
									String camp = campo.getName();
									//Si el objeto es de una lista, tengo que bajarlo a objeto, por lo que cambio el nombre del campo
									//Tomo el campo que esta desde el primer punto hasta el [], y le quito la 's'
									//Queda medio verga, pero para el caso  de lista de primer nivel sirve.
									if(camp.indexOf("[]")!=-1){
										camp = camp.substring(camp.indexOf(".")+1,camp.indexOf("[]")-1)+
													  camp.substring(camp.indexOf("[]")+2,camp.length());								
									}
									if (camp.substring(0, camp.indexOf(".")).equals(mapeo)) {
										tieneCampoParaActualizar = true;
										update += camp +" = '"+ obj.getCampo(camp) +"',";
									}
									
								}
							}
							
							//Borro la coma del último campo y agrego el where 
							update = update.substring(0, update.length() - 1);
							update += " where " +mapeo+ "."+obj.getIdName()+" = " +obj.getId();	
							
							if (tieneCampoParaActualizar){
								Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery(update);					
								query.executeUpdate();			
							}
						}
					} else {
						//id == 0 significa insert para hibernate
						HibernateUtil.getSessionFactory().getCurrentSession().save(obj);
					}
				}
				//Si es un objeto que sirve para un muchos a muchos 
				else{
					//en primera instancia, se que es un objeto que al que le voy a grabar una relacion o eliminar una relacion nada más
					//si es para grabar la rel hago algo
					IEntidadMM objMM = (IEntidadMM)obj;
					String cons = "";
					if(objMM.getAlta()){
						String aux = "";
						String aux2 = "'";
						
						for (String i : objMM.getNombresIdCompuesto()) {
							aux += i+",";
							aux2 +=obj.getCampo(i)+"','";
						}
						aux =aux.substring(0,aux.length()-1);
						aux2 =aux2.substring(0,aux2.length()-2);
						
						cons="INSERT INTO "+objeto+"("+aux+")VALUES("+aux2+")";
					}
					//si es para eliminar la rel hago otra cosa
					else{
						String aux = "";
						
						for (String i : objMM.getNombresIdCompuesto()) {
							aux += i+"="+obj.getCampo(i)+" AND ";
						}
						aux =aux.substring(0,aux.length()-4);
						
						cons="DELETE FROM "+objeto+" WHERE "+aux ;
					}
					
					Query query = HibernateUtil.getSessionFactory().getCurrentSession().createSQLQuery(cons);					
					query.executeUpdate();
					
				}
				
				/*Si se trata de un ojeto de la clase generica Adjunto, hay dos opciones o mas de guardado
				Una opcion es guardar el contenido del archivo en la base de datos, en ese caso, ignoro el objeto y se encarga la parte de abajo de persistirlo enteramente
			*/
			if(objeto.equals("Adjunto")){
				
				Adjunto aTemp = (Adjunto) obj;
				
				switch (aTemp.getTipoGuardado()){
				
					case Constantes.GUARDAR_EN_DISCO_LOCAL: 
						 aTemp.guardarAdjuntoEnDisco();
						 break;
					case Constantes.GUARDAR_EN_CONTENIDO_DB: 							
						 break;
				}
			}
				
				
			}
		}
	}
	
	/**
	 * @return the accion
	 */
	public Accion getAccion() {
		return accion;
	}

	/**
	 * @param accion the accion to set
	 */
	public void setAccion(Accion accion) {
		this.accion = accion;
	}

}
