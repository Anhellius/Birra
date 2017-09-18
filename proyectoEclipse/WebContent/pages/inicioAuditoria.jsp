<%@ include file="/pages/taglibs.jsp" %>
<div class="small-12 column"> 
<stripes:form method="POST" id="formBusquedaHorasExtras" beanclass="ar.gob.inti.birra.controlador.actionBeans.PanelActionBean">         
	<fieldset class="fieldset sombra-1">
	<h3>Buscador</h3> 
	    <div class="row expanded color-scheme-color3">
	    
			     <div class="small-12 large-5 column input-md-1 vHeight">
				     <input type="text" id="fechaDesde" name="comboFecha.fechaDesde" class="with-floating-label">
				   	 <label for="legajoConsulta" class="floating-label light">Fecha Desde</label>
			    </div>			    
			    
			   <div class="small-12 large-5 column input-md-1 vHeight">
				     <input type="text" id="fechaHasta" name="comboFecha.fechaHasta" class="with-floating-label">
				   	 <label for="legajoConsulta" class="floating-label light">Fecha Hasta</label>
			    </div>	
		    
			    <div class="small-12 large-2 column input-md-1 vHeight ">    
			  		  <div class="button expanded" id="buscarAuditoria"><i class="mdi-action-search"></i> Buscar</div>    
			    </div>
	    </div>
	</fieldset>
</stripes:form>    
 
	<div id="resultadoBusquedaHorasExtras">
	
	</div>


</div>      
<script>
$(document).ready(function() {
 	 $('#fechaDesde').datepicker( {					
 		dateFormat: 'dd/mm/yy'
	 });

 	 $('#fechaHasta').datepicker( {					
  		dateFormat: 'dd/mm/yy'
 	 });
});
</script>          


