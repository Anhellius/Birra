<%@ include file="/pages/taglibs.jsp" %>
<div class="off-canvas-wrapper">
    <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
    	<div class="off-canvas-content" data-off-canvas-content>
    	<div class="row expanded">
    	<div class="small-12 columns ">
		    	<br><h2 class="light">Pedidos Web</h2><br>
		    </div>
		    <div class="small-12 medium-8 columns content-2 vHeight">
		    <span class="label bg-innovacion">Listado Web</span>
			 <div class="expanded row small-up-2 medium-up-4 large-up-5 text-center txt-innovacion">
		    <div class="column color-scheme-color7 sombra-1 content">
		    		<small>SIN ASIGNAR</small>  <br> 
		    		<i class="mdi-communication-live-help size-28 txt-color"></i>
		    		<br><span class="txt-color size-48 bold">${actionBean.listaDeListasDeResumen[0][0].cantidad}</span>
		    </div>
		    <div class="column color-scheme-color8 sombra-1 content"><small>ABIERTOS</small>  <br> <i class="mdi-action-assignment-ind size-28 txt-color"></i> <br><span class="txt-color size-48 bold">${actionBean.listaDeListasDeResumen[0][1].cantidad}</span></div>
		    <div class="column color-scheme-color9 sombra-1 content"><small>UAT</small>  <br> <i class="mdi-communication-chat size-28 txt-color"></i> <br><span class="txt-color size-48 bold">${actionBean.listaDeListasDeResumen[0][2].cantidad}</span></div>
			<div class="column color-scheme-color10 sombra-1 content"><small class="txt-innovacion">APROBADO</small>  <br> <i class="mdi-communication-forum size-28 txt-color"></i> <br><span class="txt-color size-48 bold">${actionBean.listaDeListasDeResumen[0][3].cantidad}</span></div>
			<div class="column color-scheme-color12 sombra-1 content"><small>CERRADOS</small>  <br> <i class="mdi-file-cloud-done size-28 txt-color"></i> <br><span class="txt-color size-48 bold">${actionBean.listaDeListasDeResumen[0][4].cantidad}</span></div>
			</div>
			</div>
			 <div class="small-12 medium-4 columns  content-2 vHeight">
			 <span class="label bg-innovacion">Listado ${actionBean.agente.agente.nombre }</span>
			 <div class="expanded row small-up-1 medium-up-4 large-up-3 text-center sombra-1 txt-oil">
		    <div class="column color-scheme-color8 content"><small>ABIERTOS</small>  <br>
		   	  <i class="mdi-action-assignment-ind size-28 txt-color"></i> <br><span class="txt-color size-48 bold">${actionBean.listaDeListasDeResumen[1][0].cantidad}</span>
		     </div>
		    <div class="column color-scheme-color9 content"><small>UAT</small>  <br> 
		    	<i class="mdi-communication-chat size-28 txt-color"></i> <br>
		    	<span class="txt-color size-48 bold">${actionBean.listaDeListasDeResumen[1][1].cantidad}</span>
		    </div>
			<div class="column color-scheme-color10 content">
				<small class="txt-oil">APROBADO</small>  <br> 
				<i class="mdi-communication-forum size-28 txt-color"></i> <br>
				<span class="txt-color size-48 bold">${actionBean.listaDeListasDeResumen[1][2].cantidad}</span>
			</div>
			</div>
			</div>
			</div>
		<br>
			
			<div class="row expanded vHeight"><br>
			    <ul class="tabs" data-tabs id="example-tabs">
				  <li class="tabs-title is-active"><a href="#panel1" aria-selected="true" class="size-16"><span class="txt-oil">Asignados a ${actionBean.agente.agente.nombre }</span></a></li>
				  <li class="tabs-title"><a href="#panel2" class="size-16"><span class="txt-oil">Sin asignar pendientes</span></a></li>
				  <li class="tabs-title"><a href="#panel3" class="size-16"><span class="txt-oil">Casos asignados abiertos</span></a></li>
				  <li class="tabs-title"><a href="#panel4" class="size-16"><span class="txt-oil">Histórico</span></a></li>
				</ul>
		 
		    		   
<!-- ************* Fin Modal Nueva Solicitud*********** -->
  <div class="tabs-content" data-tabs-content="example-tabs">
	  <div class="tabs-panel is-active" id="panel1">
		  <div class="small-12 columns vHeight">
		    <table class="material-table scroll sombra-1 hover tablaweb" id="tablaweb">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N°</th>
		        <th width="250">Estado</th>
		        <th width="500">Solicitante</th>
		        <th width="850">Titulo</th>
		        <th width="350">Tipo Pedido</th>
		        <th width="850">Profesional Asignado</th>
		        <th width="300">Acciones</th>
		        <th width="120">Más Info</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.listaDeListasDePedidos[0]}" var="p" varStatus="i">
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
									<c:forEach items="${p.estado.transicionsForIdEstadoInicial}" var="transi" varStatus="j">
										<c:if test="${transi.idTransicion!=11}">
			  								<div class="button transicionable" id="${p.id}-${transi.idTransicion}-${transi.estadoByIdEstadoFinal.idEstado}">${transi.descripcion}</div>							
										</c:if>
									</c:forEach>
								</div> 
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
		<div class="tabs-panel is-active" id="panel2">
		  <div class="small-12 columns vHeight">
		    <table class="material-table scroll sombra-1 hover tablaweb" id="tablaweb2">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N°</th>
		        <th width="250">Estado</th>
		        <th width="500">Solicitante</th>
		        <th width="850">Titulo</th>
		        <th width="350">Tipo Pedido</th>
		        <th width="850">Profesional Asignado</th>
		        <th width="300">Acciones</th>
		        <th width="120">Más Info</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.listaDeListasDePedidos[1]}" var="p" varStatus="i">
					<tr class="txt-${p.estado.classColor}">
			       		<td width="1%" class="bold size-18">${p.idPedido}</td>
			        	<td>
			        		${p.estado.descripcion}
			        		<input type="hidden" id="idEstadoViejo-${p.id}" value="${p.estado.idEstado}">
			        	</td>
			        	<td>${p.agenteSolicitante.apellido}, ${p.agenteSolicitante.nombre} <br>  <small class="txt-oil">(${p.agenteSolicitante.dependenciaByIdDependenciaOper.centroCosto.descripcion})</small></td>
			        	<td>${p.titulo}</td>
			        	<td><small>${p.tipoPedidoWeb.descripcion}</small></td>
			        	<td>${p.tecnicoAsignado.nombre}</td>
			        	<td>
								<div class="secondary button-group small align-center">
									<c:forEach items="${p.estado.transicionsForIdEstadoInicial}" var="transi" varStatus="j">
									
			  							<div class="button transicionable" id="${p.id}-${transi.idTransicion}-${transi.estadoByIdEstadoFinal.idEstado}">${transi.descripcion}</div>							
									
									</c:forEach>
								</div> 
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
		
		<div class="tabs-panel is-active" id="panel3">
		  <div class="small-12 columns vHeight">
		    <table class="material-table scroll sombra-1 hover tablaweb" id="tablaweb3">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N°</th>
		        <th width="250">Estado</th>
		        <th width="500">Solicitante</th>
		        <th width="850">Titulo</th>
		        <th width="350">Tipo Pedido</th>
		        <th width="850">Profesional Asignado</th>
		        <th width="300">Acciones</th>
		        <th width="120">Más Info</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.listaDeListasDePedidos[2]}" var="p" varStatus="i">
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
									<c:forEach items="${p.estado.transicionsForIdEstadoInicial}" var="transi" varStatus="j">
									
			  							<div class="button transicionable" id="${p.id}-${transi.idTransicion}-${transi.estadoByIdEstadoFinal.idEstado}">${transi.descripcion}</div>							
									
									</c:forEach>
								</div> 
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
		
		<div class="tabs-panel is-active" id="panel4">
		  <div class="small-12 columns vHeight">
		    <table class="material-table scroll sombra-1 hover tablaweb" id="tablaweb4">
		      <thead>
		      <tr class="txt-oil">
		        <th width="50">N°</th>
		        <th width="250">Estado</th>
		        <th width="500">Solicitante</th>
		        <th width="850">Titulo</th>
		        <th width="350">Tipo Pedido</th>
		        <th width="850">Profesional Asignado</th>
		        <th width="300">Acciones</th>
		        <th width="120">Más Info</th>
		      </tr>
		      </thead>
		      <tbody>
				<c:forEach items="${actionBean.listaDeListasDePedidos[3]}" var="p" varStatus="i">
					<tr class="txt-${p.estado.classColor}">
			       		<td width="1%" class="bold size-18">${p.idPedido}</td>
			        	<td>
			        		${p.estado.descripcion}
			        		<input type="hidden" id="idEstadoViejo-${p.id}" value="${p.estado.idEstado}">
			        	</td>
			        	<td>${p.agenteSolicitante.apellido}, ${p.agenteSolicitante.nombre} <br>  <small class="txt-oil">(${p.agenteSolicitante.dependenciaByIdDependenciaOper.centroCosto.descripcion})</small></td>
			        	<td>${p.titulo}</td>
			        	<td><small>${p.tipoPedidoWeb.descripcion}</small></td>
			        	<td>${p.tecnicoAsignado.nombre}</td>
			        	<td>
								<div class="secondary button-group small align-center">
									<c:forEach items="${p.estado.transicionsForIdEstadoInicial}" var="transi" varStatus="j">
										<c:if test="${p.estado.idEstado!=4 && transi.idTransicion!=7}">
			  								<div class="button transicionable" id="${p.id}-${transi.idTransicion}-${transi.estadoByIdEstadoFinal.idEstado}">${transi.descripcion}</div>							
										</c:if>
									</c:forEach>
								</div> 
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
