<%@ include file="/pages/taglibs.jsp" %>
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
    	<div class="off-canvas-content" data-off-canvas-content>
		  <h4>Categoria Noticias</h4>
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
					<tr class="txt-${p.estado.classColor}">
			       		<td width="1%" class="bold size-18">${p.idCategoriaListado}</td>
			        	<td>
			        		${p.descripcion}	        		
			        	</td>			        	
			        	<td>
							<div class="secondary button-group small align-center">
								
							</div> 
						</td>						
			      </tr>
				</c:forEach>	     
			</tbody>
		    </table>
		  </div>
		  
		    <h4>Categoria Clasificados</h4>
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
							<div class="secondary button-group small align-center">
								
							</div> 
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
