package birra.modelo.dominio;

// default package
// Generated 02/10/2017 17:46:00 by Hibernate Tools 4.3.1.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

import birra.modelo.tipificaciones.IPersistible;

/**
 * Sponsor gesnerated by hbm2java
 */
@Entity
@Table(name = "categorialistado")
public class CategoriaListado implements java.io.Serializable, IPersistible {
	
	private Integer idCategoriaListado;
	private String descripcion;

	public CategoriaListado() {
	}
	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idCategoriaListado", unique = true, nullable = false)
	public Integer getIdCategoriaListado() {
		return this.idCategoriaListado;
	}

	public void setIdCategoriaListado(Integer idCategoriaListado) {
		this.idCategoriaListado = idCategoriaListado;
	}

	@Column(name = "descripcion", length = 200)
	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	

}
