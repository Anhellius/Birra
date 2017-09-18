package birra.controlador.actionBeans;
import java.util.List;

import birra.modelo.dominio.AgenteEnrolado;
import birra.modelo.dominio.Pedido;
import birra.modelo.fachadas.FachadaPedido;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;

@UrlBinding("/buscador")
public class BuscadorActionBean extends BaseActionBean {	

	private boolean sesionVencida;
	private List<Pedido> listadoPedidos;
	private Pedido pedido;
		
	
	@DefaultHandler
	@DontValidate
	public Resolution cargar() {
		AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new RedirectResolution("/login?sesionVencida=true");
		}		
		return new ForwardResolution("/pages/buscador/buscador.jsp");
		
	}
	
	public Resolution listadoBusqueda() {
		AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new RedirectResolution("/login?sesionVencida=true");
		}	
		
		listadoPedidos = FachadaPedido.getResultadoBusqueda(pedido);
		
		return new ForwardResolution("/pages/buscador/listadoBusqueda.jsp");
		
	}

	public boolean isSesionVencida() {
		return sesionVencida;
	}


	public void setSesionVencida(boolean sesionVencida) {
		this.sesionVencida = sesionVencida;
	}

	public List<Pedido> getListadoPedidos() {
		return listadoPedidos;
	}

	public void setListadoPedidos(List<Pedido> listadoPedidos) {
		this.listadoPedidos = listadoPedidos;
	}
	
	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}


}
