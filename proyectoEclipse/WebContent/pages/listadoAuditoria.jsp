<%@ include file="/pages/taglibs.jsp" %>

<div class="small-12 columns vHeight">
<h3 class="light">Resultado de la Búsqueda</h3>
</div>
<!--<div class="small-12 columns vHeight text-right">
 <div class="button hollow excel"  id="exportarExcel"> <i class="mdi-action-get-app"></i> Exportar busqueda a excel</div>
</div>-->
<div class="small-12 columns color-scheme-color12">
<table class="material-table scroll sombra-1 hover vHeight" id="tablaWebAuditoria">
      <thead>
      <tr class="txt-oil">
        <th width="400">Pedido de Ref.</th>
        <th width="500">Responsable Pedido</th>
        <th width="300">Fecha Pedido</th>
        <th width="500">Aprobado Por</th>
        <th width="300">Fecha Aprob.</th>
        <th width="500">Resp. Pasaje a Prod.</th>
        <th width="300">Fecha Pasaje a Prod.</th>
      </tr>
      </thead>
      <tbody>
		<c:forEach items="${actionBean.listadoPedidos}" var="p" varStatus="i">
			<tr class="txt-oil">
	       		<td><span class="bold txt-color">${p.idPedido} </span> | <small>${p.tipoPedidoWeb}</small></td>
	        	<td>${p.responsablePedido}</td>
	        	<td><fmt:formatDate value="${p.fechaPedido}" pattern="dd/MM/yyyy"/></td>
	        	<td>${p.aprobadoPor}</td>
	        	<td><fmt:formatDate value="${p.fechaAprobacion}" pattern="dd/MM/yyyy"/></td>
	        	<td>${p.responsableProduccion}</td>
				<td><fmt:formatDate value="${p.fechaPasajeProduccion}" pattern="dd/MM/yyyy"/></td>
	      </tr>
		</c:forEach>	     
	</tbody>
    </table>
</div>
<script>
$(document).ready(function() {

	$.fn.dataTable.moment('D/MM/YYYY');
	$('#tablaWebAuditoria').DataTable({
		 "language": {"url": "pages/js/Spanish.lang"},
		 dom:"<'#tablaweb.expanded row'<'shirnk columns'l><'shrink columns'f><'small-5'>B>"+
			"<'row expanded't>"+
			"<'row'<'small-6 columns'i><'small-6 columns'p>>",
         "lengthMenu": [[10,25,50,-1],['10','25','50','Todos']],
		 "buttons": [
			{
			    extend: 'excelHtml5',
			    exportOptions: {
			       columns: [ 0, 1,2,3,4,5,6]
			    },
			    title:'Listado_Auditoria_'+traerFechaActual()
			},
			{
			    extend: 'pdfHtml5',
			    exportOptions: {
			       columns: [ 0, 1,2,3,4,5,6]
			    },
			    title:'Listado_Auditoria_'+traerFechaActual()
			},
            {
            	extend:    'print',
                text:      'Imprimir',
                exportOptions: {
                    columns: [ 0, 1,2,3,4,5,6]
                 },
                 title:'Listado_Auditoria_'+traerFechaActual()
             }
             
        ]
	});
		
});
</script>