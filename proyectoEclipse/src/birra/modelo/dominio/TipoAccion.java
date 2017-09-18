package birra.modelo.dominio;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TipoAccion implements java.io.Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idTipoAccion;
	private String descripcion;

	public TipoAccion() {
	}

	public TipoAccion(int idTipoAccion, String descripcion) {
		this.idTipoAccion = idTipoAccion;
		this.descripcion = descripcion;
	}
	public int getIdTipoAccion() {
		return this.idTipoAccion;
	}

	public void setIdTipoAccion(int idTipoAccion) {
		this.idTipoAccion = idTipoAccion;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
}
