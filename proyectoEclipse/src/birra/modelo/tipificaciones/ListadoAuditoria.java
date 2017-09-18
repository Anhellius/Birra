package birra.modelo.tipificaciones;

import java.util.Date;

public class ListadoAuditoria implements IPersistible{

	
	private int idPedido;
	private String tipoPedidoWeb;
	private String responsablePedido;
	private Date fechaPedido;
	private String aprobadoPor;
	private Date fechaAprobacion;
	private String responsableProduccion;
	private Date fechaPasajeProduccion;
	
	
	public ListadoAuditoria() {			
		// TODO Auto-generated constructor stub
	}


	public ListadoAuditoria(int idPedido, String tipoPedidoWeb, String responsablePedido, Date fechaPedido,
			String aprobadoPor, Date fechaAprobacion, String responsableProduccion, Date fechaPasajeProduccion) {
		super();
		this.idPedido = idPedido;
		this.tipoPedidoWeb = tipoPedidoWeb;
		this.responsablePedido = responsablePedido;
		this.fechaPedido = fechaPedido;
		this.aprobadoPor = aprobadoPor;
		this.fechaAprobacion = fechaAprobacion;
		this.responsableProduccion = responsableProduccion;
		this.fechaPasajeProduccion = fechaPasajeProduccion;
	}


	public int getIdPedido() {
		return idPedido;
	}


	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}


	public String getTipoPedidoWeb() {
		return tipoPedidoWeb;
	}


	public void setTipoPedidoWeb(String tipoPedidoWeb) {
		this.tipoPedidoWeb = tipoPedidoWeb;
	}


	public String getResponsablePedido() {
		return responsablePedido;
	}


	public void setResponsablePedido(String responsablePedido) {
		this.responsablePedido = responsablePedido;
	}


	public Date getFechaPedido() {
		return fechaPedido;
	}


	public void setFechaPedido(Date fechaPedido) {
		this.fechaPedido = fechaPedido;
	}


	public String getAprobadoPor() {
		return aprobadoPor;
	}


	public void setAprobadoPor(String aprobadoPor) {
		this.aprobadoPor = aprobadoPor;
	}


	public Date getFechaAprobacion() {
		return fechaAprobacion;
	}


	public void setFechaAprobacion(Date fechaAprobacion) {
		this.fechaAprobacion = fechaAprobacion;
	}


	public String getResponsableProduccion() {
		return responsableProduccion;
	}


	public void setResponsableProduccion(String responsableProduccion) {
		this.responsableProduccion = responsableProduccion;
	}


	public Date getFechaPasajeProduccion() {
		return fechaPasajeProduccion;
	}


	public void setFechaPasajeProduccion(Date fechaPasajeProduccion) {
		this.fechaPasajeProduccion = fechaPasajeProduccion;
	}

}
