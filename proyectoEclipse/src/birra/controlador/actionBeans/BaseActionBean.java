package birra.controlador.actionBeans;

import java.util.Properties;

import javax.servlet.http.HttpSession;

import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;
import birra.modelo.dominio.AgenteEnrolado;
import birra.modelo.utiles.CargadorPropiedades;


public abstract class BaseActionBean implements ActionBean {
	private ActionBeanContext context;
	@SuppressWarnings("unused")
	private AgenteEnrolado agente;
	private String version;

	protected boolean sesionVencida;
	
	public ActionBeanContext getContext() {
		return context;
	}
	
	public void setContext(ActionBeanContext actionBeanContext) {
		this.context = actionBeanContext;
	}	

	public boolean isSesionVencida() {
		return sesionVencida;
	}

	public void setSesionVencida(boolean sesionVencida) {
		this.sesionVencida = sesionVencida;
	}

	/**
	 * @return the agente
	 */
	public AgenteEnrolado getAgente() {
		HttpSession sesion = getContext().getRequest().getSession();
		
		return (AgenteEnrolado)sesion.getAttribute("agente");
	}

	/**
	 * @param agente the agente to set
	 */
	public void setAgente(AgenteEnrolado agente) {
		this.agente = agente;
	}

	public String getVersion() {
		Properties props = CargadorPropiedades.cargarPropiedades("supaiProps");
		
		this.version = props.getProperty("version");
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}
	
}