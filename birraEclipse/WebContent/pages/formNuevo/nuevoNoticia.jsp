<%@ include file="/pages/taglibs.jsp" %>
	<div class="title bg-color5 panel txt-white">
		<h3>Noticia</h3>
	</div>
  	<stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >
	  	<div class="row expanded">
	 		<div class="small-12 columns">	  		
		  		<div class="row expanded vHeight" >
					<div class="small-4 column">
						<label>Titulo</label>
						<stripes:hidden name="noticia.idNoticia"  />
						<stripes:text name="noticia.titulo" class="required" />						
					</div>
					<div class="small-4 column">
						<label>Categoría</label>
						 <stripes:select name="noticia.categorianoticia.idCategoriaNoticia" id="idCategoriaNoticia" class="required">                            
							<stripes:option value="">Seleccione</stripes:option>
							<stripes:options-collection collection="${combo:getCombo(\"birra.modelo.dominio.CategoriaNoticia\",\"descripcion\")}"
							value="idCategoriaNoticia" label="descripcion" />                        
						</stripes:select>									
					</div>
					<div class="small-4 column">
						<label>Fecha</label>
						<stripes:text name="noticia.fecha" class="required" />							
					</div>
				</div>	
				
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Copete</label>
						<stripes:text name="noticia.copete" class="required" />						
					</div>
					<div class="small-6 column">
						<label>Autor</label>
						<stripes:text name="noticia.autor" class="required" />					
					</div>
				</div>	
				
				<div class="row expanded vHeight" >
					<div class="small-12 column">
						<label>Contenido</label>
						<stripes:text name="noticia.cuerpo" id="contenidoNoticia" class="required cuerpoNoticia" />						
					</div>					
				</div>	
				
				
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Imagen Principal</label>
						<stripes:file name="noticia.imagenPrincipal" id="imagenPrincipal"  />						
					</div>
					<div class="small-6 column">
						<input type="hidden" id="cantidadGrilla" value="0">
						<label>Imagenes Grilla:</label>
						<input type="button" id="agregarGrilla" class="button" value="Agregar imagen" />
						<table id="tablaImagenesGrilla">
							<tr>
								<td>
									<stripes:file name="noticia.imagenesGrilla[0]" id="imagenesGrilla" />	
								</td>
							</tr>
						</table>											
					</div>
				</div>	
				
				<c:if test="${actionBean.noticia.imagens!=null}">
					<div class="row expanded vHeight" >
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
										<i class="mdi-action-delete eliminarImagen" id="eliminarImagen-${img.idImagen}"></i>
									</td>
								</tr>
								</c:forEach>
							</table>											
						</div>
					</div>	
				</c:if>	
					
			</div>
		</div>	
		<div class="row expanded align-center vHeight">				
			<stripes:button class="button bg-color3" value="Grabar" name="grabar" id="grabar"/>
		</div>
	
	</stripes:form>

<script>
	$(document).ready(function() {
		$(document).on('click','#agregarGrilla', function() {
			var cantidad = parseInt($('#cantidadGrilla').val())+1;
			$('#tablaImagenesGrilla').append('<tr id="trImagen-'+cantidad+'"><td><input type="file" name="noticia.imagenesGrilla['+cantidad+']" id="imagenesGrilla-'+cantidad+'" /></td></tr>');
			$('#cantidadGrilla').val(cantidad);
			
		});	
	});  
</script>
