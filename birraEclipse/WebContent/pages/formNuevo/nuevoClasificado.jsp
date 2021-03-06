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
				<label>Categor�a</label>
				 <stripes:select class="browser-default required" name="clasificado.categorialistado.idCategoriaListado" id="idCategoriaListado">                            
					<stripes:option value="">Seleccione</stripes:option>
					<stripes:options-collection collection="${combo:getCombo(\"birra.modelo.dominio.CategoriaListado\",\"descripcion\")}"
					value="idCategoriaListado" label="descripcion" />                        
				</stripes:select>						
			</div>	
			<div class="small-4 cell  input-field">
				<stripes:text name="clasificado.mail"  />
				<label class="active" for="clasificado.mail">Mail</label>										
			</div>
			<div class="small-4 cell  input-field">
				<stripes:text name="clasificado.telefono"  />
				<label class="active" for="clasificado.telefono">Telefono</label>									
			</div>
			<div class="small-4 cell  input-field">
				<stripes:text name="clasificado.web"  />
				<label class="active" for="clasificado.web">Web</label>										
			</div>
			<div class="small-4 cell  input-field">
				<stripes:text name="clasificado.direccionMapa"  />
				<label class="active" for="clasificado.direccionMapa">Direcci�n Google Maps</label>
			</div>
			<div class="small-12 cell">
				<h4 class="roboto-light">Redes Sociales</h4>
			</div>			
			<div class="small-4 cell  input-field">
				<stripes:text name="clasificado.twetter"  />
				<label class="active" for="clasificado.twetter">Twitter</label>									
			</div>
 			<div class="small-4 cell  input-field">
 				<stripes:text name="clasificado.facebook"  />
 				<label class="active" for="clasificado.facebook">Facebook</label>									 
 			</div>	 
 			<div class="small-4 cell  input-field"> 
 				<stripes:text name="clasificado.googlePlus"  /> 
 				<label class="active" for="clasificado.googlePlus">Google+</label>									 
 			</div>
 			<div class="small-4 cell  input-field"> 
 				<stripes:text name="clasificado.instagram"/> 
 				<label class="active" for="clasificado.instagram">Instagram</label>									
 			</div>									 
		</div>
		<hr class="margin-0" />		
		<div class="grid-container">
		  	<div class="grid-x grid-margin-x grid-padding-y align-center">	
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
</script>
