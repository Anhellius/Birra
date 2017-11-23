<%@ include file="/pages/taglibs.jsp" %>
<div class="cell small-12 large-4">
        <div class="responsive-embed widescreen position-relative">
          <div class="position-absolute-bottom padding-horizontal-1 bg-black-alpha">
            <h4 class="white-text">${actionBean.sponsor.nombre}</h4>
            <p><small class="white-text">${actionBean.sponsor.breveDescripcion} - ${actionBean.sponsor.direccion} </small></p>
          </div>
          <img src="pages/imagenesCargadas/${actionBean.sponsor.imagenFondo}" alt="">
        </div>
        <div class="card-section">
          <p class="size-12">${actionBean.sponsor.descripcion}</p>
        </div>
        <div class="card-section">
          <div class="grid-x grid-margin-x">
            <div class="cell small-12">
				<c:if test="${actionBean.sponsor.telefono != null && actionBean.sponsor.telefono != ''}">
					<a href="tel:${actionBean.sponsor.telefono}">
	              		<i class="fa fa-phone blue-grey-text" aria-hidden="true"></i>  <small>Teléfono</small>
	              	</a>
              	</c:if>
            </div>             
            <div class="cell small-12">
            	<c:if test="${actionBean.sponsor.linkGoogleMapsCompartir != null && actionBean.sponsor.linkGoogleMapsCompartir != ''}">
	              	<a href="${actionBean.sponsor.linkGoogleMapsCompartir}"><i class="fa fa-map-o blue-grey-text" aria-hidden="true"></i> 
	              		<small>Abrir en Google Maps</small>
	              	</a>
              	</c:if>
            </div>
            <div class="cell small-12">
            	<c:if test="${actionBean.sponsor.linkWeb != null && actionBean.sponsor.linkWeb != ''}">
	            	<a href="${actionBean.sponsor.linkWeb}">
						<i class="fa fa-external-link blue-grey-text" aria-hidden="true"></i> <small>Sitio Web</small>
					</a>
	           </c:if>
            </div>
            <div class="cell small-12">
            	<c:if test="${actionBean.sponsor.mail != null && actionBean.sponsor.mail != ''}">
					<a href="mailto:${actionBean.sponsor.mail}">
	              		<i class="fa fa-envelope-o blue-grey-text" aria-hidden="true"></i> <small>Mail</small>
					</a>
				</c:if>
            </div>
            <div class="cell small-12">
            	<c:if test="${actionBean.sponsor.linkTwitter != null && actionBean.sponsor.linkTwitter != ''}">
					<a href="${actionBean.sponsor.linkTwitter}">
						<i class="fa fa-twitter blue-grey-text" aria-hidden="true"></i>  <small>Twitter</small>
					</a>
              	</c:if>
            </div>
            <div class="cell small-12">
				<c:if test="${actionBean.sponsor.linkFacebook != null && actionBean.sponsor.linkFacebook != ''}">            
					<a href="${actionBean.sponsor.linkFacebook}">
						<i class="fa fa-facebook blue-grey-text" aria-hidden="true"></i>  <small>Facebook</small>
					</a>
				</c:if>
            </div> 
            <div class="cell small-12">
				<c:if test="${actionBean.sponsor.linkGooglePlus != null && actionBean.sponsor.linkGooglePlus != ''}">
					<a href="${actionBean.sponsor.linkGooglePlus}">
						<i class="fa fa-google-plus blue-grey-text" aria-hidden="true"></i>  <small>Google+</small>
					</a>
				</c:if>
            </div>
            <div class="cell small-12">
				<c:if test="${actionBean.sponsor.linkInstagram != null && actionBean.sponsor.linkInstagram != ''}">
					<a href="${actionBean.sponsor.linkInstagram}">
						<i class="fa fa-instagram blue-grey-text" aria-hidden="true"></i>  <small>Instagram</small>
					</a>
				</c:if>
            </div>                                    
          </div>
        </div>
      </div>
      <div class="cell small-12 large-8">
		<c:if test="${actionBean.sponsor.linkGoogleMaps != null && actionBean.sponsor.linkGoogleMaps != ''}">
        	<iframe src="${actionBean.sponsor.linkGoogleMaps}" width="800" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
        </c:if>
      </div>