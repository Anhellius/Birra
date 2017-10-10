package birra.controlador.actionBeans;

import java.util.Properties;

import javax.servlet.http.HttpSession;

import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;
import birra.modelo.tipificaciones.Usuario;
import birra.modelo.utiles.CargadorPropiedades;


public abstract class BaseActionBean implements ActionBean {
	private ActionBeanContext context;
	@SuppressWarnings("unused")
	private Usuario usuario;
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
	
	public String getVersion() {
		Properties props = CargadorPropiedades.cargarPropiedades("birraProps");
		
		this.version = props.getProperty("version");
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public Usuario getUsuario() {
		HttpSession sesion = getContext().getRequest().getSession();
		
		return (Usuario)sesion.getAttribute("usuario");
	}

	public void setUsuario(Usuario usuario) {
		HttpSession sesion = getContext().getRequest().getSession();		
		sesion.setAttribute("usuario",usuario);
	}
	
}