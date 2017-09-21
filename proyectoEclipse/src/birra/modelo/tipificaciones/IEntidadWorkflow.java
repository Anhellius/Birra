package birra.modelo.tipificaciones;

public interface IEntidadWorkflow {
	public int getId();	
	public String getCampo(String name);
	public String getIdName();
	public boolean getSoyManyToMany();
	public boolean isObligadoAGrabar(); 
}
