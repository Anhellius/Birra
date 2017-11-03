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
		  		<h3 class="roboto-light"> Sponsor</h3>
		  	</div>
		  	<div class="cell shrink align-self-bottom">
<!-- 		  <input type="button" id="nuevoSponsor-1" class="modalParaNuevo button sombra-1 bg-color3" value="Nuevo Sponsor"> -->
		  	</div>
		</div>
	</div>		  	
	<div class="cell small-12">
	   <table class="material-table scroll shadow tablaweb" id="tablaweb">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N°</th>
		        <th width="250">Nombre</th>
		        <th width="500">Breve Descripcion</th>
		        <th width="850">Google Maps</th>
		        <th width="350">Dirección</th>
		        <th width="350">Telefono</th>
		        <th width="350">Mail</th>
		        <th width="350">Web</th>
		        <th width="350">Facebook</th>
		        <th width="350">Twitter</th>
		        <th width="300">Acciones</th>
		        <th width="120">Más Info</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.sponsors}" var="p" varStatus="i">
					<tr class="txt-">
			       		<td width="1%" class="bold size-18">${p.idSponsor}</td>
			        	<td>
			        		${p.nombre}
			        	</td>
			        	<td>${p.breveDescripcion}</td>
			        	<td>${p.linkGoogleMaps}</td>
			        	<td><small>${p.direccion}</small></td>
			        	<td>${p.telefono}</td>
			        	<td>${p.mail}</td>
			        	<td>${p.linkWeb}</td>
			        	<td>${p.linkFacebook}</td>
			        	<td>${p.linkTwitter}</td>
			        	<td>
			        		<c:if test="${p.publicada}">
								 <div class="switch small">
										 <input class="switch-input publicarODespublicar" id="publicada-1-${p.idSponsor}" type="checkbox" checked="checked" name="publicada" value="1">
										 <label class="switch-paddle" for="publicada-1-${p.idSponsor}">
											 <span class="switch-active" aria-hidden="true">Si</span>
											 <span class="switch-inactive" aria-hidden="true">No</span>
										 </label>
								 </div>
								</c:if>
								<c:if test="${!p.publicada}" >	
									 <div class="switch small">
										 <input class="switch-input publicarODespublicar" id="publicada-1-${p.idSponsor}" type="checkbox" name="publicada" value="1">
										 <label class="switch-paddle" for="publicada-1-${p.idSponsor}">
											 <span class="switch-active" aria-hidden="true">Si</span>
											 <span class="switch-inactive" aria-hidden="true">No</span>
										 </label>
									 </div>
								</c:if>
								
						</td>
						<td>
							<i class="mdi-editor-border-color modalParaModificar" id="modificarClasificado-1-${p.idSponsor}"></i>	
							<i class="mdi-action-info-outline size-24 txt-color" title="Más Info"></i>					
							
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
                text: 'Crear Sponsor',
                action: function ( e, dt, node, config ) {
                    /*var id = $(this).prop('id');
            		//alert(id);
            		var tipoNuevo = id.substring(id.indexOf('-')+1,id.length);
            		//alert(tipoNuevo);*/
            		//this.idName;
            		$.ajax({
            			url: 'miPanel?nuevo',
            			type: 'post',
            			data: {'tipoNuevo':1},
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
