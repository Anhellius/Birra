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
		   		<h3 class="roboto-light">Categoría de Clasificados</h3>
		   	</div>
		   	<div class="cell shrink align-self-bottom">
<!-- 		   		<input type="button" id="nuevaCategoriaNoticias-3" class="modalParaNuevo button sombra-1 bg-color3" value="Nueva Categoria de noticias"> -->
<!-- 		  		<input type="button" id="nuevaCategoriaClasificados-2" class="modalParaNuevo button sombra-1 bg-color3" value="Nueva Categoria de clasificados"> -->
		  	</div>
	  	</div>
  	</div>
	<div class="cell small-12">
	   <table class="material-table scroll shadow tablaweb" id="tablaweb">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N°</th>
		        <th width="850">Descripción</th>
		        <th width="100">Acciones</th>
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
			        		<i class="fa fa-pencil-square-o fa-lg deep-orange-text text-darken-4 modalParaModificar" id="modificarClasificado-2-${p.idCategoriaListado}" style="cursor:pointer"></i>
						</td>						
			      </tr>
				</c:forEach>	     
			</tbody>
		    </table>
		  </div>
		  
	<div class="cell small-12 margin-top-1">
		<div class="grid-x align-justify">
			<div class="cell shrink"> 
		   		<h3 class="roboto-light">Categoría de Noticias</h3>
		   	</div>
	  	</div>
  	</div>
	<div class="cell small-12">
	   <table class="material-table scroll shadow tablaweb" id="tablaweb">
				      <thead>
				      <tr class="txt-oil">
				        <th width="50">N°</th>
				        <th width="850">Descripción</th>
				        <th width="100">Acciones</th>
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
									<i class="fa fa-pencil-square-o fa-lg deep-orange-text text-darken-4 modalParaModificar" id="modificarClasificado-3-${p.idCategoriaNoticia}" style="cursor:pointer"></i>
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
                text: 'Crear categoria Noticias',
                action: function ( e, dt, node, config ) {
                    /*var id = $(this).prop('id');
            		//alert(id);
            		var tipoNuevo = id.substring(id.indexOf('-')+1,id.length);
            		//alert(tipoNuevo);*/
            		//this.idName;
            		$.ajax({
            			url: 'miPanel?nuevo',
            			type: 'post',
            			data: {'tipoNuevo':3},
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
            },
            {
                className: 'rounded modalParaNuevo-4',
                text: 'Crear categoria Clasificados',
                action: function ( e, dt, node, config ) {
                    /*var id = $(this).prop('id');
            		//alert(id);
            		var tipoNuevo = id.substring(id.indexOf('-')+1,id.length);
            		//alert(tipoNuevo);*/
            		//this.idName;
            		$.ajax({
            			url: 'miPanel?nuevo',
            			type: 'post',
            			data: {'tipoNuevo':2},
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
