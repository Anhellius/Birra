package birra.modelo.tipificaciones;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

public class Combo implements IPersistible {

	private int id;
	private BigInteger idBig;
	private int idInversion;
	private String descripcion;
	private int idBusqueda;
	private int cantidad;
	private String moneda;
	private BigDecimal monto;
	private int total;
	
	private int legajo;
	
	private int ordenado;
	private String nombre;
	
	private int legajoJefe;
	private Integer idDependeOper;
	private Integer idNivelDependencia;
	private Integer idDependencia;
	
	private Date fechaDesde;
	private Date fechaHasta;
	
	public Combo() {
	}
	
	public Combo(int id, BigInteger idBig, int idInversion, String descripcion, int idBusqueda, int cantidad,
			String moneda, BigDecimal monto, int total, int legajo, int ordenado, String nombre, int legajoJefe,
			Integer idDependeOper, Integer idNivelDependencia, Integer idDependencia, Date fechaDesde,
			Date fechaHasta) {
		super();
		this.id = id;
		this.idBig = idBig;
		this.idInversion = idInversion;
		this.descripcion = descripcion;
		this.idBusqueda = idBusqueda;
		this.cantidad = cantidad;
		this.moneda = moneda;
		this.monto = monto;
		this.total = total;
		this.legajo = legajo;
		this.ordenado = ordenado;
		this.nombre = nombre;
		this.legajoJefe = legajoJefe;
		this.idDependeOper = idDependeOper;
		this.idNivelDependencia = idNivelDependencia;
		this.idDependencia = idDependencia;
		this.fechaDesde = fechaDesde;
		this.fechaHasta = fechaHasta;
	}

	public Combo(int idInversion, String descripcion, int id, int cantidad, String moneda, BigDecimal monto,
			int total) {
		super();
		this.idInversion = idInversion;
		this.descripcion = descripcion;
		this.id = id;
		this.cantidad = cantidad;
		this.moneda = moneda;
		this.monto = monto;
		this.total = total;
	}
	
	public Combo(int legajoJefe,String nombre, Integer idDependeOper, Integer idNivelDependencia, Integer idDependencia) {
		super();
		this.nombre = nombre;
		this.legajoJefe = legajoJefe;
		this.idDependeOper = idDependeOper;
		this.idNivelDependencia = idNivelDependencia;
		this.setIdDependencia(idDependencia);
	}

	public Combo(int id, String descripcion) {
		this.id = id;
		this.descripcion = descripcion;
	}
	
	public Combo(BigInteger idBig, String descripcion) {
		this.idBig = idBig;
		this.descripcion = descripcion;
	}
	
	public Combo(int id, String descripcion, int idBusqueda) {
		this.id = id;
		this.descripcion = descripcion;
		this.idBusqueda = idBusqueda;
	}
	
	public Combo(int legajo, String nombre, String i) {
		this.legajo = legajo;
		this.nombre = nombre;
	}
	
	 @Override
	    public boolean equals(Object obj) {
	        if (obj == null) return false;
	        if (getClass() != obj.getClass()) return false;
	        final Combo other = (Combo) obj;
	        boolean sameA = (this.legajoJefe == other.legajoJefe);
	        if (!sameA) return false;	       
	        return true;
	    }

	    @Override
	    public int hashCode() {
	        int hash = 3;
	       /* hash = 89 * hash + (this.a == null ? 0 :this.a.toUpperCase().hashCode());
	        hash = 89 * hash + (this.b == null ? 0 : this.b.toUpperCase().hashCode());*/
	        return hash;
	    }

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}

	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getIdBusqueda() {
		return idBusqueda;
	}

	public void setIdBusqueda(int idBusqueda) {
		this.idBusqueda = idBusqueda;
	}

	public int getLegajo() {
		return legajo;
	}

	public void setLegajo(int legajo) {
		this.legajo = legajo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getLegajoJefe() {
		return legajoJefe;
	}

	public void setLegajoJefe(int legajoJefe) {
		this.legajoJefe = legajoJefe;
	}

	public Integer getIdDependeOper() {
		return idDependeOper;
	}

	public void setIdDependeOper(Integer idDependeOper) {
		this.idDependeOper = idDependeOper;
	}

	public Integer getIdNivelDependencia() {
		return idNivelDependencia;
	}

	public void setIdNivelDependencia(Integer idNivelDependencia) {
		this.idNivelDependencia = idNivelDependencia;
	}

	public Integer getIdDependencia() {
		return idDependencia;
	}

	public void setIdDependencia(Integer idDependencia) {
		this.idDependencia = idDependencia;
	}

	public int getIdInversion() {
		return idInversion;
	}

	public void setIdInversion(int idInversion) {
		this.idInversion = idInversion;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public String getMoneda() {
		return moneda;
	}

	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}

	public BigDecimal getMonto() {
		return monto;
	}

	public void setMonto(BigDecimal monto) {
		this.monto = monto;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public BigInteger getIdBig() {
		return idBig;
	}

	public void setIdBig(BigInteger idBig) {
		this.idBig = idBig;
	}

	public int getOrdenado() {
		return ordenado;
	}

	public void setOrdenado(int ordenado) {
		this.ordenado = ordenado;
	}

	public Date getFechaDesde() {
		return fechaDesde;
	}

	public void setFechaDesde(Date fechaDesde) {
		this.fechaDesde = fechaDesde;
	}

	public Date getFechaHasta() {
		return fechaHasta;
	}

	public void setFechaHasta(Date fechaHasta) {
		this.fechaHasta = fechaHasta;
	}
}