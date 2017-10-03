<%@ include file="/pages/taglibs.jsp" %>
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
    	<div class="off-canvas-content" data-off-canvas-content>
			  <h4>Noticias</h4>
			  
		  <input type="button" id="nuevaNoticia-4" class="modalParaNuevo button expanded sombra-1 bg-color3" value="Nuevo Noticia">
		  <div class="small-12 columns vHeight">
		    <table class="material-table scroll sombra-1 hover tablaweb" id="tablaweb">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N°</th>
		        <th width="250">Categoria</th>
		        <th width="500">Titulo</th>
		        <th width="350">Fecha</th>
		        <th width="300">Acciones</th>
		        <th width="120">Más Info</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.noticias}" var="p" varStatus="i">
					<tr class="txt-">
			       		<td width="1%" class="bold size-18">${p.idNoticia}</td>
			        	<td>
			        		${p.titulo}
			        	</td>
			        	<td>${p.autor}</td>
			        	<td><small><fmt:formatDate value="${p.fecha}"/></small></td>
			        	<td>
								
						</td>
						<td>
							<div class="row">
								<div class="masInfo column small-4 shrink" id="idPedInfo-${p.idPedido}"><i class="mdi-action-info-outline size-24 txt-color" title="Más Info"></i></div>							
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
