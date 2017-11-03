<%@ include file="/pages/taglibs.jsp" %>
	<div class="grid-x grid-padding-x grid-padding-y">
		<div class="cell"><h3>Crear Noticia</h3></div>
	</div>

  	<stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >
	  	<div class="grid-x grid-padding-x material-forms">
		
	
					<div class="small-4 cell  input-field">
						<stripes:hidden name="noticia.idNoticia"  />
						<stripes:text name="noticia.titulo" class="required" />
						<label  class="active" for="noticia.titulo">Titulo</label>						
					</div>
					<div class="small-4 cell">
						<label class="active">Categoría</label>
						 <stripes:select class="browser-default required" name="noticia.categorianoticia.idCategoriaNoticia" id="idCategoriaNoticia">                            
							<stripes:option value="">Seleccione</stripes:option>
							<stripes:options-collection collection="${combo:getCombo(\"birra.modelo.dominio.CategoriaNoticia\",\"descripcion\")}"
							value="idCategoriaNoticia" label="descripcion" />                        
						</stripes:select>									
					</div>
					<div class="small-4 cell input-field">
						<stripes:text name="noticia.fecha" class="required" />
						<label class="active" for="noticia.fecha">Fecha</label>													
					</div>

					<div class="small-4 cell input-field">
						<stripesDin:text  data-length="10" name="noticia.copete" class="required"/>		
						<label class="active" for="noticia.copete">Copete</label>										
					</div>
					<div class="small-4 cell input-field">
						<stripes:text name="noticia.autor" class="required" />
						<label class="active" for="noticcia.autor">Autor</label>											
					</div>
					<div class="small-4 cell input-field">
						<stripes:text name="noticia.descAutor" class="required" />
						<label class="active" for="noticia.descAutor">Desc Autor</label>											
					</div>

					<div class="small-12 column">
						<label>Contenido</label>
						<stripes:text name="noticia.cuerpo" id="contenidoNoticia" class="required cuerpoNoticia" />						
					</div>	
									
					<div class="small-6 column margin-top-1">
					    <label>Imagen Principal</label>
					    <div class="file-field input-field grid-x">
					      <div class="cell shrink align-self-middle">
						      <div class="button small radius secondary">
						        <span class="white-text">Examinar</span>
						        <stripes:file name="noticia.imagenPrincipal" id="imagenPrincipal"  />
						      </div>					      	
					      </div>
					      <div class="cell auto">
						      <div class="file-path-wrapper">
						        <input class="file-path validate" type="text">
						      </div>					      	
					      </div>
					    </div>						
						
<%-- 						<stripes:file name="noticia.imagenPrincipal" id="imagenPrincipal"  />						 --%>
					</div>
					<div class="small-6 column margin-vertical-1">
						<input type="hidden" id="cantidadGrilla" value="0">
						<div class="grid-x align-justify">
							<div class="cell shrink">
								<label>Más imagenes</label>
							</div>
							<div class="cell shrink">
								<input type="button" id="agregarGrilla" class="button tiny hollow rounded" value="Agregar imagen" />
							</div>
						</div>
						
						
						<div id="tablaImagenesGrilla">
						    <div class="file-field input-field grid-x">
						      <div class="cell shrink align-self-middle">
							      <div class="button small radius secondary">
							        <span class="white-text">Examinar</span>
							        <stripes:file name="noticia.imagenesGrilla[0]" id="imagenesGrilla"/>
							      </div>					      	
						      </div>
						      <div class="cell auto">
							      <div class="file-path-wrapper">
							        <input class="file-path validate" type="text">
							      </div>					      	
						      </div>
						    </div>
<!-- 							<tr> -->
<!-- 								<td> -->
<%-- 									<stripes:file name="noticia.imagenesGrilla[0]" id="imagenesGrilla" />	 --%>
<!-- 								</td> -->
<!-- 							</tr> -->
						</div>											
					</div>
	
				
				<c:if test="${actionBean.noticia.imagens!=null}">

						<div class="small-12 column">						
							<label>Imagenes cargadas:</label>
							<table class="material-table">
								<tr>
									<td>
										Dirección imagen
									</td>
									<td>
										
									</td>
								</tr>
								<c:set var="req" value="${pageContext.request}" />
								<c:set var="baseURL" value="${fn:replace(req.requestURL, fn:substring(req.requestURI, 1, fn:length(req.requestURI)), req.contextPath)}" />
								<c:forEach items="${actionBean.noticia.imagens}" var="img" varStatus="i">
								<tr>
									<td>
										${baseURL}/pages/imagenesCargadas/${img.nombreArchivo}
									</td>
									<td>
										<i class="fa fa-trash-o eliminarImagen red-text" id="eliminarImagen-${img.idImagen}" aria-hidden="true" style="cursor:pointer"></i>
									</td>
								</tr>
								</c:forEach>
							</table>											
						</div>

				</c:if>	

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
