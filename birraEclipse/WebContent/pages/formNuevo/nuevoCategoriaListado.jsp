<%@ include file="/pages/taglibs.jsp" %>
	<div class="grid-x grid-padding-x grid-padding-y">
		<div class="cell"><h3>Categoria Clasificado</h3></div>
	</div>
	<stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >

  		
		  		<div class="grid-x grid-padding-x material-forms">
					<div class="small-12 cell input-field">
						<stripes:hidden name="categoriaListado.idCategoriaListado"  />
						<stripes:text name="categoriaListado.descripcion" class="required" />
						<label class="active" for="categoriaListado.descripcion">Nombre de categoría de clasificados</label>												
					</div>
				</div>		
				<hr />			
		<div class="grid-container">
		  	<div class="grid-x grid-margin-x grid-padding-y align-center">	
		  		<div class="cell shrink">
		  			<div class="button hollow rounded"  data-close>CANCELAR</div>
		  		</div>
		  		<div class="cell shrink">				
					<stripes:button class="button rounded" value="Grabar" name="grabar" id="grabar"/>
				</div>
			</div>
		</div>
	
	</stripes:form>

<script>
	$(document).ready(function() {
		
	});  
</script>
