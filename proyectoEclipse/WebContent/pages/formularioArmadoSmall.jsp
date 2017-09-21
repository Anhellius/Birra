<%@ include file="/pages/taglibs.jsp" %>
 <stripes:form partial="true" beanclass="birra.controlador.actionBeans.PanelActionBean" > 
<div class="title bg-color3 panel txt-white">
	<h5>
		<span class="light">Pedido Num.</span>		
	</h5>
</div>

<div class="content">
<div id="divPedido" class="row">	
		<span>
			¿Esta seguro que desea ${actionBean.accion.transicion.descripcion} el/los pedido/s?
		</span>
		<input type="hidden" id="esSmall" value="true" />	
</div>
<div id="divTotal">
 	<c:forEach items="${actionBean.accion.campos}" var="campo" varStatus="i">
			
	<script>
		enviarCampo('${campo.agrupado}','<c:if test="${campo.type!='hidden' && campo.type!='cc' && campo.type!='hiddenTecnico'}">'+
	 	'<label for="${campo.id}">'+
	 	'	${campo.label}'+
	 	'</label>'+
		'</c:if>'+
	 	'<c:if test="${campo.type=='text'}">'+
	 	'	<stripes:text name="${campo.name}" id="${campo.id}" class="required"/>'+
	 	'</c:if>'+
	 	'<c:if test="${campo.type=='fecha'}">'+
	 	'	<stripes:text name="${campo.name}" id="${campo.id}" class="tieneFecha required"/>'+
	 	'</c:if>'+
		 '	<c:if test="${campo.type=='textarea'}">'+
		 '		<stripes:textarea name="${campo.name}" id="${campo.id}" rows="5" cols="40"></stripes:textarea>'+
		 '	</c:if>'+
		 '	<c:if test="${campo.type=='hidden'}">'+
		 '		<stripes:hidden name="${campo.name}" id="${campo.id}"/>'+
		 '	</c:if>'+
		 '	<c:if test="${campo.type=='cc'}">'+
		 '		<stripes:hidden name="${campo.name}" value="${actionBean.agente.agente.dependenciaByIdDependenciaOrg.centroCosto.centroCosto}" id="${campo.id}"/>'+
		 '	</c:if>'+
		 '	<c:if test="${campo.type=='hiddenTecnico'}">'+
		 '		<input type="hidden" name="${campo.name}" value="${actionBean.agente.agente.legajo}" id="${campo.id}"/>'+
		 '	</c:if>'+
		 '	<c:if test="${campo.type=='file'}">'+
		 '		<input type="file" name="${campo.name}" id="${campo.id}" class="required"/>'+
		 '	</c:if>'+
		 '	<c:if test="${campo.type=='select'}">'+
		 '		<stripes:select name="${campo.name}"  id="${campo.id}" class="required">   '+                         
		'			<stripes:option value="">Seleccione</stripes:option>'+
		'			<stripes:options-collection collection="${combo:getComboV(campo.id)}" value="id" label="descripcion" />'+                          
		'		</stripes:select>    '+
		'	</c:if>'+
		'<c:if test="${campo.type=='selectCondicion'}">'+
		'	<stripes:select name="${campo.name}"  id="${campo.id}" class="required" style="max-width:100%;">   '+
		'		<stripes:option value="-1">Seleccione</stripes:option>'+
		 	'	<c:forEach items="${combo:getComboVConID(campo.id,actionBean.agente.agente.dependenciaByIdDependenciaOrg.centroCosto.centroCosto)}" var="r" varStatus="i">'+	 			
		 	'		<stripes:option value="${r.id}" id="${r.cantidad}-${r.monto}-${r.total}">${r.idInversion}-${r.descripcion}</stripes:option>'+
		 	'	</c:forEach>'+
	 	'	</stripes:select>    '+
		'</c:if>'+
		 '	<c:if test="${campo.type=='radio'}">'+
	 		'	<c:forEach items="${combo:getComboV(campo.id)}" var="r" varStatus="i">'+
	 		'		<label for="${r.id}">'+
			'	 		${r.descripcion}'+
			'	 	</label>'+
	 		'		<stripes:radio class="required" name="${campo.name}" value="${r.id}" id="${campo.id}${r.id}" />'+
	 		'	</c:forEach>'+
		 	'</c:if>'+
		 	'<c:if test="${campo.type=='radioBoolean'}">'+ 			
	 		'		<label for="${r.id}">'+
			'	 		${r.descripcion}'+
			'	 	</label>'+
	 		'		Si<stripes:radio name="${campo.name}" value="1" id="${r.id}1" class="required" />'+
	 		'		No<stripes:radio name="${campo.name}" value="0" id="${r.id}0" />'+	 			
		 	'</c:if>'+
		 	'<c:if test="${campo.type=='checkbox'}">'+
		 	'	<stripes:checkbox value="1" name="${campo.name}" id="${campo.id}"/>'+
		 	'</c:if>',<c:if test="${campo.type!='hidden' && campo.type!='cc'}">'1'</c:if><c:if test="${campo.type=='hidden' || campo.type=='cc'}">'0'</c:if>);
			 </script>			 	
	</c:forEach>	
  
</div>

	</div>
		<div id="divLog">		
		     
		<!-- **************************desplegable Izquierda*******************  -->      
		          <div class="row expanded">
		            <div class="small-12 medium-12 columns">	            						
		              
		                <div id="divLogbirra">
		                	
		                </div>
		            </div>
		    </div>
	 </div>
	<div class="row cardAction collapse">
	  	<div class="small-12 column text-right"> 
	  		<div class="waves-effect btn-flat" data-close >CANCELAR</div>
	  		<div class="waves-effect btn-flat" id="grabar">ACEPTAR</div>
	  		
	  	</div>
	  </div>
	<stripes:hidden name="transicion.estadoByIdEstadoInicial.idEstado" id="idEstadoInicial" />
	<stripes:hidden name="transicion.estadoByIdEstadoFinal.idEstado" id="idEstadoFinal" />
	<div id="itemBorrables">
		
	</div>
</stripes:form>