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
              <i class="fa fa-map-o fa-2x blue-grey-text" aria-hidden="true"></i><br> <small>Google Maps</small>
            </div>
            <div class="cell auto">
              <i class="fa fa-external-link fa-2x blue-grey-text" aria-hidden="true"></i><br> <small>Sitio Web</small>
            </div>
            <div class="cell auto">
              <i class="fa fa-envelope-o fa-2x blue-grey-text" aria-hidden="true"></i> <br> <small>Mail</small>
            </div>
            <div class="cell auto">
              <i class="fa fa-share-alt fa-2x blue-grey-text" aria-hidden="true"></i> <br> <small>Compartir</small>
            </div>
          </div>
        </div>
      </div>
      <div class="cell small-12 large-8">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3283.046484898263!2d-58.43885558513895!3d-34.628265566303654!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bcca4bd65fdfb1%3A0xfd30a6f021ba6530!2sCervecer%C3%ADa+11.25!5e0!3m2!1ses-419!2sar!4v1507061745695" width="800" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
      </div>