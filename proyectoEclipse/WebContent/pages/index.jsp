<%@ include file="/pages/include/header.jsp" %>

	<style type="text/css">
			input[readonly].hasDatepicker,input[readonly="readonly"].hasDatepicker{
				cursor:pointer !important;
			}
			
		</style>
			

<div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
<div  id="offCanvasLeft" class="off-canvas position-left reveal-for-large" data-off-canvas>
<button class="close-button hide-for-large-only" aria-label="Close menu" type="button" data-close="">
        <span aria-hidden="true">&times;</span>
      </button>
<nav>  

      <div class="soporte-sidenav offcanvas-sidenav" role="navigation" title="Menu">
      <div class="small-12 column">
        <h4 class="subheader">MENU</h4>
      </div>
       <ul class="vertical menu" data-accordion-menu>
       		  <li>
       		  	 <a href="#miPanel?listadoNoticias" name="listadoNoticias" id="miPanel?listadoNoticias">
       			   <i class="fi-home"></i><span>Noticias</span>
       			 </a>
       		  </li>
       		   <li>
       		  	 <a href="#miPanel?listadoClasificados" name="listadoClasificados" id="miPanel?listadoClasificados">
       			   <i class="fi-home"></i><span>Clasificados</span>
       			 </a>
       		  </li>
       		   <li>
       		  	 <a href="#miPanel?listadoCategorias" name="listadoCategorias" id="miPanel?listadoCategorias">
       			   <i class="fi-home"></i><span>Categorias</span>
       			 </a>
       		  </li>
       </ul>
     </div>

   </nav>
</div>
  <div class="off-canvas-content" data-off-canvas-content>
  <div class="title-bar hide-for-large bg-institucional">
        <div class="title-bar-left">
          <button class="menu-icon" type="button" data-open="offCanvasLeft"></button>
          <span class="title-bar-title"><span class="thin">birra</span></span>
        </div>
        <div class="title-bar-right">
    		<button class="" type="button" data-toggle="example-dropdown"><i class="mdi-navigation-more-vert size-28"></i></button>
    		<div class="dropdown-pane" id="example-dropdown" data-dropdown data-auto-focus="true">
      		<ul class="menu vertical text-left" data-closable>
      		<li>
				<span class="txt-oil bold"><i class="mdi-action-account-circle size-24"></i><span>Nombre</span></span>
				</li>
	        	<li>
				<a href="mailto:sistemas@inti.gob.ar"><span><i class="mdi-communication-email"></i> <span>Contacto</span> </span></a>
				</li>	
				<li>
					<a href="logout"><i class="mdi-action-exit-to-app"></i><span>Salir</span></a>
				</li>
        	</ul>
    		</div>
  		</div>
      </div>

        <section  id="includeGeneral">
        </section><br>
  </div>           
</div>
</div> 		

      </body>
    </html>
    
   		<div class="tiny success reveal callout" id="myModalExitoGrabar" data-animation-out="slide-out-right" data-reveal>
		      <p class="lead"><i class="fi-check size-72 txt-regionales"></i> 
		     	<p  class="lead" id="pExito"></p>
		      </p>
		      <button class="close-button" aria-label="Cerrar alerta" type="button" data-close>
		      <span aria-hidden="true">&times;</span>
		      </button>
  	    </div> 
  	     <div class="tiny alert reveal callout" id="modalError" data-animation-out="slide-out-right" data-reveal data-overlay="false" data-options="multipleOpened:true;closeOnClick:false;closeOnEsc:false;">
		      <p class="lead">
		    	  <i class="fi-x size-72 txt-pdf"></i>
		     	  <span id="pError"></span>
		      </p>
		      <button class="close-button" aria-label="Cerrar alerta" type="button" data-close>
		      <span aria-hidden="true">&times;</span>
		      </button>
  	    </div>
  	    
  	    <div class="large panel-reveal" id="modalTransicion" data-animation-out="slide-out-right" data-reveal  data-options="multipleOpened:true;">
	  	      <form id="formTransicion">  	    	
				   <div id="divFormTransicion">
				   
				   </div>				   
			  </form>
			 
		      <button class="close-button" aria-label="Cerrar alerta" type="button" data-close>
		      <span aria-hidden="true" class="txt-white">&times;</span>
		      </button>
  	    </div>
  	    
  	    <div class="large panel-reveal" id="modalMasInfo" data-animation-out="slide-out-right" data-reveal>
	  	     	    	
			   <div id="divMasInfo">
			   
			   </div>		   
			 
		      <button class="close-button" aria-label="Cerrar alerta" type="button" data-close>
		      <span aria-hidden="true" class="txt-white">&times;</span>
		      </button>
  	    </div>
  	    
  	    
 	<script src="https://www.inti.gob.ar/js/jquery.min.js"></script>
    <script src="https://www.inti.gob.ar/js/what-input.min.js"></script>
    <script src="https://www.inti.gob.ar/js/foundation.min.js"></script>
    <script src="https://www.inti.gob.ar/js/app.js"></script>
    <script src="https://www.inti.gob.ar/js/custom-file-upload.js"></script>
    <script type="text/javascript" src="https://www.inti.gob.ar/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://www.inti.gob.ar/js/dataTables.foundation.min.js"></script>
    <script type="text/javascript" src="pages/js/jquery.validate.js"></script>
	<script type="text/javascript" src="pages/js/additional-methods.js"></script>
	<script type="text/javascript" src="pages/js/jquery.form.js"></script>
	<script type="text/javascript" src="pages/js/jquery-ui-1.9.2.js"></script>
	<script type="text/javascript" src="pages/js/html2canvas.js"></script>
	<script type="text/javascript" src="pages/js/jspdf.min.js"></script>
	<script type="text/javascript" src="pages/js/from_html.js"></script>
	<script type="text/javascript" src="pages/js/jquery.print.js"></script>
	<script type="text/javascript" src="pages/js/jquery.table2excel.js"></script>
	
	<script type="text/javascript" src="pages/js/dataTables.buttons.min.js"></script>	
	<script type="text/javascript" src="pages/js/buttons.print.min.js"></script>
	<script type="text/javascript" src="pages/js/buttons.html5.js"></script>
	<script type="text/javascript" src="pages/js/buttons.jqueryui.min.js"></script>
	<script type="text/javascript" src="pages/js/buttons.flash.min.js"></script>
	<script type="text/javascript" src="pages/js/moment.min.js"></script>
    <script type="text/javascript" src="pages/js/datetime-moment.js"></script>
	
	

<script>
var paginaDefault= "miPanel?presentacionSolicitante";

$(document).ready(function() {
		 
	var validator = $('#formTransicion').validate();

	//La primera vez que entra, va a la pagina default
	var pathname = window.location.href;
	if (pathname.indexOf("#")==-1)pathname=paginaDefault;
		else pathname = pathname.substring(pathname.indexOf("#")+1,pathname.length);
	var i = $('a[href="#'+pathname+'"]').attr("id");
	irA(pathname,i);
	
	$(window).bind( 'hashchange', function(e) {
		var hash = window.location.hash;
		var dire = hash.substring(1,hash.length);
		if(dire=='')dire=paginaDefault;

		irA(dire,dire);		
		
	});
	
	$(document).on('click','#grabar', function() {
	
		var cantidadAdjunto = parseInt($('#cantidadAdjunto').val());
		var cantidadAdjuntoReal = parseInt($('#cantidadAdjuntoReal').val());
		
		var contentType = 'application/x-www-form-urlencoded;charset=utf-8';
			$("#formTransicion").ajaxForm({
				url:"miPanel?grabar",
				type:'POST',
				contentType:contentType,
				dataType:'json',
				success: function(data){								
					if(transform(data.success)){			
						$('#grabar').removeClass("disabled");
						$('#grabar').prop("disabled",false);
						$('#pExito').html("Pedido número "+data.idPedido+". Actualizado exitosamente.");
						$('#myModalExitoGrabar').foundation('open');
						recargarPagina();
						
					}else{
						$('#grabar').removeClass("disabled");
						$('#grabar').prop("disabled",false);
						$('#pError').html(data.mensaje);
						$('#modalError').foundation('open');
						}
				},
				error: function(data){
					alert("Error de sistema. Comuniquese con sistemas@inti.gob.ar");		
				}
			}).submit();	
});	

function enviarCampo(lugar,campo,generarDiv){
	if($('#div'+lugar).length==0)
		$('#divTotal').append('<div class="row"><div class="small-12 column"><h5>'+lugar+'</h5></div></div><div class="row small-up-1 medium-up-3 large-up-3" id="div'+lugar+'"></div>');	
	
	if(generarDiv=='1')$('#div'+lugar).append('<div class="column">'+campo+"</div>");
	if(generarDiv=='0')$('#div'+lugar).append(campo);
	
}

function irA(direccion,id){
	
	var idActivo = "";
	
	if(id.lastIndexOf('/')!=-1){
		idActivo = id.substring(id.lastIndexOf('/')+1,id.length);
		
	}
	else {
		idActivo = id;
	}
	
	
	idActivo = idActivo.replace('?','-');
	
		$.ajax({
          type: "POST",
          url: direccion,
          contentType: "application/x-www-form-urlencoded;charset=utf-8",    
          success: function(data){
             $("#includeGeneral").html(data);
            
             chequearSesion();
             
             $(".active").removeClass("active");
             
			 $("#"+idActivo).parent().addClass("active");
			 
			 $(document).foundation();
             
       	 },
			error: function(data){
             $("#includeGeneral").html("Se ha encontrado un error, por favor contactese con sistemas@inti.gob.ar.");
             
       	 }
    	});
}

function recargarPagina(){
	var hash = window.location.hash;
	var dire = hash.substring(1,hash.length);
	if(dire=='')dire=paginaDefault;

	irA(dire,dire);		
	
}

function chequearSesion(){
	if($('#sesionVencida').val()!=null && $('#sesionVencida').val()!=""){            	
   	 window.location.reload('login?sesionVencida=true');
    }
}
	
function transform(a){
	if (a.trim()=="true")
		return true;
	else 
		return false;		
}

function traerFechaActual(){
    var d = new Date();

    var month = d.getMonth()+1;
    var day = d.getDate();

    var output = (day<10 ? '0' : '') + day +'/'+  
        (month<10 ? '0' : '') + month+ '/' +d.getFullYear()
    return output;    
}     


 
</script>