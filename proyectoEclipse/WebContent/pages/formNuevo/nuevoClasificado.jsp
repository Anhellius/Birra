<%@ include file="/pages/taglibs.jsp" %>
	<div class="title bg-color5 panel txt-white">
		<h3>Nuevo Clasificado</h3>
	</div>
  	<stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >
	  	<div class="row expanded">
	 		<div class="small-12 columns">	  		
		  		<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Nombre</label>
						<stripes:hidden name="clasificado.idClasificado"  />
						<stripes:text name="clasificado.nombre" class="required" />						
					</div>
					<div class="small-6 column">
						<label>Categoría</label>
						 <stripes:select name="clasificado.categorialistado.idCategoriaListado" id="idCategoriaListado" class="required">                            
							<stripes:option value="">Seleccione</stripes:option>
							<stripes:options-collection collection="${combo:getCombo(\"birra.modelo.dominio.CategoriaListado\",\"descripcion\")}"
							value="idCategoriaListado" label="descripcion" />                        
						</stripes:select>						
					</div>
				</div>	
				
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Mail</label>
						<stripes:text name="clasificado.mail" class="required" />						
					</div>
					<div class="small-6 column">
						<label>Telefono</label>
						<stripes:text name="clasificado.telefono" class="required" />					
					</div>
				</div>	
				
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Web</label>
						<stripes:text name="clasificado.web" class="required" />						
					</div>
					<div class="small-6 column">
						<label>Redes Sociales</label>
						<stripes:text name="clasificado.redesSociales" class="required" />					
					</div>
				</div>	
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Dirección Google Maps</label>
						<stripes:text name="clasificado.direccionMapa" class="required" />						
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
