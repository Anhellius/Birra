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
import birra.modelo.fachadas.FachadaImagen;
import birra.modelo.fachadas.FachadaNoticia;
import birra.modelo.fachadas.FachadaSponsor;
import birra.modelo.tipificaciones.Combo;
import birra.modelo.tipificaciones.Usuario;
import birra.modelo.utiles.Constantes;

@SuppressWarnings("unused")
@UrlBinding("/inicio")
public class InicialActionBean extends BaseActionBean {	
	
	private CategoriaListado categoriaListado;
	private CategoriaNoticia categoriaNoticia;	
	private Noticia noticia;	
	private Clasificado clasificado;
	private Sponsor sponsor;
	
	private List<CategoriaListado> categoriasListados;
	private List<CategoriaNoticia> categoriasNoticias;
	private List<Clasificado> clasificados;
	private List<Noticia> noticias;
	private List<Noticia> noticiasElNegocio;
	private List<Noticia> noticiasActualidad;
	private List<Noticia> noticiasCT;
	private List<Noticia> noticiasDegira;
	private List<Noticia> noticiasRSE;
	private List<Noticia> noticiasEntrevista;
	private List<Noticia> noticiasHistoriasBirra;
	private List<Sponsor> sponsors;
	
	private int id=0;
	private int tipoNuevo = 0;
	private boolean publicada;
		
	@DefaultHandler
	@DontValidate
	public Resolution cargar() {	
		this.categoriasNoticias = FachadaCategoria.getCatNoticias();
		this.clasificados = FachadaClasificado.getClasificadosHabilitados();
		this.noticiasElNegocio = FachadaNoticia.getUltimasNoticiasPorIdCategoriayCantidad(1,1);
		this.noticiasActualidad = FachadaNoticia.getUltimasNoticiasPorIdCategoriayCantidad(2,3);
		this.noticiasCT = FachadaNoticia.getUltimasNoticiasPorIdCategoriayCantidad(3,1);
		this.noticiasDegira = FachadaNoticia.getUltimasNoticiasPorIdCategoriayCantidad(4,1);
		this.noticiasRSE = FachadaNoticia.getUltimasNoticiasPorIdCategoriayCantidad(5,1);
		this.noticiasEntrevista = FachadaNoticia.getUltimasNoticiasPorIdCategoriayCantidad(6,1);
		this.noticiasHistoriasBirra = FachadaNoticia.getUltimasNoticiasPorIdCategoriayCantidad(7,1);
		this.sponsors = FachadaSponsor.getSponsorsHabilitados();
		return new ForwardResolution("/pages/web/index.jsp");
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
	
	public boolean isPublicada() {
		return publicada;
	}


	public void setPublicada(boolean publicada) {
		this.publicada = publicada;
	}


	public List<Noticia> getNoticiasElNegocio() {
		return noticiasElNegocio;
	}


	public void setNoticiasElNegocio(List<Noticia> noticiasElNegocio) {
		this.noticiasElNegocio = noticiasElNegocio;
	}


	public List<Noticia> getNoticiasActualidad() {
		return noticiasActualidad;
	}


	public void setNoticiasActualidad(List<Noticia> noticiasActualidad) {
		this.noticiasActualidad = noticiasActualidad;
	}


	public List<Noticia> getNoticiasCT() {
		return noticiasCT;
	}


	public void setNoticiasCT(List<Noticia> noticiasCT) {
		this.noticiasCT = noticiasCT;
	}


	public List<Noticia> getNoticiasDegira() {
		return noticiasDegira;
	}


	public void setNoticiasDegira(List<Noticia> noticiasDegira) {
		this.noticiasDegira = noticiasDegira;
	}


	public List<Noticia> getNoticiasRSE() {
		return noticiasRSE;
	}


	public void setNoticiasRSE(List<Noticia> noticiasRSE) {
		this.noticiasRSE = noticiasRSE;
	}


	public List<Noticia> getNoticiasEntrevista() {
		return noticiasEntrevista;
	}


	public void setNoticiasEntrevista(List<Noticia> noticiasEntrevista) {
		this.noticiasEntrevista = noticiasEntrevista;
	}


	public List<Noticia> getNoticiasHistoriasBirra() {
		return noticiasHistoriasBirra;
	}


	public void setNoticiasHistoriasBirra(List<Noticia> noticiasHistoriasBirra) {
		this.noticiasHistoriasBirra = noticiasHistoriasBirra;
	}

}
