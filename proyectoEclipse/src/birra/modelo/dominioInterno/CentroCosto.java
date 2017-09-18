package birra.modelo.dominioInterno;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CentroCosto", schema = "dbo", catalog = "rrhh")
public class CentroCosto {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int centroCosto;	
	private String descripcion;
	
	public CentroCosto(){};
	
	public int getCentroCosto() {
		return centroCosto;
	}

	public void setCentroCosto(int centroCosto) {
		this.centroCosto = centroCosto;
	}

	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
}
