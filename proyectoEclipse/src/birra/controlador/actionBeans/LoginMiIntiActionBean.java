package birra.controlador.actionBeans;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.SimpleMessage;
import net.sourceforge.stripes.action.StreamingResolution;
import net.sourceforge.stripes.action.UrlBinding;
import net.sourceforge.stripes.validation.SimpleError;
import birra.modelo.dominio.AgenteEnrolado;
import birra.modelo.dominio.Rol;
import birra.modelo.fachadas.FachadaLogin;
import birra.modelo.utiles.Constantes;

@UrlBinding("/loginMiInti")
public class LoginMiIntiActionBean extends BaseActionBean {
	
	private boolean sesionVencida;
	private int legajo;
	
	@DefaultHandler
	@SuppressWarnings("unused")
	public Resolution ingresar() {
		try {
			
			AgenteEnrolado a = FachadaLogin.obtenerUsuarioPorLegajo(legajo);				
			
			HttpSession sesion = getContext().getRequest().getSession();
			sesion.setAttribute("agente", a);
			JSONObject json = new JSONObject();					
			json.put("success", "true");
			
			List<String> misMenus = new ArrayList<String>();
				
			misMenus.add("15");//listado
		
			for (Rol r : a.getRoles()) {
				if(r.getNivelVertical()==2)misMenus.add("16");//admin
				if(r.getNivelVertical()==3)misMenus.add("17");//auditoria
			}
			
			json.put("id",misMenus);
			
			return new StreamingResolution("text/html", new StringReader(json.toString()));	
			//aca deberia volver un json con los links a los que tengo acceso segun el usuario que soy
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
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
	

	public int getLegajo() {
		return legajo;
	}

	public void setLegajo(int legajo) {
		this.legajo = legajo;
	}
	
}
