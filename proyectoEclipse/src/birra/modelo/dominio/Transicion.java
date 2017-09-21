package birra.modelo.dominio;

import java.util.ArrayList;

// Generated 10/04/2017 16:13:49 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
public class Transicion implements java.io.Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idTransicion;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idEstadoFinal", nullable = false, updatable = false)	
	private Estado estadoByIdEstadoFinal;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idEstadoInicial", updatable = false)	
	private Estado estadoByIdEstadoInicial;
	
	private String descripcion;
	
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(nullable=false,name="idTransicion")
	private List<Accion> accions = new ArrayList<Accion>();	
	
	private int tipoFormulario;
	
	private boolean privativaDuenio;
	
	public Transicion() {
	}

	public Transicion(int idTransicion, Estado estadoByIdEstadoFinal,
			Estado estadoByIdEstadoInicial, String descripcion) {
		this.idTransicion = idTransicion;
		this.estadoByIdEstadoFinal = estadoByIdEstadoFinal;
		this.estadoByIdEstadoInicial = estadoByIdEstadoInicial;
		this.descripcion = descripcion;
	}

	public Transicion(int idTransicion, Estado estadoByIdEstadoFinal,
			Estado estadoByIdEstadoInicial, String descripcion, List<Accion> accions
			) {
		this.idTransicion = idTransicion;
		this.estadoByIdEstadoFinal = estadoByIdEstadoFinal;
		this.estadoByIdEstadoInicial = estadoByIdEstadoInicial;
		this.descripcion = descripcion;
		this.accions = accions;
	}
	
	public Transicion(int idTransicion) {
		this.idTransicion=idTransicion;
	}

	@Override 
	public boolean equals(Object other){
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof Transicion))
			return false;
		Transicion castOther = (Transicion) other;

		return (this.getIdTransicion() == castOther.getIdTransicion());
	}
	
	@Override
	public int hashCode() {
		int result = 17;
		result = 37 * result + this.getIdTransicion();
	    return result;
	}

	public int getIdTransicion() {
		return this.idTransicion;
	}

	public void setIdTransicion(int idTransicion) {
		this.idTransicion = idTransicion;
	}

	public Estado getEstadoByIdEstadoFinal() {
		return this.estadoByIdEstadoFinal;
	}

	public void setEstadoByIdEstadoFinal(Estado estadoByIdEstadoFinal) {
		this.estadoByIdEstadoFinal = estadoByIdEstadoFinal;
	}

	public Estado getEstadoByIdEstadoInicial() {
		return this.estadoByIdEstadoInicial;
	}

	public void setEstadoByIdEstadoInicial(Estado estadoByIdEstadoInicial) {
		this.estadoByIdEstadoInicial = estadoByIdEstadoInicial;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<Accion> getAccions() {
		return this.accions;
	}

	public void setAccions(List<Accion> accions) {
		this.accions = accions;
	}

	public int getTipoFormulario() {
		return tipoFormulario;
	}

	public void setTipoFormulario(int tipoFormulario) {
		this.tipoFormulario = tipoFormulario;
	}

	public boolean isPrivativaDuenio() {
		return privativaDuenio;
	}

	public void setPrivativaDuenio(boolean privativaDuenio) {
		this.privativaDuenio = privativaDuenio;
	}

}
