<%@ include file="/pages/taglibs.jsp" %>
	<div class="title bg-color5 panel txt-white">
		<h3>Nuevo Sponsor</h3>
	</div>
  <stripes:form beanclass="birra.controlador.actionBeans.PanelActionBean" partial="true" >
	  	<div class="row expanded">
	 		<div class="small-12 columns">	  		
		  		<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Nombre</label>
						<stripes:hidden name="sponsor.idSponsor"  />
						<stripes:text name="sponsor.nombre" class="required" />						
					</div>
					<div class="small-6 column">
						<label>Breve Descripción</label>
						<stripes:text name="sponsor.breveDescripcion" class="required" />									
					</div>
				</div>	
				
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Link Google Maps</label>
						<stripes:text name="sponsor.linkGoogleMaps" class="required" />						
					</div>
					<div class="small-6 column">
						<label>Dirección</label>
						<stripes:text name="sponsor.direccion" class="required" />					
					</div>
				</div>	
				
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Descripcion</label>
						<stripes:text name="sponsor.descripcion" class="required" />						
					</div>
					<div class="small-6 column">
						<label>Telefono </label>
						<stripes:text name="sponsor.telefono" class="required" />					
					</div>
				</div>	
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Mail</label>
						<stripes:text name="sponsor.mail" class="required" />						
					</div>
					<div class="small-6 column">
						<label>Pagina web</label>
						<stripes:text name="sponsor.linkWeb" class="required" />						
					</div>
				</div>		
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Facebook</label>
						<stripes:text name="sponsor.linkFacebook" class="required" />						
					</div>
					<div class="small-6 column">
						<label>Twitter</label>
						<stripes:text name="sponsor.linkTwitter" class="required" />						
					</div>
				</div>	
				
				<div class="row expanded vHeight" >
					<div class="small-6 column">
						<label>Imagen Logo</label>
						<stripes:file name="sponsor.logo" id="logoImagen" class="required" />						
					</div>
					<div class="small-6 column">
						<label>Imagen</label>
						<stripes:file name="sponsor.fondo" id="fondoImagen" class="required" />						
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
