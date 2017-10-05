package birra.modelo.dominio;

// default package
// Generated 02/10/2017 17:19:21 by Hibernate Tools 4.3.1.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import birra.modelo.tipificaciones.IPersistible;

/**
 * Noticia generated by hbm2java
 */
@Entity
@Table(name = "noticia")
public class Noticia implements java.io.Serializable, IPersistible {	

	private Integer idNoticia;
	private CategoriaNoticia categorianoticia;
	private String titulo;
	private String copete;
	private String autor;
	private Date fecha;
	private String cuerpo;
	private Set<Imagen> imagens = new HashSet<Imagen>(0);

	public Noticia() {
	}

	public Noticia(CategoriaNoticia categorianoticia, String titulo, String copete, String autor, Date fecha,
			String cuerpo, Set<Imagen> imagens) {
		this.categorianoticia = categorianoticia;
		this.titulo = titulo;
		this.copete = copete;
		this.autor = autor;
		this.fecha = fecha;
		this.cuerpo = cuerpo;
		this.imagens = imagens;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idNoticia", unique = true, nullable = false)
	public Integer getIdNoticia() {
		return this.idNoticia;
	}

	public void setIdNoticia(Integer idNoticia) {
		this.idNoticia = idNoticia;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idCategoriaNoticia")
	public CategoriaNoticia getCategorianoticia() {
		return this.categorianoticia;
	}

	public void setCategorianoticia(CategoriaNoticia categorianoticia) {
		this.categorianoticia = categorianoticia;
	}

	@Column(name = "titulo", length = 2000)
	public String getTitulo() {
		return this.titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	@Column(name = "copete", length = 2000)
	public String getCopete() {
		return this.copete;
	}

	public void setCopete(String copete) {
		this.copete = copete;
	}

	@Column(name = "autor", length = 200)
	public String getAutor() {
		return this.autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "fecha", length = 0)
	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	@Column(name = "cuerpo", length = 65535)
	public String getCuerpo() {
		return this.cuerpo;
	}

	public void setCuerpo(String cuerpo) {
		this.cuerpo = cuerpo;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "noticia")
	public Set<Imagen> getImagens() {
		return this.imagens;
	}

	public void setImagens(Set<Imagen> imagens) {
		this.imagens = imagens;
	}

}