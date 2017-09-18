package birra.modelo.dominio;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TipoPedidoWeb implements java.io.Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idTipoPedidoWeb;	
	private String descripcion;

	public TipoPedidoWeb() {
	}

	public TipoPedidoWeb(int idTipoPedidoWeb, String descripcion) {
		this.idTipoPedidoWeb = idTipoPedidoWeb;
		this.descripcion = descripcion;
	}

	public TipoPedidoWeb(int idTipoPedidoWeb) {
		this.idTipoPedidoWeb=idTipoPedidoWeb;
	}



	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getIdTipoPedidoWeb() {
		return idTipoPedidoWeb;
	}

	public void setIdTipoPedidoWeb(int idTipoPedidoWeb) {
		this.idTipoPedidoWeb = idTipoPedidoWeb;
	}
}
