package birra.modelo.utiles;

import java.util.ArrayList;
import java.util.List;

public class Mail {
	private String remitente;
	private List<String> destinatarios;
	private String asunto;
	private String mensaje;
	
	public Mail(){
	}
	
	/**
	 * @param remitente
	 * @param destinatarios
	 * @param asunto
	 * @param texto
	 */
	public Mail(String remitente, List<String> destinatarios, String asunto,
			String mensaje) {
		this.remitente = remitente;
		this.destinatarios = destinatarios;
		this.asunto = asunto;
		this.mensaje = mensaje;
	}
	
	/**
	 * @return the remitente
	 */
	public String getRemitente() {
		return remitente;
	}
	/**
	 * @param remitente the remitente to set
	 */
	public void setRemitente(String remitente) {
		this.remitente = remitente;
	}
	/**
	 * @return the destinatarios
	 */
	public List<String> getDestinatarios() {
		return destinatarios;
	}
	/**
	 * @param destinatarios the destinatarios to set
	 */
	public void setDestinatarios(List<String> destinatarios) {
		this.destinatarios = destinatarios;
	}
	/**
	 * agrega una direccion a la lista de destinatarios.
	 * @param destinatario
	 */
	public void agregarDestinatario(String destinatario) {
		if(this.destinatarios == null){
			List<String> al = new ArrayList<String>();
			al.add(destinatario);
			this.destinatarios = al;
		} else {
			this.destinatarios.add(destinatario);
		}
	}
	/**
	 * @return the asunto
	 */
	public String getAsunto() {
		return asunto;
	}
	/**
	 * @param asunto the asunto to set
	 */
	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}
	/**
	 * @return the mensaje
	 */
	public String getMensaje() {
		return mensaje;
	}
	/**
	 * @param texto the mensaje to set
	 */
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
}