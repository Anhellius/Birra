package birra.modelo.dominio;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import birra.modelo.dominioInterno.Agente;
import birra.modelo.tipificaciones.IEntidadWorkflow;

@Entity
@Table(name="Logbirra")
public class LogPedido implements java.io.Serializable,IEntidadWorkflow {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idLog;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idEstadoViejo", nullable = true,  updatable = false)
	private Estado estadoByIdEstadoViejo;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idEstadoNuevo", nullable = true, updatable = false)
	private Estado estadoByIdEstadoNuevo;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="idPedido",nullable = true, updatable = false)
	private PWeb pedido;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false,insertable=false, updatable = false)
	private Date fecha;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "legajo", nullable = false, updatable = false)
	private Agente agente;
	
	private String comentario;
	
	@Transient
	private boolean obligadoAGrabar=false;

	public LogPedido() {
	}

	public LogPedido(int idLog, Estado estadoByIdEstadoViejo, Estado estadoByIdEstadoNuevo, PWeb pedido, Date fecha,
			Agente agente) {
		this.idLog = idLog;
		this.estadoByIdEstadoViejo = estadoByIdEstadoViejo;
		this.estadoByIdEstadoNuevo = estadoByIdEstadoNuevo;
		this.pedido = pedido;
		this.fecha = fecha;
		this.agente = agente;
	}
	
	public LogPedido(Estado estadoByIdEstadoViejo, Estado estadoByIdEstadoNuevo, PWeb pedido, Agente agente , LogPedido lp) {
		//NEGRADA PROPUESTA POR RICHARD
		if(estadoByIdEstadoViejo.getIdEstado()==0)
			estadoByIdEstadoViejo.setIdEstado(10);			
		
		this.estadoByIdEstadoViejo = estadoByIdEstadoViejo;
		this.estadoByIdEstadoNuevo = estadoByIdEstadoNuevo;
		this.pedido = pedido;
		this.agente = agente;
		
		if(lp!=null)this.comentario= lp.getComentario();
	}
	
	public LogPedido(Estado estadoByIdEstadoViejo, Estado estadoByIdEstadoNuevo, PWeb pedido) {
		this.estadoByIdEstadoViejo = estadoByIdEstadoViejo;
		this.estadoByIdEstadoNuevo = estadoByIdEstadoNuevo;
		this.pedido = pedido;
	}	

	public int getIdLog() {
		return this.idLog;
	}

	public void setIdLog(int idLog) {
		this.idLog = idLog;
	}

	public Estado getEstadoByIdEstadoViejo() {
		return this.estadoByIdEstadoViejo;
	}

	public void setEstadoByIdEstadoViejo(Estado estadoByIdEstadoViejo) {
		this.estadoByIdEstadoViejo = estadoByIdEstadoViejo;
	}

	public Estado getEstadoByIdEstadoNuevo() {
		return this.estadoByIdEstadoNuevo;
	}

	public void setEstadoByIdEstadoNuevo(Estado estadoByIdEstadoNuevo) {
		this.estadoByIdEstadoNuevo = estadoByIdEstadoNuevo;
	}

	public PWeb getPedido() {
		return this.pedido;
	}

	public void setPedido(PWeb pedido) {
		this.pedido = pedido;
	}

	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	@Override
	public int getId() {
		return this.idLog;
	}

	@Override
	public String getCampo(String name) {
		return null;
	}

	@Override
	public String getIdName() {
		return "idLog";
	}

	@Override
	public boolean getSoyManyToMany() {		
		return false;
	}

	/**
	 * @return the agente
	 */
	public Agente getAgente() {
		return agente;
	}

	/**
	 * @param agente the agente to set
	 */
	public void setAgente(Agente agente) {
		this.agente = agente;
	}

	public boolean isObligadoAGrabar() {
		return obligadoAGrabar;
	}

	public void setObligadoAGrabar(boolean obligadoAGrabar) {
		this.obligadoAGrabar = obligadoAGrabar;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

}
