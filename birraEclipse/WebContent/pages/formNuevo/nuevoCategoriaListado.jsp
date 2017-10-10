<%@ include file="/pages/taglibs.jsp" %>
	<div class="title bg-color5 panel txt-white">
		<h3>Categoria Clasificado</h3>
	</div>
	<stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >
	  	<div class="row expanded">
	 		<div class="small-12 columns">	  		
		  		<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Nombre de categoría de clasificados</label>
						<stripes:hidden name="categoriaListado.idCategoriaListado"  />
						<stripes:text name="categoriaListado.descripcion" class="required" />						
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
