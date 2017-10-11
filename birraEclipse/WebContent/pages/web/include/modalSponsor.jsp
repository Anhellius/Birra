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
          <p>${actionBean.sponsor.descripcion}</p>
        </div>
        <div class="card-section">
          <div class="grid-x grid-margin-x text-center">
            <div class="cell auto">
              <a href="${actionBean.sponsor.linkGoogleMapsCompartir}"><i class="fa fa-map-o fa-2x blue-grey-text" aria-hidden="true"></i><br> 
              	<small>Google Maps</small>
              </a>
            </div>
            <div class="cell auto">
            	<a href="${actionBean.sponsor.linkWeb}">
	              <i class="fa fa-external-link fa-2x blue-grey-text" aria-hidden="true"></i><br> <small>Sitio Web</small>
	           </a>
            </div>
            <div class="cell auto">
              <a href="mailto:${actionBean.sponsor.mail}">
              	<i class="fa fa-envelope-o fa-2x blue-grey-text" aria-hidden="true"></i> <br> <small>Mail</small>
              </a>
            </div>
            <div class="cell auto">
              <i class="fa fa-share-alt fa-2x blue-grey-text" aria-hidden="true"></i> <br> <small>Compartir</small>
            </div>
          </div>
        </div>
      </div>
      <div class="cell small-12 large-8">
        <iframe src="${actionBean.sponsor.linkGoogleMaps}" width="800" height="100%" frameborder="0" style="border:0" allowfullscreen>
        </iframe>
      </div>