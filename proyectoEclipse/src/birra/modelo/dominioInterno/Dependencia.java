package birra.modelo.dominioInterno;

// Generated 19/07/2017 10:20:55 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Dependencia generated by hbm2java
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "Dependencia", schema = "dbo", catalog = "rrhh")
public class Dependencia implements java.io.Serializable {

	private int idDependencia;
	private Dependencia dependenciaByIdDependeOrg;
	private NivelDependencia nivelDependencia;
	private Lugar lugar;
	private Agente agente;
	private TipoDependencia tipoDependencia;
	private Dependencia dependenciaByIdDependeOper;
	private String nombre;
	private boolean dadaDeBaja;
	private CentroCosto centroCosto;
	private Set<Dependencia> dependenciasForIdDependeOper = new HashSet<Dependencia>(0);
	private Set<Agente> agentesForIdDependenciaOrg = new HashSet<Agente>(0);
	private Set<Agente> agentesForIdDependenciaOper = new HashSet<Agente>(0);
	private Set<Dependencia> dependenciasForIdDependenciaOrg = new HashSet<Dependencia>(0);
	private Set<Dependencia> dependenciasForIdDependeOrg = new HashSet<Dependencia>(0);
	private Set<Dependencia> dependenciasForIdDependenciaOper = new HashSet<Dependencia>(0);

	public Dependencia() {
	}

	public Dependencia(int idDependencia, Lugar lugar, Agente agente,
			TipoDependencia tipoDependencia, String nombre, boolean dadaDeBaja) {
		this.idDependencia = idDependencia;
		this.lugar = lugar;
		this.agente = agente;
		this.tipoDependencia = tipoDependencia;
		this.nombre = nombre;
		this.dadaDeBaja = dadaDeBaja;
	}

	public Dependencia(int idDependencia,
			Dependencia dependenciaByIdDependeOrg,
			NivelDependencia nivelDependencia, Lugar lugar, Agente agente,
			TipoDependencia tipoDependencia,
			Dependencia dependenciaByIdDependeOper, String nombre,
			boolean dadaDeBaja, CentroCosto centroCosto,
			Set<Dependencia> dependenciasForIdDependeOper, Set<Agente> agentesForIdDependenciaOrg,
			Set<Agente> agentesForIdDependenciaOper,
			Set<Dependencia> dependenciasForIdDependenciaOrg,
			Set<Dependencia> dependenciasForIdDependeOrg,
			Set<Dependencia> dependenciasForIdDependenciaOper) {
		this.idDependencia = idDependencia;
		this.dependenciaByIdDependeOrg = dependenciaByIdDependeOrg;
		this.nivelDependencia = nivelDependencia;
		this.lugar = lugar;
		this.agente = agente;
		this.tipoDependencia = tipoDependencia;
		this.dependenciaByIdDependeOper = dependenciaByIdDependeOper;
		this.nombre = nombre;
		this.dadaDeBaja = dadaDeBaja;
		this.centroCosto = centroCosto;
		this.dependenciasForIdDependeOper = dependenciasForIdDependeOper;
		this.agentesForIdDependenciaOrg = agentesForIdDependenciaOrg;
		this.agentesForIdDependenciaOper = agentesForIdDependenciaOper;
		this.dependenciasForIdDependenciaOrg = dependenciasForIdDependenciaOrg;
		this.dependenciasForIdDependeOrg = dependenciasForIdDependeOrg;
		this.dependenciasForIdDependenciaOper = dependenciasForIdDependenciaOper;
	}

	@Id
	@Column(name = "idDependencia", unique = true, nullable = false)
	public int getIdDependencia() {
		return this.idDependencia;
	}

	public void setIdDependencia(int idDependencia) {
		this.idDependencia = idDependencia;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idDependeOrg")
	public Dependencia getDependenciaByIdDependeOrg() {
		return this.dependenciaByIdDependeOrg;
	}

	public void setDependenciaByIdDependeOrg(
			Dependencia dependenciaByIdDependeOrg) {
		this.dependenciaByIdDependeOrg = dependenciaByIdDependeOrg;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idNivelDependencia")
	public NivelDependencia getNivelDependencia() {
		return this.nivelDependencia;
	}

	public void setNivelDependencia(NivelDependencia nivelDependencia) {
		this.nivelDependencia = nivelDependencia;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idLugar", nullable = false)
	public Lugar getLugar() {
		return this.lugar;
	}

	public void setLugar(Lugar lugar) {
		this.lugar = lugar;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "legajoJefe", nullable = false)
	public Agente getAgente() {
		return this.agente;
	}

	public void setAgente(Agente agente) {
		this.agente = agente;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idTipoDependencia", nullable = false)
	public TipoDependencia getTipoDependencia() {
		return this.tipoDependencia;
	}

	public void setTipoDependencia(TipoDependencia tipoDependencia) {
		this.tipoDependencia = tipoDependencia;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idDependeOper")
	public Dependencia getDependenciaByIdDependeOper() {
		return this.dependenciaByIdDependeOper;
	}

	public void setDependenciaByIdDependeOper(
			Dependencia dependenciaByIdDependeOper) {
		this.dependenciaByIdDependeOper = dependenciaByIdDependeOper;
	}

	@Column(name = "nombre", nullable = false, length = 200)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "dadaDeBaja", nullable = false)
	public boolean isDadaDeBaja() {
		return this.dadaDeBaja;
	}

	public void setDadaDeBaja(boolean dadaDeBaja) {
		this.dadaDeBaja = dadaDeBaja;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "centroCosto", nullable = false, updatable = false)
	public CentroCosto getCentroCosto() {
		return this.centroCosto;
	}

	public void setCentroCosto(CentroCosto centroCosto) {
		this.centroCosto = centroCosto;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dependenciaByIdDependeOper")
	public Set<Dependencia> getDependenciasForIdDependeOper() {
		return this.dependenciasForIdDependeOper;
	}

	public void setDependenciasForIdDependeOper(Set<Dependencia> dependenciasForIdDependeOper) {
		this.dependenciasForIdDependeOper = dependenciasForIdDependeOper;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dependenciaByIdDependenciaOrg")
	public Set<Agente> getAgentesForIdDependenciaOrg() {
		return this.agentesForIdDependenciaOrg;
	}

	public void setAgentesForIdDependenciaOrg(Set<Agente> agentesForIdDependenciaOrg) {
		this.agentesForIdDependenciaOrg = agentesForIdDependenciaOrg;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dependenciaByIdDependenciaOper")
	public Set<Agente> getAgentesForIdDependenciaOper() {
		return this.agentesForIdDependenciaOper;
	}

	public void setAgentesForIdDependenciaOper(Set<Agente> agentesForIdDependenciaOper) {
		this.agentesForIdDependenciaOper = agentesForIdDependenciaOper;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "RelOrganigramaOperativa", schema = "dbo", catalog = "rrhh", joinColumns = { @JoinColumn(name = "idDependenciaOper", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "idDependenciaOrg", nullable = false, updatable = false) })
	public Set<Dependencia> getDependenciasForIdDependenciaOrg() {
		return this.dependenciasForIdDependenciaOrg;
	}

	public void setDependenciasForIdDependenciaOrg(
			Set<Dependencia> dependenciasForIdDependenciaOrg) {
		this.dependenciasForIdDependenciaOrg = dependenciasForIdDependenciaOrg;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dependenciaByIdDependeOrg")
	public Set<Dependencia> getDependenciasForIdDependeOrg() {
		return this.dependenciasForIdDependeOrg;
	}

	public void setDependenciasForIdDependeOrg(Set<Dependencia> dependenciasForIdDependeOrg) {
		this.dependenciasForIdDependeOrg = dependenciasForIdDependeOrg;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "RelOrganigramaOperativa", schema = "dbo", catalog = "rrhh", joinColumns = { @JoinColumn(name = "idDependenciaOrg", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "idDependenciaOper", nullable = false, updatable = false) })
	public Set<Dependencia> getDependenciasForIdDependenciaOper() {
		return this.dependenciasForIdDependenciaOper;
	}

	public void setDependenciasForIdDependenciaOper(
			Set<Dependencia> dependenciasForIdDependenciaOper) {
		this.dependenciasForIdDependenciaOper = dependenciasForIdDependenciaOper;
	}

}
