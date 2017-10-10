<%@ include file="/pages/taglibs.jsp" %>
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
    	<div class="off-canvas-content" data-off-canvas-content>
		
		 
		  <input type="button" id="nuevaCategoriaNoticias-3" class="modalParaNuevo button sombra-1 bg-color3" value="Nueva Categoria de noticias">
		  
		  <input type="button" id="nuevaCategoriaClasificados-2" class="modalParaNuevo button sombra-1 bg-color3" value="Nueva Categoria de clasificados">
		 
		   <h4>Categoria Clasificados</h4>
		  <div class="small-12 columns vHeight">
		    <table class="material-table scroll sombra-1 hover tablaweb" id="tablaweb">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N°</th>
		        <th width="250">Descripción</th>
		        <th width="300">Acciones</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.categoriasListados}" var="p" varStatus="i">
					<tr class="txt-">
			       		<td width="1%" class="bold size-18">${p.idCategoriaListado}</td>
			        	<td>
			        		${p.descripcion}	        		
			        	</td>			        	
			        	<td>
			        		<i class="mdi-editor-border-color modalParaModificar" id="modificarClasificado-2-${p.idCategoriaListado}"></i>
						</td>						
			      </tr>
				</c:forEach>	     
			</tbody>
		    </table>
		  </div>
		  
		    <h4>Categoría de Noticias</h4>
			  <div class="small-12 columns vHeight">
				    <table class="material-table scroll sombra-1 hover tablaweb">
				      <thead>
				      <tr class="txt-oil">
				        <th width="50">N°</th>
				        <th width="250">Descripción</th>
				        <th width="300">Acciones</th>
				      </tr>
				      </thead>
				      <tbody>
						<c:forEach items="${actionBean.categoriasNoticias}" var="p" varStatus="i">
							<tr class="txt-">
					       		<td width="1%" class="bold size-18">${p.idCategoriaNoticia}</td>
					        	<td>
					        		${p.descripcion}			        		
					        	</td>			        	
					        	<td>
									<i class="mdi-editor-border-color modalParaModificar" id="modificarClasificado-3-${p.idCategoriaNoticia}"></i>
								</td>
								
					      </tr>
						</c:forEach>	     
					</tbody>
				    </table>
			  </div>
		  
		  
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.tablaweb').dataTable( {
			"language": {
				"url": "https://www.inti.gob.ar/js/Spanish.lang"
			}
		});
	});  
</script>
   

  </body>
</html>
