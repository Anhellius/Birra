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
@UrlBinding("/categoria")
public class CategoriaActionBean extends BaseActionBean {	
	
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
	private boolean publicada;
		
	@DefaultHandler
	@DontValidate
	public Resolution cargar() {	
		this.categoriasNoticias = FachadaCategoria.getCatNoticias();
		this.noticias = FachadaNoticia.getNoticiasPorIdCategoria(id);
		return new ForwardResolution("/pages/web/categoria.jsp");
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

}
