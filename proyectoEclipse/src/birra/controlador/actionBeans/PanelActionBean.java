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

import birra.modelo.dominio.Categorialistado;
import birra.modelo.dominio.Categorianoticia;
import birra.modelo.dominio.Clasificado;
import birra.modelo.dominio.Noticia;
import birra.modelo.fachadas.FachadaCategoria;
import birra.modelo.fachadas.FachadaClasificado;
import birra.modelo.fachadas.FachadaExcepciones;
import birra.modelo.fachadas.FachadaNoticia;
import birra.modelo.tipificaciones.Combo;
import birra.modelo.tipificaciones.IEntidadWorkflow;
import birra.modelo.utiles.Constantes;

@SuppressWarnings("unused")
@UrlBinding("/miPanel")
public class PanelActionBean extends BaseActionBean {	

	private boolean sesionVencida;
	
	private Categorialistado categoriaListado;
	private Categorianoticia categoriaNoticia;
	
	private Noticia noticia;
	
	private Clasificado clasificado;
		
	@DefaultHandler
	@DontValidate
	public Resolution cargar() {	
		
		return new ForwardResolution("/pages/index.jsp");
	}
	
	
	public Resolution presentacionSolicitante() {	
	
		/*AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}*/
		try {
		//	this.listadoPedidos=FachadaPedido.getPedidosSolicitados(user,pweb);		
			return new ForwardResolution("/pages/inicioSolicitante.jsp");			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Resolution presentacionAdmin() {	
		
		/*AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}*/
		try {	
					
			return new ForwardResolution("/pages/inicioAdmin.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Resolution masInfoPedido() {	
		
	/*	AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}	*/	
	
		//this.pweb = (PWeb) FachadaPedido.getPedidoPorId(pweb.getIdPedido());
		return new ForwardResolution("/pages/pedidoMasInfo.jsp");		
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@DontValidate
	@HandlesEvent(value = "grabar")
	public Resolution grabar() throws IOException, CloneNotSupportedException {	
		JSONObject json = new JSONObject();
		try {
			if (categoriaListado!=null)
				FachadaCategoria.grabar(categoriaListado);
			if (categoriaNoticia!=null)
				FachadaCategoria.grabar(categoriaNoticia);
			if (clasificado!=null)
				FachadaClasificado.grabar(clasificado);
			if (noticia!=null)
				FachadaNoticia.grabar(noticia);
			
			json.put("success", "true");		
			
		}catch (Exception e) {
			//int idError = FachadaExcepciones.reportarExcepcion(e, getContext().getRequest().getRemoteHost(), getContext().getRequest().getHeader("User-Agent"),"s", Constantes.proyecto,"Grabar o Actualizar Pedido. Transición num:"+transicion.getIdTransicion());
			json.put("success", "false");
			json.put("mensaje", "Error de sistema. Su error es con la base de datos. Comuniquese con sistemas@inti.gob.ar");
		}
		
		return new StreamingResolution("text/html", new StringReader(json.toString()));	
	}
		
	
	
	public boolean isSesionVencida() {
		return sesionVencida;
	}

	public void setSesionVencida(boolean sesionVencida) {
		this.sesionVencida = sesionVencida;
	}
	

	public Categorialistado getCategoriaListado() {
		return categoriaListado;
	}


	public void setCategoriaListado(Categorialistado categoriaListado) {
		this.categoriaListado = categoriaListado;
	}


	public Categorianoticia getCategoriaNoticia() {
		return categoriaNoticia;
	}


	public void setCategoriaNoticia(Categorianoticia categoriaNoticia) {
		this.categoriaNoticia = categoriaNoticia;
	}


	public Noticia getNoticia() {
		return noticia;
	}


	public void setNoticia(Noticia noticia) {
		this.noticia = noticia;
	}


	public Clasificado getClasificado() {
		return clasificado;
	}


	public void setClasificado(Clasificado clasificado) {
		this.clasificado = clasificado;
	}

}
