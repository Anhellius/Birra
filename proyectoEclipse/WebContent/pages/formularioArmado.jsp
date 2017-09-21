<%@ include file="/pages/taglibs.jsp" %>
 <stripes:form partial="true" beanclass="birra.controlador.actionBeans.PanelActionBean" > 
<div class="title bg-color3 panel txt-white" id="divPedido">

	<h4>
	<c:if test="${actionBean.pweb.idPedido==null}">
		Nuevo Pedido
	</c:if>
	<c:if test="${actionBean.pweb.idPedido!=null}">
		Pedido #${actionBean.pweb.idPedido} 		
	</c:if>
	
	</h4>
</div>


<div id="divTotal">
 	<c:forEach items="${actionBean.accion.campos}" var="campo" varStatus="i">
			
	<script>
		enviarCampo('${campo.agrupado}','<c:if test="${campo.type!='hidden' && campo.type!='cc' && campo.type!='hiddenTecnico' && campo.type!='textSinLabel'}">'+
	 	'<label for="${campo.id}">'+
	 	'	${campo.label}'+
	 	'</label>'+
		'</c:if>'+
	 	'<c:if test="${campo.type=='text'}">'+
		 	'<stripesDin:text name="${campo.name}" id="${campo.id}" class="required" data-rule-maxlength="${campo.maxlength}"/>'+		 	
	 	'</c:if>'+
	 	'<c:if test="${campo.type=='textSinLabel'}">'+
		 	'<stripesDin:text name="${campo.name}" id="${campo.id}" class="required" data-rule-maxlength="${campo.maxlength}"/>'+		 	
	 	'</c:if>'+	 	
	 	'<c:if test="${campo.type=='fecha'}">'+
	 	'	<stripes:text name="${campo.name}" id="${campo.id}" class="tieneFecha required"/>'+
	 	'</c:if>'+
		 '	<c:if test="${campo.type=='textarea'}">'+
		 '		<stripesDin:textarea name="${campo.name}" id="${campo.id}" class="required" data-rule-maxlength="${campo.maxlength}"></stripesDin:textarea>'+
		 '	</c:if>'+
		 '	<c:if test="${campo.type=='hidden'}">'+
		 '		<stripes:hidden name="${campo.name}" id="${campo.id}"/>'+
		 '	</c:if>'+
		 '	<c:if test="${campo.type=='hiddenTecnico'}">'+
		 '		<stripes:hidden name="${campo.name}" value="${actionBean.agente.agente.legajo}" id="${campo.id}"/>'+
		 '	</c:if>'+
		 '	<c:if test="${campo.type=='cc'}">'+
		 '		<stripes:hidden name="${campo.name}" value="${actionBean.agente.agente.dependenciaByIdDependenciaOrg.centroCosto.centroCosto}" id="${campo.id}"/>'+
		 '	</c:if>'+
		 '	<c:if test="${campo.type=='file'}">'+
		 '		<input type="file" name="${campo.name}" id="${campo.id}" class="required"/>'+
		 '	</c:if>'+
		'<c:if test="${campo.type=='select'}">'+
		'	<stripes:select name="${campo.name}"  id="${campo.id}" class="required">   '+                         
		'		<stripes:option value="">Seleccione</stripes:option>'+
		'		<stripes:options-collection collection="${combo:getComboV(campo.id)}" value="id" label="descripcion" />'+                          
		'	</stripes:select>    '+
		'</c:if>'+
		'<c:if test="${campo.type=='selectBigInt'}">'+
		'	<stripes:select name="${campo.name}"  id="${campo.id}" class="required">   '+                         
		'		<stripes:option value="">Seleccione</stripes:option>'+
		'		<stripes:options-collection collection="${combo:getComboV(campo.id)}" value="idBig" label="descripcion" />'+                          
		'	</stripes:select>    '+
		'</c:if>'+		
		'<c:if test="${campo.type=='selectCondicion'}">'+
		'	<stripes:select name="${campo.name}"  id="${campo.id}" class="required" style="max-width:100%;">   '+
		'		<stripes:option value="-1">Seleccione</stripes:option>'+
		'	<c:forEach items="${combo:getComboVConID(campo.id,actionBean.agente.agente.dependenciaByIdDependenciaOrg.centroCosto.centroCosto)}" var="r" varStatus="i">'+	 			
		'		<stripes:option value="${r.idInversion}" id="${r.cantidad}-${r.monto}-${r.total}">${r.idInversion}-${r.descripcion}</stripes:option>'+
		'	</c:forEach>'+
	 	'	</stripes:select>    '+
		'</c:if>'+
		'<c:if test="${campo.type=='radio'}">'+
	 	'	<c:forEach items="${combo:getComboV(campo.id)}" var="r" varStatus="i">'+
	 	'		<stripes:radio class="required" name="${campo.name}" value="${r.id}" id="${campo.id}${r.id}" />'+
	 	'		<label for="${campo.id}${r.id}">'+
		'	 		${r.descripcion} '+
		'	 	</label><br>'+
	 	'	</c:forEach>'+
		'</c:if>'+
		'<c:if test="${campo.type=='radioBoolean'}">'+
	 	'		<stripes:radio name="${campo.name}" value="1" id="${campo.id}1" class="required" /> Si  '+
	 	'		<stripes:radio name="${campo.name}" value="0" id="${campo.id}0" /> No'+	 			
		'</c:if>'+
		'<c:if test="${campo.type=='checkbox'}">'+
		'	<stripes:checkbox value="1" name="${campo.name}" id="${campo.id}"/>'+
		'</c:if>',<c:if test="${campo.type!='hidden' && campo.type!='cc'}">'1'</c:if><c:if test="${campo.type=='hidden' || campo.type=='cc'}">'0'</c:if>);
		
			 </script>			 	
	</c:forEach>	
  
</div>
	<div id="divPedidoNuevo" class="content">
		
		     
		<!-- **************************desplegable Izquierda*******************  -->      
		          <div class="row expanded">
		            <div class="small-12 medium-6 columns">
						<h4 class="light">Motivo</h4>
		               <label>
		                  <stripes:select name="pweb.tipoPedidoWeb.idTipoPedidoWeb"  id="tipoPedidoWeb" class="required"> 
		                  		<stripes:option value="" >Seleccione</stripes:option>                           
								<stripes:options-collection collection="${comboVista:getComboVista(\"vTipoPedidoWeb\")}" value="id" label="descripcion" />                         
							</stripes:select>
		                </label>
		            </div>
		
		<!-- **************************tarjeta Derecha Subir Archivo*******************  -->      
		
		          <div class="small-12 medium-6 columns ">
		          <h4 class="light">Responsable <small class="txt-innovacion"> (Usuario Mail del Responsable a Cargo)</small></h4>
		         	<div class="row collapse">
		         		<div class="small-12 large-5 columns">
			           	<label>
	        				<input type="text" name="pweb.responsable.mail" id="mailResponsablebirra" placeholder="Usuario Mail Responsable" class="required">
	        				<input type="hidden" name="pweb.responsable.legajo" id="legajoResponsablebirra" value="">
	      				</label>		
      				</div>
      				<div class="small-12 large-7 columns color-scheme-color3">
      				 	<span class="txt-white label"><i class="mdi-action-account-box size-28 txt-white"></i></span>
      				 	<span class="lead txt-color" id="birraLabelResponsable"> </span>
      				</div>
      				</div>
		          </div>    
		          </div>
		          <div class="row expanded vHeight">
		          <div class="small-12 columns">
		           	<h4 class="light">Titulo<small class="txt-innovacion"></small></h4>
		           	</div>
		          <div class="small-12">
			          <label id="divTitulobirra"> 
			          </label>
		           </div>
		          </div>
		          
		          <div class="row expanded vHeight">
		          <div class="small-12 columns">
		           	<h4 class="light">Especificaciones del pedido<small class="txt-innovacion"> (Agregar comentarios del Pedido)</small></h4>
			          <label>
			             <textarea placeholder="Comentarios" name="pweb.comentario" rows="10" cols="40"></textarea>
			          </label>
		           </div>
		          </div>
		          <div class="row expanded">
		          <div class="small-12 columns color-scheme-color3">
		          <hr>
		            <div class="row sombra-1">
		               <div id="divMotivo1" class="classMotivos content" style="display:none">
			                <div class="small-12 medium-8 columns"> 
			               		 <h5 class="light txt-color" id="labelMotivoPedido">Subir Archivos</h5>
			               </div>
			               <div class="small-12 medium-8 columns" id="soloParaSubirArchivos"> 
			                 	<span class="txt-innovacion">Tipo de adjunto: </span>
			                  <input type="radio" name="tipoAdjunto" value="Reemplazar" id="adjuntoModificar" required><label for="adjuntoModificar">Existente</label>
			                  <input type="radio" name="tipoAdjunto" value="Nuevo" id="adjuntoNuevo"><label for="adjuntoNuevo">Nuevo</label>
			                </div>
			               
			                 <div class="small-12 medium-8 columns vHeight motivo1Adjunto">
			                 <div class="callout bg-vapor ">
			                 <span class="txt-innovacion bold"> Extensiones: </span>
			                 <span class="txt-word"> .doc</span>
			                 <span class="txt-word"> .docx</span>
			                 <span class="txt-pdf"> .pdf</span>
			                 <span class="txt-excel"> .xls</span>
			                 <span class="txt-excel"> .xlsx</span>
			                 <span class="txt-excel"> .xlsm</span>
			                 <span class="txt-electronica"> .jpg</span>
			                 <span class="txt-electronica"> .jpeg</span>
			                 <span class="txt-quimica"> .mp4</span>
			                 <span class="txt-construccion"> .png</span>
			                 <span class="txt-construccion"> .zip</span>
			                 <span class="txt-construccion"> .rar</span>
			                 <span class="txt-construccion"> .htm</span>
			                 <span class="txt-construccion"> .html</span>
			                 </div>	                 
			                 </div>
			                <div class="expanded row">  
				               <div class="small-12 large-6 columns motivo1Adjunto"> 
				               <span class="txt-innovacion"><span class="badge bg-recursos txt-white">1</span> Seleccione el Archivo que desea</span> 
					              <div class="expanded row collapse">
					              	<div class="small-12 large-9 columns vHeight ">
					              	
					              	 <input type="file" id="adjunto" class="show-for-sr" extension="png|jpeg|jpg|mp4|xls|xlsx|xlsm|doc|docx|pdf|html|htm|zip|rar">
					              	</div> 
					              	<div class="small-12 large-3 columns vHeight "> 
					              	 <label id="labelDeAdjunto" for="adjunto" class="button expanded secondary">Examinar </label>
					               	</div>
					              </div>
				              </div>
				              <div class="small-12 large-6 columns motivo1Link">
				              	<span class="txt-innovacion"><span class="badge bg-recursos txt-white">2</span> Especifique el link </span>			               
				                <div class="input-group vHeight">
				                  <span class="input-group-label">http://</span>
				                    <input id="linkReferencia" type="text" class="input-group-field" placeholder="Link de Referencia" aria-required="true">
				                </div>   
				              </div>
				               <div class="small-12 medium-4 columns" id="divBtnAdjuntar">
				              
			                 	<input class="button text-center" type="button" value="Adjuntar" id="birraAgregarAdjunto" />	
			                 </div>
			             </div>
			                
			               <hr>
			              <div class="small-12 columns">
			                <table class="material-table scroll ">
			                  <thead>
			                    <tr class="txt-oil">
			                      <th>N°</th>
			                      <th width="500">Archivo</th>
			                      <th width="500">Link Ref</th>
			                      <th width="200">Eliminar</th>
			                    </tr>
			                  </thead>
			                  <tbody id="birraTbodyAdjunto">
			                   
			                  </tbody>
			                </table>
			              </div>
		              </div>
		
				</div>
		          </div> 
		          </div>
			</div>
		
		
	</div>
	<div class="row cardAction collapse">
		  	<div class="small-12 column text-right"> 
		  		<div class="waves-effect btn-flat" data-close >CANCELAR</div>
		  		<div class="waves-effect btn-flat" id="grabar">ENVIAR</div>
		  		
		  	</div>
		  </div>
	<stripes:hidden name="transicion.estadoByIdEstadoInicial.idEstado" id="idEstadoInicial" />
	<stripes:hidden name="transicion.estadoByIdEstadoFinal.idEstado" id="idEstadoFinal" />
	<input type="hidden" id="cantidadAdjuntoReal" value="-1" />
	<input type="hidden" id="cantidadAdjunto" value="${fn:length(actionBean.pweb.adjuntos)-1}" />
	<input type="hidden" id="cantidadAdjuntoBorrable" value="0" />

	<div id="itemBorrables">	
	
	</div>
	
</stripes:form>