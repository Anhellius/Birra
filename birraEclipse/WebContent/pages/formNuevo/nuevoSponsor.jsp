<%@ include file="/pages/taglibs.jsp" %>
	<div class="grid-x grid-padding-x grid-padding-y">
		<div class="cell"><h3>Nuevo Sponsor</h3></div>
	</div>
  	<stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >
	  	<div class="grid-x grid-padding-x material-forms">

					<div class="small-4 cell  input-field">						
						<stripes:hidden name="sponsor.idSponsor"  />
						<stripes:text name="sponsor.nombre" class="required" />
						<label class="active" for="sponsor.nombre">Nombre</label>						
					</div>
					<div class="small-4 cell  input-field">
						<stripes:text name="sponsor.breveDescripcion" class="required" />
						<label class="active" for="sponsor.breveDescripcion">Breve Descripción</label>
					</div>
	
					<div class="small-4 cell  input-field">
						<stripes:text name="sponsor.linkGoogleMaps" class="required" />
						<label class="active" for="sponsor.linkGoogleMaps">Link Google Maps Iframe</label>												
					</div>
					<div class="small-4 cell  input-field">
						<stripes:text name="sponsor.linkGoogleMapsCompartir" class="required" />
						<label class="active" for="sponsor.linkGoogleMapsCompartir">Link Google Maps Compartir</label>												
					</div>					
	
					<div class="small-4 cell  input-field">
						<stripes:text name="sponsor.descripcion" class="required" />
						<label class="active" for="sponsor.descripcion">Descripcion</label>												
					</div>
					<div class="small-4 cell  input-field">
						<stripes:text name="sponsor.telefono" class="required" />
						<label class="active" for="sponsor.telefono">Telefono </label>											
					</div>
					<div class="small-4 cell  input-field">
						<stripes:text name="sponsor.direccion" class="required" />
						<label class="active" for="sponsor.direccion">Dirección</label>											
					</div>
	

					<div class="small-4 cell  input-field">
						<stripes:text name="sponsor.mail" class="required" />
						<label class="active" for="sponsor.mail">Mail</label>												
					</div>
					<div class="small-4 cell  input-field">
						<stripes:text name="sponsor.linkWeb" class="required" />
						<label class="active" for="sponsor.linkWeb">Pagina web</label>												
					</div>
		

					<div class="small-4 cell  input-field">
						<stripes:text name="sponsor.linkFacebook" class="required" />
						<label class="active" for="sponsor.linkFacebook">Facebook</label>												
					</div>
					<div class="small-4 cell  input-field">
						<stripes:text name="sponsor.linkTwitter" class="required" />
						<label class="active" for="sponsor.linkTwitter">Twitter</label>												
					</div>
	
					<div class="small-12 cell margin-top-1">
						<label>Imagen Logo</label>
					    <div class="file-field input-field grid-x">
					      <div class="cell shrink align-self-middle">
						      <div class="button small radius secondary">
						        <span class="white-text">Examinar</span>
						        <stripes:file name="sponsor.logo" id="logoImagen" />
						      </div>					      	
					      </div>
					      <div class="cell auto">
						      <div class="file-path-wrapper">
						        <input class="file-path validate" type="text">
						      </div>					      	
					      </div>
					    </div>							
					</div>
					<div class="small-12 cell">
						<label>Imagen de fondo</label>
					    <div class="file-field input-field grid-x">
					      <div class="cell shrink align-self-middle">
						      <div class="button small radius secondary">
						        <span class="white-text">Examinar</span>
						        <stripes:file name="sponsor.fondo" id="fondoImagen" />
						      </div>					      	
					      </div>
					      <div class="cell auto">
						      <div class="file-path-wrapper">
						        <input class="file-path validate" type="text">
						      </div>					      	
					      </div>
					    </div>					    																		
					</div>							
		</div>
		<hr />	
		<div class="grid-container margin-top-1">
		  	<div class="grid-x grid-margin-x grid-margin-y align-center">	
		  		<div class="cell shrink">
		  			<div class="button hollow rounded"  data-close>CANCELAR</div>
		  		</div>
		  		<div class="cell shrink">				
					<stripes:button class="button rounded" value="GUARDAR" name="grabar" id="grabar"/>
				</div>
			</div>
		</div>
	
	</stripes:form>

<script>
	$(document).foundation();
	$(document).ready(function() {
		$(document).on('click','#agregarGrilla', function() {
			var cantidad = parseInt($('#cantidadGrilla').val())+1;
			$('#tablaImagenesGrilla').append('<div id="trImagen-'+cantidad+'"><div class="file-field input-field grid-x"><div class="cell shrink align-self-middle"><div class="button small radius secondary"><span class="white-text">Examinar</span><input type="file" name="noticia.imagenesGrilla['+cantidad+']" id="imagenesGrilla-'+cantidad+'" /></div></div><div class="cell auto"><div class="file-path-wrapper"><input class="file-path validate" type="text"></div></div></div></div>');
			$('#cantidadGrilla').val(cantidad);
			
		});	
		$('input#input_text, textarea#textarea1').characterCounter();
	});
	// File Input Path
    $(document).on('change', '.file-field input[type="file"]', function () {
      var file_field = $(this).closest('.file-field');
      var path_input = file_field.find('input.file-path');
      var files = $(this)[0].files;
      var file_names = [];
      for (var i = 0; i < files.length; i++) {
        file_names.push(files[i].name);
      }
      path_input.val(file_names.join(", "));
      path_input.trigger('change');
    });	
</script>	

