package birra.modelo.dominio;

// default package
// Generated 02/10/2017 17:19:21 by Hibernate Tools 4.3.1.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import birra.modelo.tipificaciones.IPersistible;

/**
 * Imagen generated by hbm2java
 */
@Entity
@Table(name = "imagen")
public class Imagen implements java.io.Serializable, IPersistible {
	
	
	private Integer idImagen;
	private Noticia noticia;
	private Sponsor sponsor;
	private String nombreArchivo;
	private Integer tipoImagen;
	private String mime;
	private long tamanio;

	public Imagen() {
	}

	public Imagen(Noticia noticia, String nombreArchivo, Integer tipoImagen, String mime, long tamanio) {
		this.noticia = noticia;
		this.nombreArchivo = nombreArchivo;
		this.tipoImagen = tipoImagen;
		this.mime = mime;
		this.tamanio = tamanio;
	}
	
	public Imagen( String nombreArchivo,long tamanio, String mime, Sponsor sponsor) {
		this.sponsor = sponsor;
		this.nombreArchivo = nombreArchivo;
		this.mime = mime;
		this.tamanio = tamanio;
	}
	
	public Imagen( String nombreArchivo,long tamanio, String mime, Noticia noticia) {
		this.noticia = noticia;
		this.nombreArchivo = nombreArchivo;
		this.mime = mime;
		this.tamanio = tamanio;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idImagen", unique = true, nullable = false)
	public Integer getIdImagen() {
		return this.idImagen;
	}

	public void setIdImagen(Integer idImagen) {
		this.idImagen = idImagen;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idNoticia")
	public Noticia getNoticia() {
		return this.noticia;
	}

	public void setNoticia(Noticia noticia) {
		this.noticia = noticia;
	}

	@Column(name = "nombreArchivo", length = 200)
	public String getNombreArchivo() {
		return this.nombreArchivo;
	}

	public void setNombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}

	@Column(name = "tipoImagen")
	public Integer getTipoImagen() {
		return this.tipoImagen;
	}

	public void setTipoImagen(Integer tipoImagen) {
		this.tipoImagen = tipoImagen;
	}

	@Column(name = "mime", length = 45)
	public String getMime() {
		return this.mime;
	}

	public void setMime(String mime) {
		this.mime = mime;
	}

	@Column(name = "tamanio")
	public long getTamanio() {
		return this.tamanio;
	}

	public void setTamanio(long tamanio) {
		this.tamanio = tamanio;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idSponsor")
	public Sponsor getSponsor() {
		return sponsor;
	}

	public void setSponsor(Sponsor sponsor) {
		this.sponsor = sponsor;
	}

}
