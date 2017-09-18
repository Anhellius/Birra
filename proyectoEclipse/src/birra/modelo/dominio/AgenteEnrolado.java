package birra.modelo.dominio;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import birra.modelo.dominioInterno.Agente;

public class AgenteEnrolado {
	
	private Agente agente;

	private List<Rol> roles;
	
	
	public AgenteEnrolado(){}
	
	public AgenteEnrolado(Agente agente, List<Rol> roles) {
		this.agente = agente;
		this.roles = roles;
	}

	public Agente getAgente() {
		return agente;
	}


	public void setAgente(Agente agente) {
		this.agente = agente;
	}

	
	public List<Rol> getRoles() {
		return roles;
	}

	public void setRoles(List<Rol> roles) {
		this.roles = roles;
	}
}
