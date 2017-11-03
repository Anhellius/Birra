<%@ include file="/pages/taglibs.jsp" %>
	<div class="grid-x grid-padding-x grid-padding-y">
		<div class="cell"><h3>Nuevo Sponsor</h3></div>
	</div>
  	<stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >
	  	<div class="grid-x grid-padding-x material-forms">
  		

					<div class="small-4 cell  input-field">
						<label>Nombre</label>
						<stripes:hidden name="sponsor.idSponsor"  />
						<stripes:text name="sponsor.nombre" class="required" />						
					</div>
					<div class="small-4 cell  input-field">
						<label>Breve Descripción</label>
						<stripes:text name="sponsor.breveDescripcion" class="required" />									
					</div>
	
				

					<div class="small-4 cell  input-field">
						<label>Link Google Maps Iframe</label>
						<stripes:text name="sponsor.linkGoogleMaps" class="required" />						
					</div>
					<div class="small-4 cell  input-field">
						<label>Link Google Maps Compartir</label>
						<stripes:text name="sponsor.linkGoogleMapsCompartir" class="required" />						
					</div>					
	
				

					<div class="small-4 cell  input-field">
						<label>Descripcion</label>
						<stripes:text name="sponsor.descripcion" class="required" />						
					</div>
					<div class="small-4 cell  input-field">
						<label>Telefono </label>
						<stripes:text name="sponsor.telefono" class="required" />					
					</div>
					<div class="small-4 cell  input-field">
						<label>Dirección</label>
						<stripes:text name="sponsor.direccion" class="required" />					
					</div>
	

					<div class="small-4 cell  input-field">
						<label>Mail</label>
						<stripes:text name="sponsor.mail" class="required" />						
					</div>
					<div class="small-4 cell  input-field">
						<label>Pagina web</label>
						<stripes:text name="sponsor.linkWeb" class="required" />						
					</div>
		

					<div class="small-4 cell  input-field">
						<label>Facebook</label>
						<stripes:text name="sponsor.linkFacebook" class="required" />						
					</div>
					<div class="small-4 cell  input-field">
						<label>Twitter</label>
						<stripes:text name="sponsor.linkTwitter" class="required" />						
					</div>
	
				
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Imagen Logo</label>
						<stripes:file name="sponsor.logo" id="logoImagen" />						
					</div>
					<div class="small-6 column">
						<label>Imagen</label>
						<stripes:file name="sponsor.fondo" id="fondoImagen" />						
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
