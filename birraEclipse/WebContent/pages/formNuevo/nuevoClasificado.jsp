<%@ include file="/pages/taglibs.jsp" %>
	<div class="grid-x grid-padding-x grid-padding-y">
		<div class="cell"><h3>Crear Clasificado</h3></div>
	</div>
  	<stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >
	  	<div class="grid-x grid-padding-x material-forms">  		
			<div class="small-4 cell  input-field">
				<stripes:hidden name="clasificado.idClasificado"  />
				<stripes:text name="clasificado.nombre" class="required" />
				<label class="active" for="clasificado.nombre">Nombre</label>										
			</div>
			<div class="small-4 cell">
				<label>Categoría</label>
				 <stripes:select class="browser-default required" name="clasificado.categorialistado.idCategoriaListado" id="idCategoriaListado">                            
					<stripes:option value="">Seleccione</stripes:option>
					<stripes:options-collection collection="${combo:getCombo(\"birra.modelo.dominio.CategoriaListado\",\"descripcion\")}"
					value="idCategoriaListado" label="descripcion" />                        
				</stripes:select>						
			</div>	
			<div class="small-4 cell  input-field">
				<stripes:text name="clasificado.mail" class="required" />
				<label class="active" for="clasificado.mail">Mail</label>										
			</div>
			<div class="small-4 cell  input-field">
				<stripes:text name="clasificado.telefono" class="required" />
				<label class="active" for="clasificado.telefono">Telefono</label>									
			</div>
			<div class="small-4 cell  input-field">
				<stripes:text name="clasificado.web" class="required" />
				<label class="active" for="clasificado.web">Web</label>										
			</div>
			<div class="small-4 cell  input-field">
				<stripes:text name="clasificado.redesSociales" class="required" />
				<label class="active" for="clasificado.redesSociales">Redes Sociales</label>									
			</div>
			<div class="small-4 cell  input-field">
				<stripes:text name="clasificado.direccionMapa" class="required" />
				<label class="active" for="clasificado.direccionMapa">Dirección Google Maps</label>
			</div>
		</div>
		<hr />		
		<div class="grid-container margin-top-1">
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
$(document).foundation();
	$(document).ready(function() {
		
	});  
</script>
