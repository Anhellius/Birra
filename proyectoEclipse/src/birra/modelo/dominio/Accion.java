package birra.modelo.dominio;

import java.io.IOException;

// Generated 10/04/2017 16:13:49 by Hibernate Tools 3.4.0.CR1

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.mail.MessagingException;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import birra.modelo.tipificaciones.IEntidadWorkflow;
import birra.modelo.utiles.Constantes;

@SuppressWarnings("serial")
@Entity
public class Accion implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idAccion;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idTransicion", nullable = false, insertable=false, updatable = false)
	private Transicion transicion;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idTipoAccion", nullable = false, insertable=false, updatable = false)
	private TipoAccion tipoAccion;
	
	@OneToOne(optional=true, fetch=FetchType.EAGER)
	@JoinColumn(name="idAccion")
	private Mail mail;
	
	@ManyToMany
	@JoinTable(name="RelAccionCampo" , joinColumns=@JoinColumn(name="idAccion"),
										  inverseJoinColumns = @JoinColumn(name="idCampo")
	)
	private List<Campo> campos = new ArrayList<Campo>();

	public Accion() {
	}

	public Accion(int idAccion, Transicion transicion, TipoAccion tipoAccion) {
		this.idAccion = idAccion;
		this.transicion = transicion;
		this.tipoAccion = tipoAccion;
	}

	public Accion(int idAccion, Transicion transicion, TipoAccion tipoAccion,
			Mail mail, List<Campo> campos) {
		this.idAccion = idAccion;
		this.transicion = transicion;
		this.tipoAccion = tipoAccion;
		this.mail = mail;
		this.campos = campos;
	}
	
	public void ejecutarAccion(ArrayList<IEntidadWorkflow> objPersistibles) throws IOException, MessagingException {
		switch (this.tipoAccion.getIdTipoAccion()) {
		
			case Constantes.tipoAccionEnviarMail: 
				 this.mail.ejecutar(objPersistibles);
				 break;
				 
			case Constantes.tipoAccionGrabar: 
				 new Grabar(this).ejecutar(objPersistibles); 			
			 	 break;		
		}
	}

	public int getIdAccion() {
		return this.idAccion;
	}

	public void setIdAccion(int idAccion) {
		this.idAccion = idAccion;
	}

	public Transicion getTransicion() {
		return this.transicion;
	}

	public void setTransicion(Transicion transicion) {
		this.transicion = transicion;
	}

	public TipoAccion getTipoAccion() {
		return this.tipoAccion;
	}

	public void setTipoAccion(TipoAccion tipoAccion) {
		this.tipoAccion = tipoAccion;
	}

	public Mail getMail() {
		return this.mail;
	}

	public void setMail(Mail mail) {
		this.mail = mail;
	}

	/**
	 * @return the campos
	 */
	public List<Campo> getCampos() {
		return campos;
	}

	/**
	 * @param campos the campos to set
	 */
	public void setCampos(List<Campo> campos) {
		this.campos = campos;
	}

}
