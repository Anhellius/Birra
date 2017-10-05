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

import birra.modelo.dominio.CategoriaListado;
import birra.modelo.dominio.CategoriaNoticia;
import birra.modelo.dominio.Clasificado;
import birra.modelo.dominio.Noticia;
import birra.modelo.dominio.Sponsor;
import birra.modelo.fachadas.FachadaCategoria;
import birra.modelo.fachadas.FachadaClasificado;
import birra.modelo.fachadas.FachadaExcepciones;
import birra.modelo.fachadas.FachadaNoticia;
import birra.modelo.fachadas.FachadaSponsor;
import birra.modelo.tipificaciones.Combo;
import birra.modelo.tipificaciones.IEntidadWorkflow;
import birra.modelo.utiles.Constantes;

@SuppressWarnings("unused")
@UrlBinding("/miPanel")
public class PanelActionBean extends BaseActionBean {	

	private boolean sesionVencida;
	
	private CategoriaListado categoriaListado;
	private CategoriaNoticia categoriaNoticia;	
	private Noticia noticia;	
	private Clasificado clasificado;
	private Sponsor sponsor;
	
	private List<CategoriaListado> categoriasListados;
	private List<CategoriaNoticia> categoriasNoticias;
	private List<Clasificado> clasificados;
	private List<Noticia> noticias;
	private List<Sponsor> sponsors;
	
	private int id=0;
	private int tipoNuevo = 0;
		
	@DefaultHandler
	@DontValidate
	public Resolution cargar() {	
		
		return new ForwardResolution("/pages/index2.jsp");
	}
	
	
	public Resolution listadoNoticias() {	
	
		/*AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}*/
		try {
			this.noticias=FachadaNoticia.getNoticias();		
			return new ForwardResolution("/pages/listados/listadoNoticias.jsp");			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	public Resolution listadoCategorias() {	
		
		/*AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}*/
		try {
			this.categoriasListados=FachadaCategoria.getCatListados();	
			this.categoriasNoticias=FachadaCategoria.getCatNoticias();		
			return new ForwardResolution("/pages/listados/listadoCategorias.jsp");			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	public Resolution listadoClasificados() {	
		
		/*AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}*/
		try {
			this.clasificados=FachadaClasificado.getClasificados();		
			return new ForwardResolution("/pages/listados/listadoClasificados.jsp");			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	public Resolution listadoSponsor() {	
		
		/*AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}*/
		try {
			this.sponsors=FachadaSponsor.getSponsors();		
			return new ForwardResolution("/pages/listados/listadoSponsor.jsp");			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	public Resolution nuevo() {	
		
		/*AgenteEnrolado user = getAgente();
		if(user==null){
			setSesionVencida(true);
			return new ForwardResolution("vencido.jsp");
		}*/
		try {
			//this.sponsors=FachadaSponsor.getSponsors();		
			
			if (tipoNuevo==1)return new ForwardResolution("/pages/formNuevo/nuevoSponsor.jsp");
			if (tipoNuevo==2)return new ForwardResolution("/pages/formNuevo/nuevoCategoriaListado.jsp");
			if (tipoNuevo==3)return new ForwardResolution("/pages/formNuevo/nuevoCategoriaNoticia.jsp");
			if (tipoNuevo==4)return new ForwardResolution("/pages/formNuevo/nuevoNoticia.jsp");
			if (tipoNuevo==5)return new ForwardResolution("/pages/formNuevo/nuevoClasificado.jsp");
			
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
		
		String pathArchivos = this.getContext().getRequest().getRealPath("/imagenesCargadas");
		
		try {
			if (categoriaListado!=null)
				FachadaCategoria.grabar(categoriaListado);
			if (categoriaNoticia!=null)
				FachadaCategoria.grabar(categoriaNoticia);
			if (clasificado!=null)
				FachadaClasificado.grabar(clasificado);
			if (noticia!=null)
				FachadaNoticia.grabar(noticia);
			if (sponsor!=null)
				FachadaSponsor.grabar(sponsor,pathArchivos);
			
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
	

	public CategoriaListado getCategoriaListado() {
		return categoriaListado;
	}


	public void setCategoriaListado(CategoriaListado categoriaListado) {
		this.categoriaListado = categoriaListado;
	}


	public CategoriaNoticia getCategoriaNoticia() {
		return categoriaNoticia;
	}


	public void setCategoriaNoticia(CategoriaNoticia categoriaNoticia) {
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


	public List<CategoriaListado> getCategoriasListados() {
		return categoriasListados;
	}


	public void setCategoriasListados(List<CategoriaListado> categoriasListados) {
		this.categoriasListados = categoriasListados;
	}


	public List<CategoriaNoticia> getCategoriasNoticias() {
		return categoriasNoticias;
	}


	public void setCategoriasNoticias(List<CategoriaNoticia> categoriasNoticias) {
		this.categoriasNoticias = categoriasNoticias;
	}


	public List<Clasificado> getClasificados() {
		return clasificados;
	}


	public void setClasificados(List<Clasificado> clasificados) {
		this.clasificados = clasificados;
	}


	public List<Noticia> getNoticias() {
		return noticias;
	}


	public void setNoticias(List<Noticia> noticias) {
		this.noticias = noticias;
	}


	public Sponsor getSponsor() {
		return sponsor;
	}


	public void setSponsor(Sponsor sponsor) {
		this.sponsor = sponsor;
	}


	public List<Sponsor> getSponsors() {
		return sponsors;
	}


	public void setSponsors(List<Sponsor> sponsors) {
		this.sponsors = sponsors;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getTipoNuevo() {
		return tipoNuevo;
	}


	public void setTipoNuevo(int tipoNuevo) {
		this.tipoNuevo = tipoNuevo;
	}

}
