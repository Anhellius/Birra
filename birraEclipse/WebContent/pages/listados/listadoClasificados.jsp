<%@ include file="/pages/taglibs.jsp" %>
<div class="grid-container fluid">
<div class="grid-x grid-padding-x grid-padding-y">
	<div class="cell small-12 shadow padding-vertical-2 hide-for-small-only">
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
		    	<h3 class="roboto-light">Clasificados</h3>
		    </div>
		    <div class="cell shrink align-self-bottom">
<!-- 		    	<input type="button" id="nuevoClasificado-5" class="modalParaNuevo button sombra-1 bg-color3" value="Nuevo clasificado"> -->
		    </div>
		</div>
	</div>			    
	<div class="cell small-12">
	   <table class="material-table scroll shadow tablaweb" id="tablaweb">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N°</th>
		        <th width="400">Categoria</th>
		        <th width="500">Nombre</th>
		        <th width="100">Mail</th>
		        <th width="100">Teléfono</th>
		        <th width="50">Publicar</th>
		        <th width="100">Acciones</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
					<tr class="txt-">
			       		<td width="1%" class="bold size-18">${p.idClasificado}</td>
			        	<td>
			        		${p.categorialistado.descripcion}
			        	</td>
			        	<td>${p.nombre}</td>
			        	<td>${p.mail}</td>
			        	<td><small>${p.telefono}</small></td>
			        	<td>
			        		<c:if test="${p.publicada}">
								 <div class="switch small">
										 <input class="switch-input publicarODespublicar" id="publicada-5-${p.idClasificado}" type="checkbox" checked="checked" name="publicada" value="1">
										 <label class="switch-paddle" for="publicada-${p.idClasificado}">
											 <span class="switch-active" aria-hidden="true">Si</span>
											 <span class="switch-inactive" aria-hidden="true">No</span>
										 </label>
								 </div>
								</c:if>
								<c:if test="${!p.publicada}" >	
									 <div class="switch small">
										 <input class="switch-input publicarODespublicar" id="publicada-5-${p.idClasificado}" type="checkbox" name="publicada" value="1">
										 <label class="switch-paddle" for="publicada-5-${p.idClasificado}">
											 <span class="switch-active" aria-hidden="true">Si</span>
											 <span class="switch-inactive" aria-hidden="true">No</span>
										 </label>
									 </div>
								</c:if>
							
						</td>
						<td>
						<div class="grid-x grid-margin-x">
							<div class="cell shrink">
								<i class="fa fa-pencil-square-o fa-lg modalParaModificar  deep-orange-text text-darken-4" id="modificarClasificado-5-${p.idClasificado}" style="cursor:pointer"></i>
							</div>
							<div class="cell shrink">
								<i class="fa fa-eye fa-lg deep-orange-text text-darken-4" title="Más Info" style="cursor:pointer"></i>
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
                text: 'Crear Clasificado',
                action: function ( e, dt, node, config ) {
                    /*var id = $(this).prop('id');
            		//alert(id);
            		var tipoNuevo = id.substring(id.indexOf('-')+1,id.length);
            		//alert(tipoNuevo);*/
            		//this.idName;
            		$.ajax({
            			url: 'miPanel?nuevo',
            			type: 'post',
            			data: {'tipoNuevo':5},
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
