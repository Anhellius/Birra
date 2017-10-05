<%@ include file="/pages/taglibs.jsp" %>
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
    	<div class="off-canvas-content" data-off-canvas-content>
			  <h4>Noticias</h4>
			  
		  <input type="button" id="nuevaNoticia-4" class="modalParaNuevo button sombra-1 bg-color3" value="Nuevo Noticia">
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
			        		<c:if test="${p.publicada}">
								 <div class="switch small">
										 <input class="switch-input publicarODespublicar" id="publicada-4-${p.idNoticia}" type="checkbox" checked="checked" name="publicada" value="1">
										 <label class="switch-paddle" for="publicada-${p.idNoticia}">
											 <span class="switch-active" aria-hidden="true">Si</span>
											 <span class="switch-inactive" aria-hidden="true">No</span>
										 </label>
								 </div>
								</c:if>
								<c:if test="${!p.publicada}" >	
									 <div class="switch small">
										 <input class="switch-input publicarODespublicar" id="publicada-4-${p.idNoticia}" type="checkbox" name="publicada" value="1">
										 <label class="switch-paddle" for="publicada-${p.idNoticia}">
											 <span class="switch-active" aria-hidden="true">Si</span>
											 <span class="switch-inactive" aria-hidden="true">No</span>
										 </label>
									 </div>
								</c:if>
								
						</td>
						<td>
							<div class="row">
								<i class="mdi-editor-border-color modalParaModificar" id="modificarNoticia-4-${p.idNoticia}"></i>								
								<a href="noticia?idNoticia=${p.idNoticia}"><i class="mdi-action-search size-24 txt-color" title="Ver noticia"></i></a>
															
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
