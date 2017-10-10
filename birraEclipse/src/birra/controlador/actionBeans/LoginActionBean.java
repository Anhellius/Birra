package birra.controlador.actionBeans;

import javax.servlet.http.HttpSession;

import birra.modelo.tipificaciones.Usuario;
import birra.modelo.utiles.Constantes;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.SimpleMessage;
import net.sourceforge.stripes.action.UrlBinding;
import net.sourceforge.stripes.validation.SimpleError;

@UrlBinding("/login")
public class LoginActionBean extends BaseActionBean {
	
	private boolean sesionVencida;
	private String usuarioLogin;
	private String passwordLogin;

	@DefaultHandler
	@DontValidate
	public Resolution cargar() {
		if (sesionVencida) getContext().getValidationErrors().addGlobalError(new SimpleError(Constantes.ERROR_SESION_VENCIDA));
		
		return new ForwardResolution("/pages/login.jsp");
	}

	public Resolution ingresar() {
		try {
			if (true) {
				setUsuario(new Usuario(usuarioLogin));
				return new RedirectResolution("/miPanel");
			} else getContext().getValidationErrors().addGlobalError(new SimpleError("Usuario o contraseña incorrecta, intente nuevamente"));
			
		} catch (Exception e) {
			e.printStackTrace();
			getContext().getMessages().add(new SimpleMessage(Constantes.ERROR_GENERICO_SQL));
		}
		
		return cargar();
	}

	/**
	 * @return the sesionVencida
	 */
	public boolean isSesionVencida() {
		return sesionVencida;
	}

	/**
	 * @param sesionVencida the sesionVencida to set
	 */
	public void setSesionVencida(boolean sesionVencida) {
		this.sesionVencida = sesionVencida;
	}

	/**
	 * @return the usuarioLogin
	 */
	public String getUsuarioLogin() {
		return usuarioLogin;
	}

	/**
	 * @param usuarioLogin the usuarioLogin to set
	 */
	public void setUsuarioLogin(String usuarioLogin) {
		this.usuarioLogin = usuarioLogin;
	}

	/**
	 * @return the passwordLogin
	 */
	public String getPasswordLogin() {
		return passwordLogin;
	}

	/**
	 * @param passwordLogin the passwordLogin to set
	 */
	public void setPasswordLogin(String passwordLogin) {
		this.passwordLogin = passwordLogin;
	}
	
}
