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
       		  <c:forEach items="${actionBean.listaOpcionesMenu}" var="p" varStatus="i">   
       		  	${p}
	          </c:forEach>
       </ul>
     </div>

   </nav>
</div>
  <div class="off-canvas-content" data-off-canvas-content>
  <div class="title-bar hide-for-large bg-institucional">
        <div class="title-bar-left">
          <button class="menu-icon" type="button" data-open="offCanvasLeft"></button>
          <span class="title-bar-title"><span class="thin">SUPAI</span></span>
        </div>
        <div class="title-bar-right">
    		<button class="" type="button" data-toggle="example-dropdown"><i class="mdi-navigation-more-vert size-28"></i></button>
    		<div class="dropdown-pane" id="example-dropdown" data-dropdown data-auto-focus="true">
      		<ul class="menu vertical text-left" data-closable>
      		<li>
				<span class="txt-oil bold"><i class="mdi-action-account-circle size-24"></i><span>${actionBean.agente.agente.nombre} ${actionBean.agente.agente.apellido}</span></span>
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
				   
				   <input type="hidden" name="pweb.idPedido" id="idPedido" />
				   <input type="hidden" name="transicion.idTransicion" id="idTransicion" />
				   
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

	$(document).on('change','#tipoPedidoWeb', function() {
		if(this.value!=''){
			$('#labelMotivoPedido').html($('#tipoPedidoWeb :selected').text());
			$('#divMotivo1').show();	
	
			if(this.value==1 || this.value==6)
				$('#soloParaSubirArchivos').show();
				else $('#soloParaSubirArchivos').hide();
			
			if(this.value==5){
				$('.motivo1Adjunto').hide();
				$('#divBtnAdjuntar').removeClass('medium-4');
				$('#divBtnAdjuntar').addClass('medium-12');
			}else{
				$('.motivo1Adjunto').show();
				$('#divMotivo1').show();				
			}
				
		}else $('#divMotivo1').hide();
	});


	$(document).on('change','#mailResponsableSupai', function() {
		if ($(this).val()!=''){
			$.ajax({
				url: 'miPanel?existeLegajo',
				type: 'post',
				data: {'mail':$(this).val()},
				dataType:'json',
				success: function(data) {
					if(transform(data.success)){
						$('#supaiLabelResponsable').html(data.nombre);
						$('#legajoResponsableSupai').val(data.legajo);
					}else{
						$('#mailResponsableSupai').val('');
						$('#pError').html("El mail ingresado es incorrecto. <BR>Solo ingrese el usuario del mail sin @inti.gob.ar");
						$('#modalError').foundation('open');
						
					}		
					
				},
				error: function(data){					
					alert("Error de sistema, intente nuevamente o comuniquese con el interno 6194 o a sistemas@inti.gob.ar");				
				}
			});
		}
		
	});
	


	$(document).on('click','#supaiAgregarAdjunto', function() {

		var tipoPedidoWeb = ($('#tipoPedidoWeb :selected').val());
		var cantidadAdjunto = parseInt($('#cantidadAdjunto').val());
		var cantidadAdjuntoReal = parseInt($('#cantidadAdjuntoReal').val());
		var tipoAdjunto="Nuevo";
		var clone = $('#adjunto').clone();
		var appendHiddenAdjunto = "";
		
		/* Modificación Página Existente y  Dar de Baja Publicación Web */
		if (tipoPedidoWeb == 2 || tipoPedidoWeb == 5){
			if ($('#linkReferencia').val()!=''){

				cantidadAdjunto = cantidadAdjunto+1;
				$('#cantidadAdjunto').val(cantidadAdjunto);

				if($('.file-upload-input').val()!=''){

					cantidadAdjuntoReal = cantidadAdjuntoReal+1;
					$('#cantidadAdjuntoReal').val(cantidadAdjuntoReal);

					if ($('input[name=tipoAdjunto]:checked').val()!=null && $('input[name=tipoAdjunto]:checked').val()!='' && $('input[name=tipoAdjunto]:checked').val()!='undefined')tipoAdjunto =$('input[name=tipoAdjunto]:checked').val(); 
					
					clone.attr('id', 'adjunto'+cantidadAdjunto);
				    clone.attr('name', 'adjuntos['+cantidadAdjunto+'].fb');

				    appendHiddenAdjunto = '<input type="hidden" name="adjuntos['+cantidadAdjunto+'].tipoAdjunto" value="'+tipoAdjunto+'" />';
				    					
				}	
				
				$('#supaiTbodyAdjunto').append('<tr id="trAdjuntoSupai-'+cantidadAdjunto+'">'+
		            '<td>'+(cantidadAdjunto+1)+'</td>'+
		            '<td id="tdAdjunto-'+cantidadAdjunto+'"></td>'+
		            '<td>'+$('#linkReferencia').val()+'<input type="hidden" name="adjuntos['+cantidadAdjunto+'].linkReferencia" value="'+$('#linkReferencia').val()+'" />'+
		            appendHiddenAdjunto+'</td>'+
		            '<td class="text-center"><i id="eliminarAdjuntoSupai-'+cantidadAdjunto+'" class="eliminarAdjuntoSupai mdi-action-delete txt-color"></i> </td>'+
		            '</tr>');

				if($('.file-upload-input').val()!=''){
					
					clone.appendTo('#tdAdjunto-'+cantidadAdjunto);
					$('#tdAdjunto-'+cantidadAdjunto).append(tipoAdjunto+' - '+$('.file-upload-input').val());
					
					$('#adjunto').val('');		
					$('.file-upload-input').val('');	
					$('input[name=tipoAdjunto]').prop('checked',false)
				}

				$('#linkReferencia').val('');
				
			}else{

				$('#pError').html("Debe completar el campo link de referencia");
				$('#modalError').foundation('open');
			}
		}
		

		/* Creación Página / Evento y Creación de Formulario / Encuesta */
		if (tipoPedidoWeb == 3 || tipoPedidoWeb == 4){

			if ($('.file-upload-input').val()!=''){

				cantidadAdjunto = cantidadAdjunto+1;
				$('#cantidadAdjunto').val(cantidadAdjunto);
	
				cantidadAdjuntoReal = cantidadAdjuntoReal+1;
				$('#cantidadAdjuntoReal').val(cantidadAdjuntoReal);
	
				if ($('input[name=tipoAdjunto]:checked').val()!=null && $('input[name=tipoAdjunto]:checked').val()!='' && $('input[name=tipoAdjunto]:checked').val()!='undefined')tipoAdjunto =$('input[name=tipoAdjunto]:checked').val(); 
				
				clone.attr('id', 'adjunto'+cantidadAdjunto);
			    clone.attr('name', 'adjuntos['+cantidadAdjunto+'].fb');	
		
			  		
			    $('#supaiTbodyAdjunto').append('<tr id="trAdjuntoSupai-'+cantidadAdjunto+'">'+
			            '<td>'+(cantidadAdjunto+1)+'</td>'+
			            '<td id="tdAdjunto-'+cantidadAdjunto+'"></td>'+
			            '<td>'+$('#linkReferencia').val()+'<input type="hidden" name="adjuntos['+cantidadAdjunto+'].linkReferencia" value="'+$('#linkReferencia').val()+'" />'+
			            '<input type="hidden" name="adjuntos['+cantidadAdjunto+'].tipoAdjunto" value="'+tipoAdjunto+'" /></td>'+
			            '<td class="text-center"><i id="eliminarAdjuntoSupai-'+cantidadAdjunto+'" class="eliminarAdjuntoSupai mdi-action-delete txt-color"></i> </td>'+
			            '</tr>');
			
				clone.appendTo('#tdAdjunto-'+cantidadAdjunto);
				$('#tdAdjunto-'+cantidadAdjunto).append(tipoAdjunto+' - '+$('.file-upload-input').val());
				
				$('#linkReferencia').val('');		
				$('#adjunto').val('');		
				$('.file-upload-input').val('');	
				$('input[name=tipoAdjunto]').prop('checked',false)
			}else{
				$('#pError').html("Debe ingresar un adjunto");
				$('#modalError').foundation('open');
			}
			
		}		

		/* Subir Archivos y Subir archivo / Modificación en página */
		if (tipoPedidoWeb == 1 || tipoPedidoWeb == 6){

			tipoAdjunto="";
			
			if ($('input[name=tipoAdjunto]:checked').val()!=null && 
					$('input[name=tipoAdjunto]:checked').val()!='' && 
					$('input[name=tipoAdjunto]:checked').val()!='undefined'){
				
				tipoAdjunto =$('input[name=tipoAdjunto]:checked').val(); 
				
				$('input:radio[name=tipoAdjunto]').removeAttr("required");													
			}
			
			if ($('#linkReferencia').val()!='' && $('.file-upload-input').val()!='' && tipoAdjunto != ''){
			
				//var cantidadAdjunto = parseInt($('#cantidadAdjunto').val());
				cantidadAdjunto = cantidadAdjunto+1;
				$('#cantidadAdjunto').val(cantidadAdjunto);
	
				//var cantidadAdjuntoReal = parseInt($('#cantidadAdjuntoReal').val());
				cantidadAdjuntoReal = cantidadAdjuntoReal+1;
				$('#cantidadAdjuntoReal').val(cantidadAdjuntoReal);
	
				//var 
				
				//var clone = $('#adjunto').clone();
			    clone.attr('id', 'adjunto'+cantidadAdjunto);
			    clone.attr('name', 'adjuntos['+cantidadAdjunto+'].fb');	
		
			  		
			    $('#supaiTbodyAdjunto').append('<tr id="trAdjuntoSupai-'+cantidadAdjunto+'">'+
			            '<td>'+(cantidadAdjunto+1)+'</td>'+
			            '<td id="tdAdjunto-'+cantidadAdjunto+'"></td>'+
			            '<td>'+$('#linkReferencia').val()+'<input type="hidden" name="adjuntos['+cantidadAdjunto+'].linkReferencia" value="'+$('#linkReferencia').val()+'" />'+
			            '<input type="hidden" name="adjuntos['+cantidadAdjunto+'].tipoAdjunto" value="'+tipoAdjunto+'" /></td>'+
			            '<td class="text-center"><i id="eliminarAdjuntoSupai-'+cantidadAdjunto+'" class="eliminarAdjuntoSupai mdi-action-delete txt-color"></i> </td>'+
			            '</tr>');
			
				clone.appendTo('#tdAdjunto-'+cantidadAdjunto);
				$('#tdAdjunto-'+cantidadAdjunto).append(tipoAdjunto+' - '+$('.file-upload-input').val());
				
				$('#linkReferencia').val('');		
				$('#adjunto').val('');		
				$('.file-upload-input').val('');					
				$('input[name=tipoAdjunto]').prop('checked',false)
			}else{
				$('#pError').html("Debe completar tipo de adjunto, archivo y link para ingresar un adjunto");
				$('#modalError').foundation('open');
			}	
		}
	});

	$(document).on('click','.eliminarAdjuntoSupai', function() {
		var id = $(this).attr('id');
		var idAdjunto = id.substring(id.indexOf('-')+1,id.length);
			
		$('#cantidadAdjuntoReal').val(parseInt($('#cantidadAdjuntoReal').val()-1));

		$('#trAdjuntoSupai-'+idAdjunto).remove();
		
	});
	
	$(document).on('click','.transicionable', function() {
		
		var id = $(this).attr('id');
		var idPedido = id.substring(0,id.indexOf('-'));
		var idTransicion = id.substring(id.indexOf('-')+1,id.lastIndexOf('-'));
		var idEstado = id.substring(id.lastIndexOf('-')+1,id.length);
		var idEstadoViejo = $('#idEstadoViejo-'+idPedido).val();

		if(idEstadoViejo==null)idEstadoViejo="0";
		
		$.ajax({
			url: 'miPanel?armadorFormulario',
			type: 'post',
			data: {'pweb.idPedido':idPedido,'transicion.idTransicion':idTransicion,'transicion.estadoByIdEstadoInicial.idEstado':idEstadoViejo,'transicion.estadoByIdEstadoFinal.idEstado':idEstado},
			success: function(data) {
					$('#divFormTransicion').html(data);
					
					if($('#sesionVencida').val()!=null && $('#sesionVencida').val()!=""){            	
		            	 window.location.reload('login?sesionVencida=true');
		            }					
					if($('#esSmall').val()!=null){
						$('#modalTransicion').removeClass("large");
						$('#modalTransicion').addClass("tiny");
					}else{
						$('#modalTransicion').addClass("large");
						$('#modalTransicion').removeClass("tiny");
						}
					$('#modalTransicion').foundation('open');
					$('#idPedido').val(idPedido);
					$('#idTransicion').val(idTransicion);
					$('#idEstado').val(idEstado); 
					validator = $('#formTransicion').validate();				
					
					$('.tieneFecha').datepicker({dateFormat: 'dd/mm/yy'});
					$('.tieneFecha').prop('readonly',true);

					$('input[type=file]').customFile();
					
					//TODO: hardcodeado en funcion de la transicion
					if ( $("input[name='transicion.idTransicion']").val() == 1) {
						$('#divPedidoNuevo').show();
						$('#divTotal').remove();
						$(document).foundation();
						Foundation.reInit('equalizer');
					} else {
						$('#cantidadAdjunto').remove();
						$('#divPedidoNuevo').remove();
					}

					if ( $("#comentarioLog").length > 0) {
						$('#divLog').show();
					}else{
						$('#divLog').hide();
					}				
			},
			error: function(data){					
				alert("Error de sistema, intente nuevamente o comuniquese con el interno 6194 o a sistemas@inti.gob.ar");				
			}
		});
	});

	

	$(document).on('click','.masInfo', function() {
		
		var id = $(this).attr('id');
		var idPedido = id.substring(id.indexOf('-')+1,id.length);
		var totalPesuInfo = 0;
		var totalPesuOCPdf = 0;
		
		$.ajax({
			url: 'miPanel?masInfoPedido',
			type: 'post',
			data: {'pweb.idPedido':idPedido},
			success: function(data) {
				$('#divMasInfo').html(data);
				
				if($('#sesionVencida').val()!=null && $('#sesionVencida').val()!=""){            	
	            	 window.location.reload('login?sesionVencida=true');
	             }
				$('#modalMasInfo').foundation('open');
							
				
			},
			error: function(data){					
				alert("Error de sistema, intente nuevamente o comuniquese con el interno 6194 o a sistemas@inti.gob.ar");				
			}
		});
	});
	

	$(document).on('click','#grabar', function() {
	
		var cantidadAdjunto = parseInt($('#cantidadAdjunto').val());
		var cantidadAdjuntoReal = parseInt($('#cantidadAdjuntoReal').val());
		
		var contentType = 'application/x-www-form-urlencoded;charset=utf-8';
		if (cantidadAdjuntoReal!=null && cantidadAdjuntoReal>-1)contentType = 'multipart/form-data;charset=utf-8';
		var tipoPedidoWeb = parseInt($('#tipoPedidoWeb :selected').val());

		if ((cantidadAdjuntoReal!=null && cantidadAdjuntoReal>-1 && 
						(tipoPedidoWeb == 1 || tipoPedidoWeb == 3 || tipoPedidoWeb == 4 || tipoPedidoWeb == 6))
				|| (cantidadAdjunto !=null && cantidadAdjunto >-1 && 
						(tipoPedidoWeb == 2 || tipoPedidoWeb == 5))
				|| (isNaN(tipoPedidoWeb))
			){		
			
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
		}else{
			$('#pError').html("Debe ingresar al menos un adjunto");
			$('#modalError').foundation('open');
		}		
	});
	
	$(document).on('click','#buscarAuditoria', function() {
		
		$("#formBusquedaHorasExtras").ajaxForm({
			url:"miPanelAuditoria?listadoBusqueda",
			type:'POST',
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			success: function(data){
				$("#resultadoBusquedaHorasExtras").html(data);
			}
		}).submit();
		
	});

	$(document).on('click','#exportarExcel', function() {
		  /*$("#tablaWebAuditoria").table2excel({	
	  	  	name: "auditoriaWeb",
		    filename: "auditoriaWeb" //do not include extension	
	  		});	*/
		  
	});	
	
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