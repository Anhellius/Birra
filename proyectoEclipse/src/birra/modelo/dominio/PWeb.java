package birra.modelo.dominio;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import birra.modelo.dominioInterno.Agente;
import birra.modelo.tipificaciones.IEntidadWorkflow;
import birra.modelo.tipificaciones.IPersistible;
import birra.modelo.utiles.Constantes;

@SuppressWarnings("serial")
@Entity
@Table(name="PedidoWeb")
@DiscriminatorValue(value="1")
@PrimaryKeyJoinColumn(name="idPedido")

public class PWeb extends Pedido implements Serializable, IPersistible, IEntidadWorkflow {
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idTipoPedidoWeb", nullable = false, updatable = false)
	private TipoPedidoWeb tipoPedidoWeb;
	
	@Column(length=4000, nullable=true)
	private String comentario;
	
	@Column(length=500, nullable=true)
	private String titulo;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "legajoResponsable", nullable = true)
	private Agente responsable;
	
	public PWeb(){}
	
	public String getCampo(String name) {
		
		switch (name) {
			case "pweb.tipoPedidoWeb.idTipoPedidoWeb": return String.valueOf(this.getTipoPedidoWeb().getIdTipoPedidoWeb());
			case "pweb.comentario": return getComentario();
			case "pweb.idPedido": return String.valueOf(this.getIdPedido());
			case "pweb.titulo": return getTitulo();
			case "pweb.agente.mail": return getAgenteSolicitante().getMail();
			case "pweb.agente.nombre": return getAgenteSolicitante().getNombre();
			case "pweb.agente.apellido": return getAgenteSolicitante().getApellido();
			case "pweb.comentarioSolicitado": return getComentarioLog(Constantes.ESTADO_SOLICITADO);
			case "pweb.comentarioPasarUAT": return getComentarioLog(Constantes.ESTADO_PRUEBA_DE_USUARIO);
			case "pweb.comentarioFinalizado": return getComentarioLog(Constantes.ESTADO_FINALIZADO);
			case "pweb.estado.idEstado": return String.valueOf(this.getEstado().getIdEstado());
			case "pweb.tecnicoAsignado.legajo": return String.valueOf(this.getTecnicoAsignado().getLegajo());
			case "pweb.tecnicoAsignado.nombre": return String.valueOf(this.getTecnicoAsignado().getNombre());
			case "pweb.tecnicoAsignado.apellido": return String.valueOf(this.getTecnicoAsignado().getApellido());
			case "pweb.responsable.nombre": return getResponsable().getNombre();
			case "pweb.responsable.apellido": return getResponsable().getApellido();
			case "pweb.responsable.mail": return getResponsable().getMail();
						
		}
		return name;		
	}
	
	public String getComentarioLog(int estadoPedido) {
		// TODO Auto-generated method stub
		for  (LogPedido pLog : getLogs()) {
			if(pLog.getEstadoByIdEstadoNuevo().getIdEstado() == estadoPedido){
				if (pLog.getComentario()!= null)return pLog.getComentario();
				else return "";
			}
		}
		
		return "";
	}

	public TipoPedidoWeb getTipoPedidoWeb() {
		return tipoPedidoWeb;
	}

	public void setTipoPedidoWeb(TipoPedidoWeb tipoPedidoWeb) {
		this.tipoPedidoWeb = tipoPedidoWeb;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public Agente getResponsable() {
		return responsable;
	}

	public void setResponsable(Agente responsable) {
		this.responsable = responsable;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

}
