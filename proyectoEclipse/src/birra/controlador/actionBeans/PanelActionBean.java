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
import birra.modelo.utiles.Constantes;

@SuppressWarnings("unused")
@UrlBinding("/miPanel")
public class PanelActionBean extends BaseActionBean {	

	private boolean sesionVencida;
	private int id=0;
	private String mail = "";
	private List<Pedido> listadoPedidos;
	
	private ArrayList<ArrayList<Pedido>> listaDeListasDePedidos = new ArrayList<ArrayList<Pedido>>();
	
	private ArrayList<ArrayList<Combo>> listaDeListasDeResumen = new ArrayList<ArrayList<Combo>>();
	
	private List<Adjunto> adjuntos;
	private Transicion transicion;
	private PWeb pweb;
	private Accion accion;
	private LogPedido log;
	
	private List<String> listaOpcionesMenu = new ArrayList<String>();
		
	@DefaultHandler
	@DontValidate
	public Resolution cargar() {
		AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new RedirectResolution("/login?sesionVencida=true");
		}		
		
		for (Rol r : user.getRoles()) {
				if(r.getNivelVertical()==2)listaOpcionesMenu.add(Constantes.MENU_ADMIN);
				if(r.getNivelVertical()==1)listaOpcionesMenu.add(Constantes.MENU_SOLICITANTE);
				if(r.getNivelVertical()==3)listaOpcionesMenu.add(Constantes.MENU_AUDITORIA);
		}
		
		return new ForwardResolution("/pages/index.jsp");
	}
	
	
	public Resolution presentacionSolicitante() {	
	
		AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}
		try {
			this.listadoPedidos=FachadaPedido.getPedidosSolicitados(user,pweb);		
			return new ForwardResolution("/pages/inicioSolicitante.jsp");			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Resolution presentacionAdmin() {	
		
		AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}
		try {			
			
			/**
			 * 1 - Asignados Abiertos Propios
			 * 2 - Sin Asignar
			 * 3 - Asignados Abiertos
			 * 4 - Todos
			 */
			
			listaDeListasDePedidos.add((ArrayList<Pedido>) FachadaPedido.getPedidosParaAdminTabs(user, 1));
			listaDeListasDePedidos.add((ArrayList<Pedido>) FachadaPedido.getPedidosParaAdminTabs(user, 2));
			listaDeListasDePedidos.add((ArrayList<Pedido>) FachadaPedido.getPedidosParaAdminTabs(user, 3));
			listaDeListasDePedidos.add((ArrayList<Pedido>) FachadaPedido.getPedidosParaAdminTabs(user, 4));
			
			/**
			 * 1 - General
			 * 2 - Propio
			 */
			listaDeListasDeResumen.add((ArrayList<Combo>) FachadaPedido.getResumenPedidosParaAdmin(user, 1));
			listaDeListasDeResumen.add((ArrayList<Combo>) FachadaPedido.getResumenPedidosParaAdmin(user, 2));
			
			
					
			return new ForwardResolution("/pages/inicioAdmin.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	public Resolution armadorFormulario() {	
		
		AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}
				
		
		this.accion = FachadaAccion.getAccionPorIdTransicionYTipoAccion(transicion.getIdTransicion(), Constantes.tipoAccionGrabar);
		this.pweb = (PWeb) FachadaPedido.getPedidoPorId(pweb.getIdPedido());
		
		//Segun el dato de la transi devuelvo un form distinto
		if (accion.getTransicion().getTipoFormulario()==2){
			return new ForwardResolution("/pages/formularioArmadoSmall.jsp");	
		}else{
			return new ForwardResolution("/pages/formularioArmado.jsp");	
		}
			
	}
	
	public Resolution masInfoPedido() {	
		
		AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}		
	
		this.pweb = (PWeb) FachadaPedido.getPedidoPorId(pweb.getIdPedido());
		return new ForwardResolution("/pages/pedidoMasInfo.jsp");		
	}
	
	@SuppressWarnings("unchecked")
	public Resolution existeLegajo() {	
		JSONObject json = new JSONObject();	
		AgenteEnrolado user = getAgente();
		try {
			birra.modelo.dominioInterno.Agente a = FachadaInterna.getDatosAgente(mail);		
			json.put("success", "true");
			json.put("nombre", a.getNombre()+" "+a.getApellido());
			json.put("legajo", a.getLegajo());
			
		}catch (Exception e) {
			int idError = FachadaExcepciones.reportarExcepcion(e, getContext().getRequest().getRemoteHost(), getContext().getRequest().getHeader("User-Agent"),user.getAgente().getMail(), Constantes.proyecto,"Error trayendo datos del usuario");
			json.put("success", "false");
			json.put("mensaje", "Error de sistema. Su error es el "+idError+". Comuniquese con sistemas@inti.gob.ar");
		}
		
		return new StreamingResolution("text/html", new StringReader(json.toString()));		
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@DontValidate
	@HandlesEvent(value = "grabar")
	public Resolution grabar() throws IOException, CloneNotSupportedException {	
		JSONObject json = new JSONObject();
		AgenteEnrolado user = getAgente();
				
		//todo lo que se va a eliminar
		ArrayList<IEntidadWorkflow> objsEliminables = new ArrayList();
		
		//Todo lo que se va a persistir
		ArrayList<IEntidadWorkflow> objsPersistibles = new ArrayList();
		
		//Agrego el log como persistible
	
		LogPedido lp = new LogPedido(transicion.getEstadoByIdEstadoInicial(), transicion.getEstadoByIdEstadoFinal(),pweb,user.getAgente(),log);
		
		pweb.setAgenteSolicitante(user.getAgente());
		
		objsPersistibles.add(pweb);
		objsPersistibles.add(lp);		
		
		
		//Los adjuntos los voy a tratar de grabar asi
		if (adjuntos!=null){
			adjuntos.removeAll(Collections.singleton(null));			
			for (Adjunto i : adjuntos) {	
				/***
				 * Pregunto si fb del adjunto es != null cuando no hay archivos 
				 */
				if (i.getFb()!=null)i.inicializar();
				
				i.setPedido(pweb);
				objsPersistibles.add(i);
			}
		}
		
		try {
			FachadaPedido.grabar(objsPersistibles,objsEliminables,transicion);			
			json.put("success", "true");
			json.put("idPedido", pweb.getId());			
			
		}catch (Exception e) {
			int idError = FachadaExcepciones.reportarExcepcion(e, getContext().getRequest().getRemoteHost(), getContext().getRequest().getHeader("User-Agent"),user.getAgente().getMail(), Constantes.proyecto,"Grabar o Actualizar Pedido. Transición num:"+transicion.getIdTransicion());
			json.put("success", "false");
			json.put("mensaje", "Error de sistema. Su error es el "+idError+". Comuniquese con sistemas@inti.gob.ar");
		}
		
		return new StreamingResolution("text/html", new StringReader(json.toString()));	
	}
		
	
	
	public boolean isSesionVencida() {
		return sesionVencida;
	}

	public void setSesionVencida(boolean sesionVencida) {
		this.sesionVencida = sesionVencida;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public List<Pedido> getListadoPedidos() {
		return listadoPedidos;
	}

	public void setListadoPedidos(List<Pedido> listadoPedidos) {
		this.listadoPedidos = listadoPedidos;
	}

	public Transicion getTransicion() {
		return transicion;
	}

	public void setTransicion(Transicion transicion) {
		this.transicion = transicion;
	}

	public PWeb getPweb() {
		return pweb;
	}

	public void setPweb(PWeb pweb) {
		this.pweb = pweb;
	}

	public Accion getAccion() {
		return accion;
	}

	public void setAccion(Accion accion) {
		this.accion = accion;
	}

/*	public List<FileBean> getAdjuntos() {
		return adjuntos;
	}

	public void setAdjuntos(List<FileBean> adjuntos) {
		this.adjuntos = adjuntos;
	}*/

	public List<Adjunto> getAdjuntos() {
		return adjuntos;
	}

	public void setAdjuntos(List<Adjunto> adjuntos) {
		this.adjuntos = adjuntos;
	}


	public LogPedido getLog() {
		return log;
	}


	public void setLog(LogPedido log) {
		this.log = log;
	}


	public ArrayList<ArrayList<Pedido>> getListaDeListasDePedidos() {
		return listaDeListasDePedidos;
	}


	public void setListaDeListasDePedidos(ArrayList<ArrayList<Pedido>> listaDeListasDePedidos) {
		this.listaDeListasDePedidos = listaDeListasDePedidos;
	}


	public ArrayList<ArrayList<Combo>> getListaDeListasDeResumen() {
		return listaDeListasDeResumen;
	}


	public void setListaDeListasDeResumen(ArrayList<ArrayList<Combo>> listaDeListasDeResumen) {
		this.listaDeListasDeResumen = listaDeListasDeResumen;
	}


	public List<String> getListaOpcionesMenu() {
		return listaOpcionesMenu;
	}


	public void setListaOpcionesMenu(List<String> listaOpcionesMenu) {
		this.listaOpcionesMenu = listaOpcionesMenu;
	}

}
