package birra.modelo.dominio;

// Generated 10/04/2017 16:13:49 by Hibernate Tools 3.4.0.CR1

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Rol implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idRol;	
	private String descripcion;	
	private int nivelVertical;
		
	@ManyToMany
	@JoinTable(name="PoliticaDePermiso" , joinColumns=@JoinColumn(name="idRol"),
										  inverseJoinColumns = @JoinColumn(name="idTransicion")
	)
	private List<Transicion> transicions = new ArrayList<Transicion>(0);

	

	public Rol() {
	}

	public Rol(int idRol, String descripcion, int nivelVertical) {
		this.idRol = idRol;
		this.descripcion = descripcion;
		this.nivelVertical = nivelVertical;
	}

	public Rol(int idRol, String descripcion, int nivelVertical,
			List<Transicion> transicions) {
		this.idRol = idRol;
		this.descripcion = descripcion;
		this.nivelVertical = nivelVertical;
		this.transicions = transicions;
	}

	public int getIdRol() {
		return this.idRol;
	}

	

	public void setIdRol(int idRol) {
		this.idRol = idRol;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getNivelVertical() {
		return this.nivelVertical;
	}

	public void setNivelVertical(int nivelVertical) {
		this.nivelVertical = nivelVertical;
	}

	

	public List<Transicion> getTransicions() {
		return this.transicions;
	}

	public void setTransicions(List<Transicion> transicions) {
		this.transicions = transicions;
	}

}
