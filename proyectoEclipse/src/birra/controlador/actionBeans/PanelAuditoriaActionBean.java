package birra.controlador.actionBeans;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.FileBean;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.HandlesEvent;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.StreamingResolution;
import net.sourceforge.stripes.action.UrlBinding;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;

import ar.gob.inti.sirhi.modelo.dominio.Agente;
import ar.gob.inti.sirhi.modelo.fachadas.FachadaAgente;
import birra.modelo.dominio.Accion;
import birra.modelo.dominio.Adjunto;
import birra.modelo.dominio.AgenteEnrolado;
import birra.modelo.dominio.Estado;
import birra.modelo.dominio.LogPedido;
import birra.modelo.dominio.PWeb;
import birra.modelo.dominio.Pedido;
import birra.modelo.dominio.Rol;
import birra.modelo.dominio.Transicion;
import birra.modelo.fachadas.FachadaAccion;
import birra.modelo.fachadas.FachadaExcepciones;
import birra.modelo.fachadas.FachadaInterna;
import birra.modelo.fachadas.FachadaPedido;
import birra.modelo.tipificaciones.Combo;
import birra.modelo.tipificaciones.IEntidadWorkflow;
import birra.modelo.tipificaciones.ListadoAuditoria;
import birra.modelo.utiles.Constantes;

@SuppressWarnings("unused")
@UrlBinding("/miPanelAuditoria")
public class PanelAuditoriaActionBean extends BaseActionBean {	

	private boolean sesionVencida;	
	private List<ListadoAuditoria> listadoPedidos;
	private Pedido pedido;
	
	private Combo comboFecha;

		
	@DefaultHandler
	@DontValidate
	public Resolution cargar() {
		AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new RedirectResolution("/login?sesionVencida=true");
		}
		return new ForwardResolution("/pages/inicioAuditoria.jsp");
	}
	
	public Resolution listadoBusqueda() throws Exception {
		AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new RedirectResolution("/login?sesionVencida=true");
		}	
		
		listadoPedidos = FachadaPedido.getPedidosParaAuditoria(comboFecha);
		
		return new ForwardResolution("/pages/listadoAuditoria.jsp");
		
	}

	public boolean isSesionVencida() {
		return sesionVencida;
	}

	public void setSesionVencida(boolean sesionVencida) {
		this.sesionVencida = sesionVencida;
	}

	public List<ListadoAuditoria> getListadoPedidos() {
		return listadoPedidos;
	}

	public void setListadoPedidos(List<ListadoAuditoria> listadoPedidos) {
		this.listadoPedidos = listadoPedidos;
	}

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	public Combo getComboFecha() {
		return comboFecha;
	}

	public void setComboFecha(Combo comboFecha) {
		this.comboFecha = comboFecha;
	}
	
	
	

}
