<%@ include file="/pages/taglibs.jsp" %>
	<div class="grid-x grid-padding-x grid-padding-y">
		<div class="cell"><h3>Categoria Noticia</h3></div>
	</div>
  	<stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >

	  		
		  		<div class="grid-x grid-padding-x material-forms">
					<div class="small-12 cell input-field">
						<stripes:hidden name="categoriaNoticia.idCategoriaNoticia"  />
						<stripes:text name="categoriaNoticia.descripcion" class="required" />
						<label class="active" for="categoriaNoticia.descripcion">Nombre de categoría de Noticia</label>												
					</div>
				</div>		
				<hr />			
		<div class="grid-container margin-vetical-1">
		  	<div class="grid-x grid-margin-x grid-margin-y align-center">	
		  		<div class="cell shrink">
		  			<div class="button hollow rounded"  data-close>CANCELAR</div>
		  		</div>
		  		<div class="cell shrink">				
					<stripes:button class="button rounded" value="GUARDAR" name="grabar" id="grabar"/>
				</div>
			</div>
		</div>
	
	</stripes:form>

<script>
	$(document).ready(function() {
		
	});  
</script>
