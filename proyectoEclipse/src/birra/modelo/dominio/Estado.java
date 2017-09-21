package birra.modelo.dominio;

// Generated 10/04/2017 16:13:49 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Estado implements java.io.Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idEstado;
	
	private String descripcion;
	
	private String classColor;
	
	@OneToMany
	@JoinColumn(name="idEstadoInicial",insertable=false,updatable=false)
	private Set<Transicion> transicionsForIdEstadoInicial = new HashSet<Transicion>(0);

	public Estado() {
	}

	public Estado(int idEstado, String descripcion) {
		this.idEstado = idEstado;
		this.descripcion = descripcion;
	}

	public Estado(int idEstado) {
		this.idEstado=idEstado;
	}

	public int getIdEstado() {
		return this.idEstado;
	}

	public void setIdEstado(int idEstado) {
		this.idEstado = idEstado;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Set<Transicion> getTransicionsForIdEstadoInicial() {
		return this.transicionsForIdEstadoInicial;
	}

	public void setTransicionsForIdEstadoInicial(
			Set<Transicion> transicionsForIdEstadoInicial) {
		this.transicionsForIdEstadoInicial = transicionsForIdEstadoInicial;
	}

	public String getClassColor() {
		return classColor;
	}

	public void setClassColor(String classColor) {
		this.classColor = classColor;
	}


}
