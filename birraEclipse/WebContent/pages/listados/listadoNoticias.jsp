<%@ include file="/pages/taglibs.jsp" %>
<div class="grid-container fluid">
<div class="grid-x grid-padding-x margin-top-1">
	<div class="cell small-12">
		<div class="grid-x grid-margin-x align-middle">
			<div class="cell shrink">
				<i class="fa fa-bars fa-lg" aria-hidden="true"  id="botonOffCanvas" style="cursor:pointer"></i>
			</div>
			<div class="cell shrink">
				<span class="size-22">MENU</span>
			</div>
		</div>
		<br />
		<div class="grid-x align-justify">
			<div class="cell shrink">
				<h3 class="roboto-light">Noticias</h3>
			</div>
			<div class="cell shrink align-self-bottom">
<!-- 				<i class="fa fa-plus-circle fa-3x modalParaNuevo deep-orange-text text-darken-4" aria-hidden="true"  id="nuevaNoticia-4"  value="Nuevo Noticia"></i> -->
				<input type="button" id="nuevaNoticia-4" class="modalParaNuevo small hollow rounded button sombra-1 bg-color3" value="Nueva Noticia">
			</div>
		</div>
		
		
	</div>
	<div class="cell small-12">
	   <table class="material-table scroll shadow tablaweb" id="tablaweb">
	     <thead>
	     <tr class="txt-oil">
	       <th width="50">N°</th>
	       <th width="500">Título</th>
	       <th width="200">Autor</th>
	       <th width="100">Fecha</th>
	       <th width="100">Publicado</th>
	       <th width="100">Acciones</th>
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
								 <label class="switch-paddle" for="publicada-4-${p.idNoticia}">
									 <span class="switch-active" aria-hidden="true">Si</span>
									 <span class="switch-inactive" aria-hidden="true">No</span>
								 </label>
						 </div>
						</c:if>
						<c:if test="${!p.publicada}" >	
							 <div class="switch small">
								 <input class="switch-input publicarODespublicar" id="publicada-4-${p.idNoticia}" type="checkbox" name="publicada" value="1">
								 <label class="switch-paddle" for="publicada-4-${p.idNoticia}">
									 <span class="switch-active" aria-hidden="true">Si</span>
									 <span class="switch-inactive" aria-hidden="true">No</span>
								 </label>
							 </div>
						</c:if>
						
				</td>
				<td>
					<div class="row">
						<i class="fa fa-pencil-square-o fa-lg  modalParaModificar" aria-hidden="true" id="modificarNoticia-4-${p.idNoticia}" style="cursor:pointer"></i>
<%-- 						<i class="mdi-editor-border-color modalParaModificar" id="modificarNoticia-4-${p.idNoticia}"></i>								 --%>
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

<script>
$(document).foundation();
	$(document).ready(function() {
		$('.tablaweb').dataTable( {
			"language": {
				"url": "https://www.inti.gob.ar/js/Spanish.lang"
			},
			
	        buttons: [
	            {
	                className: 'rounded modalParaNuevo',
	                text: 'Crear Noticia',
	                action: function ( e, dt, node, config ) {
	                    alert( 'Button activated' );
	                }
	            }
	        ]
		});
	});  
</script>
   

  </body>
</html>
