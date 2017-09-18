<%@ include file="/pages/taglibs.jsp" %>
<div class="title bg-${actionBean.pweb.estado.classColor} panel txt-white">
  <h3>
  		<small class="txt-white thin">Detalle Solicitud N°:</small>
  	    <span class="bold">  ${actionBean.pweb.idPedido}</span>   
  	    <small class="txt-white thin""> ${actionBean.pweb.titulo}</small> 
  </h3>
</div>

  
<!-- /************************************************************** -->


  <div class="row content vHeight color-scheme-${actionBean.pweb.estado.classColor}">
      <div class="small-12 medium-4 column sombra-1 content bg-${actionBean.pweb.estado.classColor}">
        <div class="row txt-white title ">
        <div class="small-12 column">
                <div class="expanded row collapse ">
                  <div class="column shrink"><i class="mdi-action-account-circle size-22 txt-white"></i> </div>
                  <div class="column align-self-middle ">
                  <span class="size-24 txt-white ">&nbsp;${actionBean.pweb.agenteSolicitante.apellido}, ${actionBean.pweb.agenteSolicitante.nombre}</span>
                  </div>
                </div>
        </div>
        <div class="small-12 column vHeight">
                  <span class="txt-white light"><i class="mdi-maps-local-offer"></i> ${actionBean.pweb.agenteSolicitante.legajo}</span> <br>
                  <span class="light txt-white"><i class="mdi-communication-call"></i> ${actionBean.pweb.agenteSolicitante.interno}</span> <br>
                  <a href="mailto:${actionBean.pweb.agenteSolicitante.mail}@inti.gob.ar"> <span class="light txt-white"><i class="mdi-communication-email"></i> ${actionBean.pweb.agenteSolicitante.mail}@inti.gob.ar</span></a> <br>
                  <span class="light txt-white"><i class="mdi-communication-business"></i> ${actionBean.pweb.agenteSolicitante.dependenciaByIdDependenciaOper.centroCosto.descripcion}</span>
                    
         </div>      
        </div>
      </div>

      <div class="small-12 medium-8 columns sombra-1 content">
        <div class="row title">
          <div class="small-12 medium-6 column">
          <span class="label">
          		<fmt:formatDate value="${actionBean.pweb.logs[0].fecha}" pattern="dd/MM/yyyy"/>
          </span>
          <h4 class="light txt-oil">
            ${actionBean.pweb.tipoPedidoWeb.descripcion}</h4>
          <h5 class="txt-color light">
            <i class="mdi-hardware-headset-mic"></i> ${actionBean.pweb.tecnicoAsignado.apellido}, ${actionBean.pweb.tecnicoAsignado.nombre}</h5>
          </div>
          
            <div class="small-12 medium-6 callout bg-vapor vHeight column">
          		<h6 class="light txt-oil"> <i class="mdi-action-account-box size-22 txt-color"></i> Responsable del la Solicitud</h6>
        		<span class="bold">${actionBean.pweb.responsable.apellido} ${actionBean.pweb.responsable.nombre}</span><br>
            	<span class="light"><i class="mdi-communication-call"></i> ${actionBean.pweb.responsable.interno} </span><br> 
            	<a href="mailto:${actionBean.pweb.responsable.mail}@inti.gob.ar"> <span class="light"><i class="mdi-communication-email"></i> ${actionBean.pweb.responsable.mail}@inti.gob.ar</span></a>
          	</div>
          <div class="small-12 column">
          <hr>
          <span class="txt-oil bold"><i class="mdi-communication-chat"></i> Detalle de solicitud</span>
          </div>
          <div class="small-12 column vHeight">
          	<span class="txt-innovacion">
				${actionBean.pweb.comentario}
			</span>
          </div>
        
        </div>
        
      </div>
        <div class="small-12 column vHeight sombra-1">
          <h5 class="title txt-oil"><i class="mdi-action-assignment-returned"></i> Archivos Subidos</h5>
          <table class="material-table scroll">
                  <thead>
                    <tr class="txt-oil">
                      <th width="400">Archivo</th>
                      <th width="600">Link</th>
                      <th width="50" class="txt-color">Descargar</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${actionBean.pweb.adjuntos}" var="pa" varStatus="i">
                    <tr>
                      <td><small>${pa.nombreArchivo }</small></td>
                      <td><a href="#">${pa.linkReferencia }</a></td>
                      <td class="text-center">
                      		<c:if test="${pa.nombreArchivo != null}">
	                      		<a href="abridor?idPedido=${pa.pedido.idPedido}&idAdjunto=${pa.idAdjunto}" target="_blank">
				            		<i class="mdi-file-file-download size-22" title="Descargar"></i>
				            	</a>
			            	</c:if>
						</td>
                    </tr>
                   </c:forEach> 
                  </tbody>
                </table>
          </div>
      
      <div class="small-12 column vHeight sombra-1">
      <div class="no-print " id="divLog">
      <h5 class="title txt-color light"><i class="mdi-action-history"></i> Historial de Solicitud N°<span class="bold"> ${actionBean.pweb.idPedido}</span></h5>
		<table id="tablaLog" class="material-table scroll " cellspacing="0">
			<thead>
				<tr>
					<th width="250">Fecha</th>
					<th width="300">Estado</th>					
					<th width="300">Usuario</th>
					<th width="600">Comentario</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${actionBean.pweb.logs}" var="log" varStatus="i">
				<tr class="tr-${log.idLog}">
					<td>
						<small><fmt:formatDate value="${log.fecha}" pattern="dd/MM/yyyy - HH:mm:ss"/></small>
					</td>
					<td>
						${log.estadoByIdEstadoNuevo.descripcion}
					</td>
					<td>					
						${log.agente.nombre} ${log.agente.apellido}						
					</td>
					<td class="txt-innovacion">
						${log.comentario}
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
      
      



  </div>

<script>
$(document).ready(function() {
    
});  
</script>

