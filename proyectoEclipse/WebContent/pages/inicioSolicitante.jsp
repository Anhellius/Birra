<%@ include file="/pages/taglibs.jsp" %>
<div class="small-12 column"><br>
<h2 class="light">Pedidos Web</h2>
</div>
<c:set var="puedeIngresarPedido" value="false" />
<c:forEach items="${actionBean.agente.roles}" var="r">
	<c:forEach items="${r.transicions}" var="t">
		<!-- Aca se filtra por el numero de transicion que tiene permitido cargar un pedido --> 
		<c:if test="${t.idTransicion==1}">
			<c:set var="puedeIngresarPedido" value="true" />
		</c:if>
	</c:forEach>
</c:forEach>
<div class="expanded row align-right ">
	<div class="column shrink vHeight">
		<c:if test="${puedeIngresarPedido}">
			<div class="btn-large waves-effect bg-color3 waves-light transicionable" id="0-1-1">Nuevo pedido</div> 
		</c:if>
	</div>
	<br>
</div>

<div class="small-12 columns vHeight">

    <table class="material-table scroll sombra-1 hover" id="pedidos">
      <thead>
      <tr class="txt-oil">
        <th width="50">N°</th>
        <th width="350">Estado</th>
        <th width="850">Titulo</th>
        <th width="550">Profesional Asignado</th>
        <th width="500">Acciones</th>
        <th width="100">Más Info</th>
      </tr>
      </thead>
      <tbody>
		<c:forEach items="${actionBean.listadoPedidos}" var="p" varStatus="i">
			<tr class="txt-${p.estado.classColor}">
	       		<td width="1%" class="bold size-18">${p.idPedido}</td>
	        	<td>
	        		${p.estado.descripcion}
	        		<input type="hidden" id="idEstadoViejo-${p.id}" value="${p.estado.idEstado}">
	        	</td>
	        	<td>${p.titulo}</td>
	        	<td><c:if test="${p.tecnicoAsignado.apellido!=null}"><span class="bold">${p.tecnicoAsignado.apellido},</span> ${p.tecnicoAsignado.nombre}</c:if></td>
	        	<td>
						<div class="secondary button-group small align-center">
							<c:forEach items="${p.estado.transicionsForIdEstadoInicial}" var="transi" varStatus="j">
							
	  							<div class="button transicionable" id="${p.id}-${transi.idTransicion}-${transi.estadoByIdEstadoFinal.idEstado}">${transi.descripcion}</div>							
							
							</c:forEach>
						</div> 
					</td>
					<td>
						<div class="row">
							<div class="masInfo column small-4 shrink" id="idPedInfo-${p.idPedido}"><i class="mdi-action-info-outline size-24 txt-color"></i></div>							
						</div>
					</td>
	      </tr>
		</c:forEach>	     
	</tbody>
    </table>
  </div>
<script>
$(document).ready(function() {
 	 $('#pedidos').dataTable( {					
	    "lengthMenu": [[10, 25, 50,100, -1], [10, 25, 50,100, "Todos"]],
	    "order": [[ 0, "desc" ]],				     
		"language": {
			"url": "https://www.inti.gob.ar/js/Spanish.lang"
		}
	});
});
</script>
   
   
