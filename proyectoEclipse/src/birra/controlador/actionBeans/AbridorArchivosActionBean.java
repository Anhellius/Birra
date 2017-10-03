package birra.controlador.actionBeans;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

import birra.modelo.dominio.Imagen;
import birra.modelo.fachadas.FachadaNoticia;
import birra.modelo.utiles.CargadorPropiedades;
import birra.modelo.utiles.Constantes;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.StreamingResolution;
import net.sourceforge.stripes.action.UrlBinding;


@UrlBinding("/abridor")
public class AbridorArchivosActionBean extends BaseActionBean {	

	private int idImagen;
	private int idPedido;
	
	@SuppressWarnings("unused")
	public Resolution abridorPdf() {
		HttpServletResponse response = (HttpServletResponse) getContext().getResponse();		
		
		try {
		
			final Imagen r = FachadaNoticia.getImagen(idImagen);		
			if(r!=null){
				
				response.setHeader("Content-Type", r.getMime());
				response.setHeader("Content-Length", String.valueOf(r.getTamanio()));
				response.setHeader("Content-Disposition", "inline; filename=\"" + r.getNombreArchivo() + "\"");
				
				Properties props = CargadorPropiedades.cargarPropiedades(Constantes.ARCHIVO_PROPIEDADES);	
				String dirGuardadoArchivos = props.getProperty("direccionArchivos");
				
				File pdfFile = new File(dirGuardadoArchivos +"/"+idPedido+"-"+idImagen+"-"+r.getNombreArchivo());					
				final FileInputStream fileInputStream;
				fileInputStream = new FileInputStream(pdfFile);		
				
				final OutputStream responseOutputStream = response.getOutputStream();	
				
				 return new StreamingResolution (r.getMime()) {				 
				    public void stream(HttpServletResponse response) throws Exception {
				    	int bytes;
				    	while ((bytes = fileInputStream.read()) != -1) {
							responseOutputStream.write(bytes);
						}
				    }
				}.setFilename(r.getNombreArchivo());		
			
				
			}
			
			} catch (Exception e) {		
				return new StreamingResolution("text/html", new StringReader("No se ha podido acceder al Imagen solicitado. Num:"+idImagen));
			}				
		return null;
	}

	public int getIdImagen() {
		return idImagen;
	}

	public void setIdImagen(int idImagen) {
		this.idImagen = idImagen;
	}

	public int getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}
	
	
}