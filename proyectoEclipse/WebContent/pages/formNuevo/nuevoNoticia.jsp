<%@ include file="/pages/taglibs.jsp" %>
	<div class="title bg-color5 panel txt-white">
		<h3>Noticia</h3>
	</div>
  	<stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >
	  	<div class="row expanded">
	 		<div class="small-12 columns">	  		
		  		<div class="row expanded vHeight" >
					<div class="small-12 column">
						<h5>Tipo Contribución:</h5>			
						<stripes:radio name="contribucion.tipoContribucion.idTipoContribucion" id="tipoC1" class="required" value="1" />
						<label for="tipoC1">
							POA
						</label>
						<stripes:radio name="contribucion.tipoContribucion.idTipoContribucion" id="tipoC2" value="2" />
						<label for="tipoC2">
							PD
						</label>
						<hr>
					</div>
				</div>					
					
			</div>
		</div>	
		<div class="row expanded align-center vHeight">				
			<stripes:button class="button bg-color3" value="Grabar" name="grabar" id="grabar"/>
		</div>
	
	</stripes:form>

<script>
	$(document).ready(function() {
		
	});  
</script>
