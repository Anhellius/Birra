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
 * Clasificado generated by hbm2java
 */
@Entity
@Table(name = "clasificado")
public class Clasificado implements java.io.Serializable, IPersistible {	
	
	private Integer idClasificado;
	private CategoriaListado categorialistado;
	private String nombre;
	private String mail;
	private String telefono;
	private String web;
	private String facebook;
	private String twitter;
	private String googlePlus;
	private String instagram;
	private String direccionMapa;
	private boolean publicada; 

	public Clasificado() {
	}

	public Clasificado(CategoriaListado categorialistado, String nombre, String mail, String telefono, String web,
			 String direccionMapa) {
		this.categorialistado = categorialistado;
		this.nombre = nombre;
		this.mail = mail;
		this.telefono = telefono;
		this.web = web;
		this.direccionMapa = direccionMapa;
	}

	public Clasificado(Integer idClasificado, CategoriaListado categorialistado, String nombre, String mail,
			String telefono, String web, String facebook, String twitter, String googlePlus, String instagram,
			String direccionMapa, boolean publicada) {
		super();
		this.idClasificado = idClasificado;
		this.categorialistado = categorialistado;
		this.nombre = nombre;
		this.mail = mail;
		this.telefono = telefono;
		this.web = web;
		this.facebook = facebook;
		this.twitter = twitter;
		this.googlePlus = googlePlus;
		this.instagram = instagram;
		this.direccionMapa = direccionMapa;
		this.publicada = publicada;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idClasificado", unique = true, nullable = false)
	public Integer getIdClasificado() {
		return this.idClasificado;
	}

	public void setIdClasificado(Integer idClasificado) {
		this.idClasificado = idClasificado;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idCategoriaListado")
	public CategoriaListado getCategorialistado() {
		return this.categorialistado;
	}

	public void setCategorialistado(CategoriaListado categorialistado) {
		this.categorialistado = categorialistado;
	}

	@Column(name = "nombre", length = 200)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "mail", length = 200)
	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	@Column(name = "telefono", length = 200)
	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	@Column(name = "web", length = 200)
	public String getWeb() {
		return this.web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

	@Column(name = "direccionMapa", length = 200)
	public String getDireccionMapa() {
		return this.direccionMapa;
	}

	public void setDireccionMapa(String direccionMapa) {
		this.direccionMapa = direccionMapa;
	}

	public boolean isPublicada() {
		return publicada;
	}

	public void setPublicada(boolean publicada) {
		this.publicada = publicada;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getGooglePlus() {
		return googlePlus;
	}

	public void setGooglePlus(String googlePlus) {
		this.googlePlus = googlePlus;
	}

	public String getInstagram() {
		return instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

}
