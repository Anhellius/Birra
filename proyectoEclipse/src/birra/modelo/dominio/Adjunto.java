package birra.modelo.dominio;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Properties;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import birra.modelo.tipificaciones.IEntidadWorkflow;
import birra.modelo.tipificaciones.IPersistible;
import birra.modelo.utiles.CargadorPropiedades;
import birra.modelo.utiles.Constantes;
import net.sourceforge.stripes.action.FileBean;

@SuppressWarnings("serial")
@Entity
public class Adjunto implements java.io.Serializable, IPersistible,IEntidadWorkflow {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idAdjunto;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idPedido", nullable = false, updatable = false)
	private Pedido pedido;	
	
	private String mime;
	private long tamanio;
	
	private String nombreArchivo;
	private String linkReferencia;
	
	private String tipoAdjunto;
	
	@Transient
	private FileBean fb;
	
	//si no va a la base es transient
	@Transient
	private byte[] contenido;
	
	@Transient
	private boolean manyToMany=false;
	@Transient
	private boolean obligadoAGrabar=false;
	
	@Transient
	private int tipoGuardado=Constantes.GUARDAR_EN_DISCO_LOCAL;

	public Adjunto() {
	}
	
	public void inicializar() {
		this.tamanio = fb.getSize();
		this.nombreArchivo = fb.getFileName();
		this.mime = fb.getContentType();
	}
	
	public Adjunto(FileBean fb) {
		this.fb=fb;
		this.tamanio = fb.getSize();
		this.nombreArchivo = fb.getFileName();
		this.mime = fb.getContentType();
	}
	
	public Adjunto(int idAdjunto) {	
		this.idAdjunto = idAdjunto;
	}
	
	public Adjunto(int idAdjunto,String nombreArchivo) {	
		this.idAdjunto = idAdjunto;
		this.nombreArchivo=nombreArchivo;
	}	


	//Este metodo guardara el adjunto en la direccion que se encuentra definida en el archivo de propiedades
	//Utilizando el nombre original de guardado, pero anteponiendole el idPedido-idAdjunto-nombreArchivo
	public void guardarAdjuntoEnDisco() throws IOException{
		
		if (fb != null){
			Properties props = CargadorPropiedades.cargarPropiedades(Constantes.ARCHIVO_PROPIEDADES);	
			String dirGuardadoArchivos = props.getProperty("direccionArchivos");		
			
			String nombreFinal = pedido.getId()+"-"+getId()+"-"+getNombreArchivo();
			fb.save(new File(dirGuardadoArchivos+"/"+nombreFinal));
		}
		
	}
	
	public void borrarArchivoFisico(int idPedido) throws IOException{
		
		if (getNombreArchivo() != null){
			Properties props = CargadorPropiedades.cargarPropiedades(Constantes.ARCHIVO_PROPIEDADES);	
			String dirGuardadoArchivos = props.getProperty("direccionArchivos");		
			
			String nombreFinal = idPedido+"-"+getId()+"-"+getNombreArchivo();
			
			//Si no lo encuentra, no tira exception.
			Files.deleteIfExists(Paths.get(dirGuardadoArchivos+"/"+nombreFinal));
		}
		
	}
	
	
	public Adjunto(int idAdjunto,String nombreArchivo,String mime, long tamanio) {
		super();
		this.idAdjunto = idAdjunto;	
		this.mime = mime;
		this.tamanio = tamanio;
		this.nombreArchivo=nombreArchivo;
	}
	
	public Adjunto(Pedido pedido,byte[] contenido,String nombreArchivo, String mime, long tamanio) {
		super();
		this.pedido = pedido;	
		this.nombreArchivo=nombreArchivo;
		this.contenido = contenido;
		this.mime = mime;
		this.tamanio = tamanio;
	}
	
	@Override
	public int getId() {		
		return this.idAdjunto;
	}

	public FileBean getFb() {
		return fb;
	}

	public void setFb(FileBean fb) {
		this.fb = fb;
	}

	public byte[] getContenido() {
		return contenido;
	}

	public void setContenido(byte[] contenido) {
		this.contenido = contenido;
	}

	public int getTipoGuardado() {
		return tipoGuardado;
	}

	public void setTipoGuardado(int tipoGuardado) {
		this.tipoGuardado = tipoGuardado;
	}

	@Override
	public String getCampo(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getIdName() {		
		return "idAdjunto";
	}

	public int getIdAdjunto() {
		return idAdjunto;
	}


	public void setIdAdjunto(int idAdjunto) {
		this.idAdjunto = idAdjunto;
	}


	public Pedido getPedido() {
		return pedido;
	}


	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	public String getMime() {
		return mime;
	}


	public void setMime(String mime) {
		this.mime = mime;
	}


	public long getTamanio() {
		return tamanio;
	}


	public void setTamanio(long tamanio) {
		this.tamanio = tamanio;
	}

	public boolean isManyToMany() {
		return manyToMany;
	}

	public void setManyToMany(boolean manyToMany) {
		this.manyToMany = manyToMany;
	}

	@Override
	public boolean getSoyManyToMany() {
		return manyToMany;
	}

	public boolean isObligadoAGrabar() {
		return obligadoAGrabar;
	}

	public void setObligadoAGrabar(boolean obligadoAGrabar) {
		this.obligadoAGrabar = obligadoAGrabar;
	}

	public String getNombreArchivo() {
		return nombreArchivo;
	}

	public void setNombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}

	public String getLinkReferencia() {
		return linkReferencia;
	}

	public void setLinkReferencia(String linkReferencia) {
		this.linkReferencia = linkReferencia;
	}

	public String getTipoAdjunto() {
		return tipoAdjunto;
	}

	public void setTipoAdjunto(String tipoAdjunto) {
		this.tipoAdjunto = tipoAdjunto;
	}

	
}
