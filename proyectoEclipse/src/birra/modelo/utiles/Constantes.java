package birra.modelo.utiles;


public class Constantes {
	
	public static final String proyecto = "birra";
	//nombre del archivo de propiedades
	public static final String ARCHIVO_PROPIEDADES = "birraProps";
	public static final String smtp = "smtp.inti.gob.ar";
	//el from de todos los mails enviados
	public static final String MAIL_FROM = "sistemas@inti.gob.ar";
	
	//MENSAJES DE ERROR
	public static final String ERROR_GENERICO_SQL = "Error al consultar la base de datos, la operación NO fue realizada.</br>Intente nuevamente, y si el problema persiste, comunique el error a sistemas@inti.gob.ar";
	public static final String ERROR_LOGIN = "Nº de centro y/o contraseña erróneos";
	public static final String ERROR_SESION_VENCIDA = "La sesión se encuentra vencida, por favor, ingrese nuevamente.";
	
	public static final int tipoAccionEnviarMail = 1;
	public static final int tipoAccionGrabar = 2;
	public static final int GUARDAR_EN_DISCO_LOCAL = 1;
	public static final int GUARDAR_EN_CONTENIDO_DB = 2;
	public static final int TRANSICION_QUE_BORRA_ARCHIVOS_T6 = 6;
	public static final int TRANSICION_QUE_BORRA_ARCHIVOS_T13 = 13;
	public static final int TRANSICION_QUE_BORRA_ARCHIVOS_T16 = 16;
	
	public static final int ROL_SOLICITANTE = 2;
	
	// ESTADOS
	public static final int ESTADO_SOLICITADO = 1;
	public static final int ESTADO_PRUEBA_DE_USUARIO = 3;
	public static final int ESTADO_FINALIZADO = 4;
	
	public static final String MENU_SOLICITANTE="<li><a href='#miPanel?presentacionSolicitante' id='miPanel-presentacionSolicitante'><i class='fi-home'></i> <span>Solicitante</span></a></li>";
	public static final String MENU_ADMIN="<li><a href='#miPanel?presentacionAdmin' id='miPanel-presentacionAdmin'><i class='mdi-social-people'></i> <span> Admin </span></a></li>";
	public static final String MENU_AUDITORIA="<li><a href='#miPanelAuditoria' id='miPanelAuditoria'><i class='mdi-social-people'></i> <span>Auditoria</span></a></li>";
	

}