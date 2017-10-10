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
       		  	 <a href="#miPanel?listadoSponsor" name="listadoSponsor" id="miPanel?listadoSponsor">
       			   <i class="fi-home"></i><span>Sponsors</span>
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
    <script src="https://www.inti.gob.ar/js/tinymce/tinymce.min.js"></script>
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
var paginaDefault= "miPanel?listadoNoticias";
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
		
		var contentType = 'application/x-www-form-urlencoded;charset=utf-8';
		if ($('#logoImagen').val()!=null && $('#logoImagen').val()!='')contentType = 'multipart/form-data;charset=utf-8';
		if ($('#fondoImagen').val()!=null && $('#fondoImagen').val()!='')contentType = 'multipart/form-data;charset=utf-8';
		if ($('#imagenPrincipal').val()!=null && $('#imagenPrincipal').val()!='')contentType = 'multipart/form-data;charset=utf-8';
		if ($('#imagenesGrilla').val()!=null && $('#imagenesGrilla').val()!='')contentType = 'multipart/form-data;charset=utf-8';
		eliminarTiny();
			$("#formTransicion").ajaxForm({
				url:"miPanel?grabar",
				type:'POST',
				contentType:contentType,
				dataType:'json',
				success: function(data){								
					if(transform(data.success)){			
						$('#grabar').removeClass("disabled");
						$('#grabar').prop("disabled",false);
						$('#pExito').html("Actualizado exitosamente.");
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
	$(document).on('click','.modalParaNuevo', function() {
		/*
			if (tipoNuevo==1)return new ForwardResolution("/pages/formNuevo/nuevoSponsor.jsp");
			if (tipoNuevo==2)return new ForwardResolution("/pages/formNuevo/nuevoCategoriaListado.jsp");
			if (tipoNuevo==3)return new ForwardResolution("/pages/formNuevo/nuevoCategoriaNoticia.jsp");
			if (tipoNuevo==4)return new ForwardResolution("/pages/formNuevo/nuevoNoticia.jsp");
			if (tipoNuevo==5)return new ForwardResolution("/pages/formNuevo/nuevoClasificado.jsp");
		
		*/
		var id = $(this).prop('id');
		var tipoNuevo = id.substring(id.indexOf('-')+1,id.length);
		$.ajax({
			url: 'miPanel?nuevo',
			type: 'post',
			data: {'tipoNuevo':tipoNuevo},
			success: function(data) {				
				$('#divFormTransicion').html(data);
				$('#modalTransicion').foundation('open'); 
				iniciarTiny();   							
			},
			error: function(data){					
				alert("Error de sistema, intente nuevamente.");				
			}
		});		
			
	});	
	$(document).on('click','.modalParaModificar', function() {
		/*
			if (tipoNuevo==1)return new ForwardResolution("/pages/formNuevo/nuevoSponsor.jsp");
			if (tipoNuevo==2)return new ForwardResolution("/pages/formNuevo/nuevoCategoriaListado.jsp");
			if (tipoNuevo==3)return new ForwardResolution("/pages/formNuevo/nuevoCategoriaNoticia.jsp");
			if (tipoNuevo==4)return new ForwardResolution("/pages/formNuevo/nuevoNoticia.jsp");
			if (tipoNuevo==5)return new ForwardResolution("/pages/formNuevo/nuevoClasificado.jsp");
		
		*/
		var id = $(this).prop('id');
		var tipoNuevo = id.substring(id.indexOf('-')+1,id.lastIndexOf('-'));
		var idParaMandar = id.substring(id.lastIndexOf('-')+1,id.length);
		$.ajax({
			url: 'miPanel?nuevo',
			type: 'post',
			data: {'tipoNuevo':tipoNuevo,'id':idParaMandar},
			success: function(data) {				
				$('#divFormTransicion').html(data);
				$('#modalTransicion').foundation('open'); 
				iniciarTiny();   							
			},
			error: function(data){					
				alert("Error de sistema, intente nuevamente.");				
			}
		});		
			
	});	
	$(document).on('click','.eliminarImagen', function() {
		var id = $(this).prop('id');
		var idParaMandar = id.substring(id.lastIndexOf('-')+1,id.length);
		$.ajax({
			url: 'miPanel?eliminarImagen',
			type: 'post',
			data: {'id':idParaMandar},
			success: function(data) {				
				$('#pExito').html("Eliminada exitosamente.");
				$('#myModalExitoGrabar').foundation('open');
				recargarPagina();			  							
			},
			error: function(data){					
				alert("Error de sistema, intente nuevamente.");				
			}
		});		
			
	});	
	$(document).on('change','.publicarODespublicar', function() {		
	
		if($(this).is(':checked')){			
			publicada = '1';
			}
		else{			
			publicada = '0';
		}
		
		var id = $(this).prop('id');
		var tipoNuevo = id.substring(id.indexOf('-')+1,id.lastIndexOf('-'));
		var idParaMandar = id.substring(id.lastIndexOf('-')+1,id.length);
		
			$.ajax({
				type: "POST",
				url:"miPanel?grabarPublicada",
				data: {'tipoNuevo':tipoNuevo,'id':idParaMandar,'publicada':publicada},
				dataType:'json',  
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				success: function(data){							
					if(transform(data.success)){		
						$('#pExito').html('Cambio realizado exitosamente');
						$('#myModalExitoGrabar').foundation('open');
						
					}else{
						$('#pError').html(data.mensaje);
						$('#modalError').foundation('open');
						}
				},
				error: function(data){
					alert("Error de sistema. Comuniquese con sistemas@inti.gob.ar");		
				}
			});
		
		
					
				
	});	
	
});
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
function iniciarTiny(){
	
	var varToolbar = 'undo redo | code removeformat preview link | image media | mybutton';
	tinymce.init({
		selector:'.cuerpoNoticia',
		content_css : 'http://inti.gob.ar/css/app.css',
		body_class: 'color-scheme-institucional',
		min_height: 400,
		language: 'es',
		menubar: 'format table edit',
		toolbar: varToolbar,
		plugins: 'advlist code link image imagetools preview media table contextmenu paste textpattern',
			setup: function(editor) {
				editor.on('change', function () {
			         editor.save();
			     }),
				editor.addButton('mybutton', {
					type: 'splitbutton',
					text: 'Insertar',
					icon: false,
					menu: [{
						text: 'Cita',
						onclick: function() {
							editor.insertContent('<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores quaerat delectus porro, ab doloribus laborum, nemo reiciendis quae ratione, praesentium ducimus! Totam unde minima, tempora qui veritatis impedit ut odit? <cite>Isaac Asimov</cite></blockquote>');
						}
						}, {
						text: 'Media Object',
						onclick: function() {
							editor.insertContent('<div class="media-object"><div class="media-object-section"><div class="thumbnail"><img src="http://placehold.it/100x100.jpg"></div></div><div class="media-object-section"><h4>Dreams feel while we´re in time.</h4><p>I´m going to improvise. Listen, there´s something you should know about me... about inception. An idea is like a virus, resilient, highly contagious. The smallest sedd of an idea can groy. It can grow to define or destroy you.</p></div></div>');
						}
						}, {
							text:'Grilla de imagenes', 
							menu:[
							      {text:'Grilla x5', onclick: function() {
							    	  editor.insertContent('<div class="row small-up-1 medium-up-2 large-up-5"><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div></div>');}},
							      {text:'Grilla x4', onclick: function() {
								     editor.insertContent('<div class="row small-up-1 medium-up-2 large-up-5"><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div></div>');}},
								  {text:'Grilla x3', onclick: function() {
								    	  editor.insertContent('<div class="row small-up-1 medium-up-2 large-up-3"><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div><div class="column"><img class="thumbnail" src="http://placehold.it/200x200.jpg" alt=""/></div></div>');}},										     
							    ], 
							}
						]
				});
				editor.addButton('mybutton2', {
					type: 'menubutton',
					text: 'Insertar',
					icon: false,
					menu: [{
						text: 'Programa/Temario',
						onclick: function() {
							editor.insertContent('<div class="expanded row"><div class="small-1 column text-right content"><span class="lead">10</span><small class="txt-innovacion">AM</small></div><div class="small-11 column content"><div class="row"><div class="small-11 column"><p><span class="bold">La impresi&oacute;n 3D como actor clave de la nueva revoluci&oacute;n industrial</span><br /><span class="txt-innovacion">Visitas. Mi&eacute;rcoles 3 de mayo, 10 y 14 h.- <span class="label">Dise&ntilde;o Industrial</span> Edificio 4</span></p></div><div class="small-1 column align-self-middle text-right">&nbsp;</div></div><hr /><div class="row"><div class="small-11 column"><p><span class="bold">Hechos polvo: productos l&iacute;quidos transformados en s&oacute;lidos</span><br /><span class="txt-innovacion">Visitas. Mi&eacute;rcoles 3 de mayo, 10 y 13 h.-<span class="label">Agroalimentos</span> Edificio 40</span></p></div><div class="small-1 column align-self-middle text-right">&nbsp;</div></div><hr /><div class="row"><div class="small-11 column"><p><span class="bold">Hechos polvo: productos l&iacute;quidos transformados en s&oacute;lidos</span><br /><span class="txt-innovacion">Visitas. Mi&eacute;rcoles 3 de mayo, 10 y 13 h.-<span class="label">Agroalimentos</span> Edificio 40</span></p></div><div class="small-1 column align-self-middle text-right">&nbsp;</div></div><hr /><div class="row"><div class="small-11 column"><p><span class="bold">Hechos polvo: productos l&iacute;quidos transformados en s&oacute;lidos</span><br /><span class="txt-innovacion">Visitas. Mi&eacute;rcoles 3 de mayo, 10 y 13 h.-<span class="label">Agroalimentos</span> Edificio 40</span></p></div><div class="small-1 column align-self-middle text-right">&nbsp;</div></div><hr /><div class="row"><div class="small-11 column"><p><span class="bold">Hechos polvo: productos l&iacute;quidos transformados en s&oacute;lidos</span><br /><span class="txt-innovacion">Visitas. Mi&eacute;rcoles 3 de mayo, 10 y 13 h.-<span class="label">Agroalimentos</span> Edificio 40</span></p></div><div class="small-1 column align-self-middle text-right">&nbsp;</div></div><hr /><div class="row"><div class="small-11 column"><p><span class="bold">Hechos polvo: productos l&iacute;quidos transformados en s&oacute;lidos</span><br /><span class="txt-innovacion">Visitas. Mi&eacute;rcoles 3 de mayo, 10 y 13 h.-<span class="label">Agroalimentos</span> Edificio 40</span></p></div><div class="small-1 column align-self-middle text-right">&nbsp;</div></div></div></div>');
						}
						}]
				});						
			},
		});
	
}
function eliminarTiny(){
	for (var i = tinymce.editors.length - 1 ; i > -1 ; i--) {
	    var ed_id = tinymce.editors[i].id;
	    tinymce.execCommand("mceRemoveEditor", true, ed_id);
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