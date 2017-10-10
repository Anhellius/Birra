package birra.modelo.tipificaciones;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Excepcion", schema = "dbo", catalog = "Excepcion")
public class ErrorExcepcion implements IPersistible {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idExcepcion;
	private String proyecto;
	private String usuario;
	private String stackCompleto;
	private String recurso;
	private String tag;
	private String header;

	
	public ErrorExcepcion(){
	}

	
	public ErrorExcepcion(String proyecto, String usuario,
			String stackCompleto, String recurso, String tag, String header) {
		
		this.proyecto = proyecto;
		this.usuario = usuario;
		this.stackCompleto = stackCompleto;
		this.recurso = recurso;
		this.tag = tag;
		this.header = header;
	}
	/**
	 * @param idExcepcion
	 * @param proyecto
	 * @param usuario
	 * @param stackCompleto
	 * @param recurso
	 * @param tag
	 */
	public ErrorExcepcion(int idExcepcion, String proyecto, String usuario,
			String stackCompleto, String recurso, String tag) {
		this.idExcepcion = idExcepcion;
		this.proyecto = proyecto;
		this.usuario = usuario;
		this.stackCompleto = stackCompleto;
		this.recurso = recurso;
		this.tag = tag;
	}


	public int getIdExcepcion() {
		return idExcepcion;
	}


	public void setIdExcepcion(int idExcepcion) {
		this.idExcepcion = idExcepcion;
	}


	public String getProyecto() {
		return proyecto;
	}


	public void setProyecto(String proyecto) {
		this.proyecto = proyecto;
	}


	public String getUsuario() {
		return usuario;
	}


	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}


	public String getStackCompleto() {
		return stackCompleto;
	}


	public void setStackCompleto(String stackCompleto) {
		this.stackCompleto = stackCompleto;
	}


	public String getRecurso() {
		return recurso;
	}


	public void setRecurso(String recurso) {
		this.recurso = recurso;
	}


	public String getTag() {
		return tag;
	}


	public void setTag(String tag) {
		this.tag = tag;
	}


	public String getHeader() {
		return header;
	}


	public void setHeader(String header) {
		this.header = header;
	}
}