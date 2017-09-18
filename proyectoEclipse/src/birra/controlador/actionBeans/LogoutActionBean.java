package birra.controlador.actionBeans;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;

@UrlBinding("/logout")
public class LogoutActionBean extends BaseActionBean {

	@DefaultHandler
	@DontValidate
	public Resolution cargar() {
		HttpSession sesion = getContext().getRequest().getSession();
		sesion.removeAttribute("agente");		
		
		return new RedirectResolution("/login"); 
	}	
}
