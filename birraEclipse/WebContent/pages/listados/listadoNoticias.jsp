<%@ include file="/pages/taglibs.jsp" %>
<div class="grid-container fluid">
<div class="grid-x grid-padding-x grid-padding-y">
	<div class="cell small-12 shadow padding-vertical-2 hide-for-small-only white">
		<div class="grid-x grid-margin-x align-middle">
			<div class="cell shrink">
				<i class="fa fa-bars fa-lg" aria-hidden="true"  id="botonOffCanvas" style="cursor:pointer"></i>
			</div>
			<div class="cell shrink">
				<span class="size-22">MENU</span>
			</div>
		</div>	
	</div>

	<div class="cell small-12 margin-top-1">
		<div class="grid-x align-justify">
			<div class="cell shrink">
				<h3 class="roboto-light">Noticias</h3>
			</div>
			<div class="cell shrink align-self-bottom">
<!-- 				<i class="fa fa-plus-circle fa-3x modalParaNuevo deep-orange-text text-darken-4" aria-hidden="true"  id="nuevaNoticia-4"  value="Nuevo Noticia"></i> -->
<!-- 				<input type="button" id="nuevaNoticia-4" class="modalParaNuevo small hollow rounded button sombra-1 bg-color3" value="Nueva Noticia"> -->
			</div>
		</div>
		
		
	</div>
	<div class="cell small-12">
	   <table class="material-table scroll shadow tablaweb" id="tablaweb">
	     <thead>
	     <tr class="txt-oil">
	       <th width="200">N°</th>
	       <th width="450">Título</th>
	       <th width="100">Fecha</th>
	       <th width="50">Publicado</th>
	       <th width="100">Acciones</th>
	     </tr>
	     </thead>
	     <tbody>
		<c:forEach items="${actionBean.noticias}" var="p" varStatus="i">
			<tr>
	       		<td width="1%" class="">${p.idNoticia}</td>
	        	<td class="truncate-1">
	        		<span>${p.titulo}</span>
	        	</td>
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
					<div class="grid-x grid-margin-x">
						<div class="cell shrink">
							<i class="fa fa-pencil-square-o fa-lg  modalParaModificar deep-orange-text text-darken-4" aria-hidden="true" id="modificarNoticia-4-${p.idNoticia}" style="cursor:pointer"></i>
							<%-- 						<i class="mdi-editor-border-color modalParaModificar" id="modificarNoticia-4-${p.idNoticia}"></i>								 --%>							
						</div>
						<div class="cell shrink">
							<a href="noticia?idNoticia=${p.idNoticia}"><i class="fa fa-eye fa-lg deep-orange-text text-darken-4" title="Ver noticia"></i></a>
						</div>						
					
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
	                className: 'rounded modalParaNuevo-4',
	                text: 'Crear Noticia',
	                action: function ( e, dt, node, config ) {
	                    /*var id = $(this).prop('id');
	            		//alert(id);
	            		var tipoNuevo = id.substring(id.indexOf('-')+1,id.length);
	            		//alert(tipoNuevo);*/
	            		//this.idName;
	            		$.ajax({
	            			url: 'miPanel?nuevo',
	            			type: 'post',
	            			data: {'tipoNuevo':4},
	            			success: function(data) {				
	            				$('#divFormTransicion').html(data);
	            				$('#modalTransicion').foundation('open'); 
	            				iniciarTiny();   							
	            			},
	            			error: function(data){					
	            				alert("Error de sistema, intente nuevamente.");				
	            			}
	            		});
	                }
	            }
	        ]
		});
	});  
</script>
   

  </body>
</html>
