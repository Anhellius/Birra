<%@ include file="/pages/taglibs.jsp" %>
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
    	<div class="off-canvas-content" data-off-canvas-content>
		  <h4> Sponsor</h4>
		  <input type="button" id="nuevoSponsor-1" class="modalParaNuevo button expanded sombra-1 bg-color3" value="Nuevo Sponsor">
		  <div class="small-12 columns vHeight">
		    <table class="material-table scroll sombra-1 hover tablaweb" id="tablaweb">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N�</th>
		        <th width="250">Estado</th>
		        <th width="500">Solicitante</th>
		        <th width="850">Titulo</th>
		        <th width="350">Tipo Pedido</th>
		        <th width="850">Profesional Asignado</th>
		        <th width="300">Acciones</th>
		        <th width="120">M�s Info</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.sponsors}" var="p" varStatus="i">
					<tr class="txt-${p.estado.classColor}">
			       		<td width="1%" class="bold size-18">${p.idPedido}</td>
			        	<td>
			        		${p.estado.descripcion}
			        		<input type="hidden" id="idEstadoViejo-${p.id}" value="${p.estado.idEstado}">
			        	</td>
			        	<td>${p.agenteSolicitante.apellido}, ${p.agenteSolicitante.nombre} <br> <small class="txt-oil">(${p.agenteSolicitante.dependenciaByIdDependenciaOper.centroCosto.descripcion})</small></td>
			        	<td>${p.titulo}</td>
			        	<td><small>${p.tipoPedidoWeb.descripcion}</small></td>
			        	<td>${p.tecnicoAsignado.nombre}</td>
			        	<td>
								<div class="secondary button-group small align-center">
									
								</div> 
							</td>
							<td>
								<div class="row">
									<div class="masInfo column small-4 shrink" id="idPedInfo-${p.idPedido}"><i class="mdi-action-info-outline size-24 txt-color" title="M�s Info"></i></div>							
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
