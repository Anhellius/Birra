<%@ include file="/pages/taglibs.jsp" %>
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
    	<div class="off-canvas-content" data-off-canvas-content>

		  <div class="small-12 columns vHeight">
		    <table class="material-table scroll sombra-1 hover tablaweb" id="tablaweb">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N�</th>
		        <th width="250">Descripci�n</th>
		        <th width="300">Acciones</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.categoriasListados}" var="p" varStatus="i">
					<tr class="txt-${p.estado.classColor}">
			       		<td width="1%" class="bold size-18">${p.idPedido}</td>
			        	<td>
			        		${p.estado.descripcion}			        		
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
		  
		  
		  <div class="small-12 columns vHeight">
		    <table class="material-table scroll sombra-1 hover tablaweb">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N�</th>
		        <th width="250">Descripci�n</th>
		        <th width="300">Acciones</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.categoriasNoticias}" var="p" varStatus="i">
					<tr class="txt-${p.estado.classColor}">
			       		<td width="1%" class="bold size-18">${p.idPedido}</td>
			        	<td>
			        		${p.estado.descripcion}			        		
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
