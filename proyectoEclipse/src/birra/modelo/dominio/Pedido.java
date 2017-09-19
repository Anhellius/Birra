package birra.modelo.dominio;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import birra.modelo.tipificaciones.IEntidadWorkflow;
import birra.modelo.tipificaciones.IPersistible;


@SuppressWarnings("serial")
@Entity
@Inheritance(strategy=InheritanceType.JOINED)
@DiscriminatorColumn(name="idTipoPedido",discriminatorType=DiscriminatorType.INTEGER)
public abstract class Pedido implements java.io.Serializable, IPersistible, IEntidadWorkflow {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPedido;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idEstado", nullable = false, updatable = false)
	private Estado estado;
	
	@OneToMany
	@JoinColumn(name="idPedido",nullable=true)
	private List<LogPedido> logs = new ArrayList<LogPedido>();
	
	@OneToMany
	@JoinColumn(nullable=true,name="idPedido")
	private List<Adjunto> adjuntos = new ArrayList<Adjunto>();
	
	private String telefono;
	private String mail;
	
	@Transient
	private boolean manyToMany=false;
	
	@Transient
	private boolean obligadoAGrabar=false;
	@Override
	public boolean getSoyManyToMany() {
		return manyToMany;
	}
	
	public Pedido() {
	}

	public Pedido(int idPedido, Estado estado) {
		this.idPedido = idPedido;		
		this.estado = estado;
	}
	
	public static Object deepClone(Object object) {
		   try {
		     ByteArrayOutputStream baos = new ByteArrayOutputStream();
		     ObjectOutputStream oos = new ObjectOutputStream(baos);
		     oos.writeObject(object);
		     ByteArrayInputStream bais = new ByteArrayInputStream(baos.toByteArray());
		     ObjectInputStream ois = new ObjectInputStream(bais);
		     return ois.readObject();
		   }
		   catch (Exception e) {
		     e.printStackTrace();
		     return null;
		   }
		 } 
	
	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public int getIdPedido() {
		return this.idPedido;
	}

	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}

	public Estado getEstado() {
		return this.estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	
	@Override
	public int getId() {
		
		return this.idPedido;
	}

	@Override
	public String getIdName() {
		return "idPedido";
	}	

	public boolean isObligadoAGrabar() {
		return obligadoAGrabar;
	}

	public void setObligadoAGrabar(boolean obligadoAGrabar) {
		this.obligadoAGrabar = obligadoAGrabar;
	}


	public boolean isManyToMany() {
		return manyToMany;
	}

	public void setManyToMany(boolean manyToMany) {
		this.manyToMany = manyToMany;
	}

	public List<LogPedido> getLogs() {
		return logs;
	}

	public void setLogs(List<LogPedido> logs) {
		this.logs = logs;
	}

	
	public List<Adjunto> getAdjuntos() {
		return adjuntos;
	}

	public void setAdjuntos(List<Adjunto> adjuntos) {
		this.adjuntos = adjuntos;
	}
}
