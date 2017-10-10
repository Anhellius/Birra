<%@ include file="/pages/taglibs.jsp" %>
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Birra</title>
    <link rel="stylesheet" href="pages/web/css/app.css">
  </head>
  <body>
<div class="">
  <!--INICIO DE TOPBAR-->
  <div class="title-bar" data-responsive-toggle="example-menu" data-hide-for="medium">
    <button class="menu-icon" type="button" data-toggle="example-menu"></button>
    <div class="title-bar-title"><img src="pages/web/img/birra3.jpg" style="width: 90px" alt=""></div>
  </div>

  <div class="top-bar topbar-center-logo" id="example-menu">
    <div class="top-bar-left">
      <ul class="dropdown menu align-middle z-index-2" data-dropdown-menu>
        <li class="menu-text padding-0"><a class="padding-0" href="./"><img src="img/birra3.jpg" style="width: 90px" alt=""></a></li>
        <li>
          <a href="#">Categorías</a>
          <ul class="menu vertical">
            <c:forEach items="${actionBean.categoriasNoticias}" var="p" varStatus="i">
              <li><a href="categoria?id=${p.idCategoriaNoticia}">${p.descripcion}</a></li>
            </c:forEach>
          </ul>
        </li>
        <li><a href="#">Contacto</a></li>
        <li><a href="#"><i class="fa fa-twitter text-twitter" aria-hidden="true"></i></a></li>
        <li><a href="#"><i class="fa fa-facebook text-facebook" aria-hidden="true"></i></a></li>
        <li><a href="#"><i class="fa fa-google-plus text-google" aria-hidden="true"></i></a></li>
      </ul>

    </div>
    <div class="top-bar-right searchbar">
      <ul class="menu material-forms ">
        <li><input class="is-hidden" type="search" placeholder="Buscar" data-toggler="is-hidden" id="buscador"  autofocus="autofocus"></li>
        <li><button type="button" class="button rounded hollow" data-toggle="buscador"><i class="fa fa-search" aria-hidden="true"></i></button></li>
      </ul>
    </div>
  </div>
  <!--FIN DE TOPBAR-->


      <div class="grid-x grid-padding-x grid-padding-y">
        <div class="large-8 cell">
          <div class="orbit clean-hero-slider" role="region" aria-label="Favorite Space Pictures" data-orbit>
            <div class="orbit-wrapper">
              <div class="orbit-controls">
                <!--<button class="orbit-previous"><span class="show-for-sr">Previous Slide</span>&#9664;&#xFE0E;</button>-->
                <!--<button class="orbit-next"><span class="show-for-sr">Next Slide</span>&#9654;&#xFE0E;</button>-->
              </div>
              <ul class="orbit-container">
                <li class="orbit-slide">
                  <figure class="orbit-figure">
                    <div class="position-absolute z-index-1"><span class="label  size-36 roboto-thin deep-orange darken-4  deep-orange-text text-accent-1">EL NEGOCIO</span></div>
                    <img class="cropcontainer" src="pages/imagenesCargadas/${actionBean.noticiasElNegocio[0].nombreImagenPrincipal}" alt="image alt text">
                    <figcaption class="orbit-caption">
                      <h3 class="robotoMono-light">${actionBean.noticiasElNegocio[0].titulo}</h3>
                      <p class="roboto-light">${actionBean.noticiasElNegocio[0].copete}</p>
                      <div class="grid-x">
                        <div class="cell small-12 large-shrink"><a href="noticia?id=${actionBean.noticiasElNegocio[0].idNoticia}" class="button rounded expanded deep-orange darken-1">${actionBean.noticiasElNegocio[0].autor}</a></div>
                      </div>

                    </figcaption>
                  </figure>
                </li>
              </ul>
            </div>
            <!--<nav class="orbit-bullets">-->
              <!--<button class="is-active" data-slide="1"><span class="show-for-sr">Lorem Ipsum Etiam</span></button>-->
              <!--<button data-slide="2"><span class="show-for-sr">Lorem Ipsum Etiam</span></button>-->
              <!--<button data-slide="3"><span class="show-for-sr">Lorem Ipsum Etiam</span></button>-->
            <!--</nav>-->

          </div>


        </div>
        <div class="large-4 cell">
          <div class="orbit clean-hero-slider" role="region" aria-label="Favorite Space Pictures" data-orbit>
            <div class="orbit-wrapper">
              <div class="orbit-controls">
                <button class="orbit-previous deep-orange darken-2"><span class="show-for-sr">Previous Slide</span>&#9664;&#xFE0E;</button>
                <button class="orbit-next deep-orange darken-2"><span class="show-for-sr">Next Slide</span>&#9654;&#xFE0E;</button>
              </div>
              <ul class="orbit-container">
                <div class="position-absolute z-index-1"><span class="label size-36 roboto-thin deep-orange darken-4  deep-orange-text text-accent-1">ACTUALIDAD</span></div>
                
                <c:forEach items="${actionBean.noticiasActualidad}" var="p" varStatus="i">
	                <li class="orbit-slide">
	                  <figure class="orbit-figure">
	                    <img class="cropcontainer" src="pages/imagenesCargadas/${p.nombreImagenPrincipal}" alt="image alt text">
	                    <figcaption class="orbit-caption">
	                      <h3 class="h4  robotoMono-light">${p.titulo}</h3>
	                      <p class="roboto-light">${p.copete}</p>
	                      <a href="noticia2.html" class="button rounded  deep-orange darken-1">${p.autor}</a>
	                    </figcaption>
	                  </figure>
	                </li>
                </c:forEach>
                
              </ul>
            </div>
            <nav class="orbit-bullets">
              <button class="is-active" data-slide="0"><span class="show-for-sr">Lorem Ipsum Etiam</span></button>
              <button data-slide="1"><span class="show-for-sr">Lorem Ipsum Etiam</span></button>
              <button data-slide="2"><span class="show-for-sr">Lorem Ipsum Etiam</span></button>
            </nav>
          </div>


        </div>
      </div>
</div>


      <div class="grid-x grid-padding-x grid-padding-y">
        <!--SPONSORS-->
        <div class="cell small-12 large-4">
          <h4 class="separator-left">SPONSORS</h4>
          <div class="contain position-relative">
            <div id="arrowL" class="orbit-previous"><span class="show-for-sr">Anterior</span><i class="fa fa-angle-left fa-3x" aria-hidden="true"></i></div>
            <div id="arrowR" class="orbit-next"><span class="show-for-sr">Siguiente</span><i class="fa fa-angle-right fa-3x" aria-hidden="true"></i></div>
            <div class="row" id="content">
              <div class="row__inner">

				<c:forEach items="${actionBean.sponsors}" var="p" varStatus="i">

	                <div class="tile shadow margin-bottom-1" data-open="exampleModal1">
	                    <div class="card-user-profile">
	                      <div class="responsive-embed widescreen">
	                        <img class="card-user-profile-img" src="pages/imagenesCargadas/${p.imagenFondo}"/>
	                      </div>
	                      <div class="card-user-profile-content card-section text-center">
	                        <div class="card-user-profile-avatar">
	                          <img src="pages/imagenesCargadas/${p.imagenLogo}"/>
	                        </div>
	                        <p class="">${p.nombre} <br> <small>${p.breveDescripcion}</small></p>
	                      </div>
	                    </div>
	                </div> 
                
                </c:forEach>
                               

              </div>
            </div>

          </div>
        </div>
        <!--FIN SPONSORS-->

        <!--CLASIFICADOS-->
        <div class="cell small-12 large-8">
          <h4 class="separator-left">CLASIFICADOS</h4>
          <div class="grid-x grid-margin-x">
            <!--donde ir-->
            <div class="cell large-auto">
            	  
	              <h5 class=" roboto-light">
	               	<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
	              		<c:if test="${p.categorialistado.idCategoriaListado==3}">
	              			${p.categorialistado.descripcion}
	              		</c:if>
	              	</c:forEach>	
	              </h5>
	              
	              <ul class="no-bullet">
	              	<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
	              		<c:if test="${p.categorialistado.idCategoriaListado==3}">	
			                <li class="size-14">
			                  <a href="">${p.nombre} </a>
			                  <a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a>
			                  <a href=""><i class="fa fa-map-marker" aria-hidden="true"></i></a>
			                </li>
		               </c:if>
	                 </c:forEach>
	              </ul>
	             
            </div>
            <!--fin donde ir-->

            <!--que tomar-->
            <div class="cell large-auto">
              <h5 class=" roboto-light">
	               	<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
	              		<c:if test="${p.categorialistado.idCategoriaListado==4}">
	              			${p.categorialistado.descripcion}
	              		</c:if>
	              	</c:forEach>	
	              </h5>
	              
	              <ul class="no-bullet">
	              	<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
	              		<c:if test="${p.categorialistado.idCategoriaListado==4}">	
			                <li class="size-14">
			                  <a href="">${p.nombre} </a>
			                  <a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a>
			                  <a href=""><i class="fa fa-map-marker" aria-hidden="true"></i></a>
			                </li>
		               </c:if>
	                 </c:forEach>
	              </ul>
            </div>
            <!--fin que tomar-->

            <!--insumos-->
            <div class="cell large-auto">
             <h5 class=" roboto-light">
	               	<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
	              		<c:if test="${p.categorialistado.idCategoriaListado==5}">
	              			${p.categorialistado.descripcion}
	              		</c:if>
	              	</c:forEach>	
	              </h5>
	              
	              <ul class="no-bullet">
	              	<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
	              		<c:if test="${p.categorialistado.idCategoriaListado==5}">	
			                <li class="size-14">
			                  <a href="">${p.nombre} </a>
			                  <a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a>
			                  <a href=""><i class="fa fa-map-marker" aria-hidden="true"></i></a>
			                </li>
		               </c:if>
	                 </c:forEach>
	              </ul>
            </div>
            <!--fin insumos-->

            <!--alquileres de choperas-->
            <div class="cell large-auto">
              <h5 class=" roboto-light">
	               	<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
	              		<c:if test="${p.categorialistado.idCategoriaListado==6}">
	              			${p.categorialistado.descripcion}
	              		</c:if>
	              	</c:forEach>	
	              </h5>
	              
	              <ul class="no-bullet">
	              	<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
	              		<c:if test="${p.categorialistado.idCategoriaListado==6}">	
			                <li class="size-14">
			                  <a href="">${p.nombre} </a>
			                  <a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a>
			                  <a href=""><i class="fa fa-map-marker" aria-hidden="true"></i></a>
			                </li>
		               </c:if>
	                 </c:forEach>
	              </ul>
            </div>
            <!--fin alquileres de choperas-->

          </div>

        </div>
        <!--FIN CLASIFICADOS-->
      </div>

      <div class="grid-x grid-padding-x grid-padding-y">
        <div class="small-12 cell">
          <div class="grid-x grid-padding-y grid-padding-x">
            <div class="large-4 medium-4 small-12 cell">
              <div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit>
                <div class="orbit-wrapper">
                  <ul class="orbit-container">
                    <li class="is-active orbit-slide black">
                      <figure class="orbit-figure">
                        <div class="position-absolute z-index-1"><span class="label  size-36 roboto-thin deep-orange darken-4  deep-orange-text text-accent-1">CIENCIA Y TECNO</span></div>
                        <img class="orbit-image cropcontainer" src="pages/imagenesCargadas/${actionBean.noticiasCT[0].nombreImagenPrincipal}" alt="image alt text">
                        <figcaption class="orbit-caption">
                          <h4 class="robotoMono-light">${actionBean.noticiasCT[0].titulo}</h4>
                          <p>${actionBean.noticiasCT[0].copete}</p>
                          <a href="#" class="button rounded deep-orange darken-1">${actionBean.noticiasCT[0].autor}</a>
                        </figcaption>
                      </figure>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="large-4 medium-4 small-12 cell">
              <div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit>
                <div class="orbit-wrapper">
                  <ul class="orbit-container">
                    <li class="is-active orbit-slide black">
                      <figure class="orbit-figure">
                        <div class="position-absolute z-index-1"><span class="label  size-36 roboto-thin deep-orange darken-4  deep-orange-text text-accent-1">DE GIRA</span></div>
                        <img class="orbit-image cropcontainer" src="pages/imagenesCargadas/${actionBean.noticiasDegira[0].nombreImagenPrincipal}" alt="image alt text">
                        <figcaption class="orbit-caption">
                          <h4 class="robotoMono-light">${actionBean.noticiasDegira[0].titulo}</h4>
                          <p>${actionBean.noticiasDegira[0].copete}</p>
                          <a href="#" class="button rounded deep-orange darken-1">${actionBean.noticiasDegira[0].autor}</a>
                        </figcaption>
                      </figure>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="large-4 medium-4 small-12 cell">
              <div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit>
                <div class="orbit-wrapper">
                  <ul class="orbit-container">
                    <li class="is-active orbit-slide black">
                      <figure class="orbit-figure">
                        <div class="position-absolute z-index-1"><span class="label  size-36 roboto-thin deep-orange darken-4  deep-orange-text text-accent-1">RSE</span></div>
                        <img class="orbit-image cropcontainer" src="pages/imagenesCargadas/${actionBean.noticiasRSE[0].nombreImagenPrincipal}" alt="image alt text">
                        <figcaption class="orbit-caption">
                          <h4 class="robotoMono-light">${actionBean.noticiasRSE[0].titulo}</h4>
                          <p>${actionBean.noticiasRSE[0].copete}</p>
                          <a href="#" class="button rounded deep-orange darken-1">${actionBean.noticiasRSE[0].autor}</a>
                        </figcaption>
                      </figure>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="grid-x grid-padding-x grid-padding-y">
        <div class="small-12 large-8 cell">
          <div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit>
            <div class="orbit-wrapper">
              <ul class="orbit-container">
                <li class="is-active orbit-slide black">
                  <figure class="orbit-figure">
                    <div class="position-absolute z-index-1"><span class="label  size-36 roboto-thin deep-orange darken-4  deep-orange-text text-accent-1">ENTREVISTA</span></div>
                    <img class="orbit-image cropcontainer" src="pages/imagenesCargadas/${actionBean.noticiasEntrevista[0].nombreImagenPrincipal}" alt="image alt text">
                    <figcaption class="orbit-caption">
                      <h4 class="robotoMono-light">${actionBean.noticiasEntrevista[0].titulo}</h4>
                      <p>${actionBean.noticiasEntrevista[0].copete}</p>
                      <a href="#" class="button rounded deep-orange darken-1">${actionBean.noticiasEntrevista[0].autor}</a>
                    </figcaption>
                  </figure>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="small-12 large-4 cell">
          <div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit>
            <div class="orbit-wrapper">
              <ul class="orbit-container">
                <li class="is-active orbit-slide black">
                  <figure class="orbit-figure">
                    <div class="position-absolute z-index-1"><span class="label  size-36 roboto-thin deep-orange darken-4  deep-orange-text text-accent-1">HISTORIAS DE BIRRA</span></div>
                    <img class="orbit-image cropcontainer" src="pages/imagenesCargadas/${actionBean.noticiasHistoriasBirra[0].nombreImagenPrincipal}" alt="image alt text">
                    <figcaption class="orbit-caption">
                      <h4 class="robotoMono-light">${actionBean.noticiasHistoriasBirra[0].titulo}</h4>
                      <p>${actionBean.noticiasHistoriasBirra[0].copete}</p>
                      <a href="#" class="button rounded deep-orange darken-1">${actionBean.noticiasHistoriasBirra[0].autor}</a>
                    </figcaption>
                  </figure>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

  <footer class="grid-x grid-padding-x grid-padding-y align-justify blue-grey darken-4 white-text">

      <!--oferta academica-->
      <div class="cell small-12 large-6">
        <h5 class=" roboto-light">Oferta Académica</h5>
        <ul class="no-bullet">
        	<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
		          <c:if test="${p.categorialistado.idCategoriaListado==1}">
		          <li class="size-14">
			            <a href="">${p.nombre}</a>
			            <a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a>
			            <a href=""><i class="fa fa-map-marker" aria-hidden="true"></i></a>
			          </li>
		          </c:if>
	        </c:forEach>
         
        </ul>
      </div>
      <!--fin oferta academica-->

      <!--camaras sectoriales-->
      <div class="cell small-12 large-6">
        <h5 class=" roboto-light">     	
          	Camaras Sectoriales        
        </h5>
        <ul class="no-bullet">
        	<c:forEach items="${actionBean.clasificados}" var="p" varStatus="i">
	          <c:if test="${p.categorialistado.idCategoriaListado==2}">
		          <li class="size-14">
		            <a href="">${p.nombre} </a>
		            <a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a>
		            <a href=""><i class="fa fa-map-marker" aria-hidden="true"></i></a>
		          </li>		          
	          </c:if>
          	</c:forEach>	
         
        </ul>
      </div>
      <!--fin camaras sectoriales-->

    <!--<div class="small-12 large-shrink cell">-->
    <!--<p class="white-text">&copy; 2017 No rights reserved</p>-->
    <!--</div>-->
    <!--<div class="small-12 large-shrink cell">-->
    <!--<ul class="menu ">-->
    <!--<li><a class="white-text" href="#">Home</a></li>-->
    <!--<li><a class="white-text" href="#">About</a></li>-->
    <!--<li><a class="white-text" href="#">Services</a></li>-->
    <!--<li><a class="white-text" href="#">Works</a></li>-->
    <!--<li><a class="white-text" href="#">News</a></li>-->
    <!--<li><a class="white-text" href="#">Contact</a></li>-->
    <!--</ul>-->
    <!--</div>-->
  </footer>


  <div class="large reveal padding-0 shadow  border-none" id="exampleModal1" data-reveal>
    <div class="grid-x">
      <div class="cell small-12 large-4">
        <div class="responsive-embed widescreen position-relative">
          <div class="position-absolute-bottom padding-horizontal-1 bg-black-alpha">
            <h4 class="white-text">Nombre del Lugar</h4>
            <p><small class="white-text">Breve Descripcioin - Lugar y/o direcciÃ³n todo lindo </small></p>
          </div>
          <img src="img/sponsor/bar-1.jpg" alt="">
        </div>
        <div class="card-section">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ab, architecto dicta dolore eligendi est excepturi facere illum incidunt itaque magni modi nobis omnis, quasi quidem saepe sit tenetur velit.</p>
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
    </div>
  </div>

  <script src="pages/web/js/jquery.min.js"></script>
  <script src="pages/web/js/what-input.min.js"></script>
  <script src="pages/web/js/foundation.min.js"></script>
  <script src="https://use.fontawesome.com/b825156fce.js"></script>
  <script src="pages/web/js/app.js"></script>
  </body>
</html>
<script>
    $(document).foundation();
    $(document).ready(function() {

        $('#arrowR').click(function() {
            event.preventDefault();
            $('#content').animate({
                scrollLeft: "+=200px"
            }, "slow");
        });

        $('#arrowL').click(function() {
            event.preventDefault();
            $('#content').animate({
                scrollLeft: "-=200px"
            }, "slow");
        });

        $(function() {
            $('.search')
                .bind('click', function(event) {
                    $(".search-field").toggleClass("expand-search");

                    // if the search field is expanded, focus on it
                    if ($(".search-field").hasClass("expand-search")) {
                        $(".search-field").focus();
                    }
                })
        });



    });
</script>
