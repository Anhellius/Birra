<%@ include file="/pages/taglibs.jsp" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta name="description" content="Revista de Birra El Cervecero">
    <meta name="keywords" content="cerveza,birra,revista,digital,bar,pub,cerveza rubia,cerveza negra,stout,lagger">
    <meta name="author" content="Alpargata">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Birra</title>
    <link rel="stylesheet" href="pages/web/css/app.css">
</head>
<body>

<!--INICIO DE TOPBAR-->
<div class="title-bar" data-responsive-toggle="example-menu" data-hide-for="medium">
    <button class="menu-icon" type="button" data-toggle="example-menu"></button>
    <div class="title-bar-title"><img src="pages/web/img/birra3.jpg" style="width: 90px" alt=""></div>
</div>

<div class="top-bar topbar-center-logo" id="example-menu">
    <div class="top-bar-left">
        <ul class="dropdown menu align-middle z-index-2" data-dropdown-menu>
            <li class="menu-text padding-0"><a class="padding-0" href="./"><img src="pages/web/img/birra3.jpg" style="width: 90px" alt=""></a></li>
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

<!--COMIENZO DE LA NOTICIA-->
<div class="grid-container full neat-article-container">
    <div class="grid-x gid-margin-x grid-padding-x">
    <div class="small-12 large-offset-2 large-7 cell">
        <div class="neat-article-header margin-vertical-1">
            <div class="article-header-avatar">
                <img class="header-avatar" src="https://unsplash.it/50/50?image=1005">
            </div>
            <div class="article-header-author">
                <p class="author-name">
                   ${actionBean.noticia.autor}
                </p>
                <p class="author-description">
                    Periodista, columnista, hacedir de cervezas y creador de Birra webSite
                </p>
                <p class="article-date-read"><fmt:formatDate value="${actionBean.noticia.fecha}" pattern="dd/MM/yyyy"/></p><a href="categoria.html"><button class="hollow button tiny rounded">ACTUALIDAD</button></a>
            </div>
        </div>
        <div class="neat-article-title">
            <h3 class="article-title h2 robotoMono-light">
                ${actionBean.noticia.titulo}
            </h3>
            <h5 class="roboto-light grey-text margin-bottom-1">${actionBean.noticia.copete}</h5>
        </div>
    </div>
    </div>
    <div class="neat-article-image">
        <img class="article-image" src="pages/imagenesCargadas/${actionBean.noticia.nombreImagenPrincipal}" alt="Space">
    </div>
    <div class="grid-x gid-margin-x grid-padding-y grid-padding-x" id="sticky1">
        <div class="neat-article-content cell small-12 large-offset-1 large-1 small-order-2  medium-order-1" data-sticky-container>
            <div class="sticky article-social" data-sticky data-anchor="sticky1" data-sticky-on="large">
                <ul class="menu medium-vertical ">
                    <li><a href="#0"><i class="fa fa-twitter fa-2x text-twitter" aria-hidden="true"></i></a></li>
                    <li><a href="#0"><i class="fa fa-facebook fa-2x text-facebook" aria-hidden="true"></i></a></li>
                    <li><a href="#0"><i class="fa fa-google-plus fa-2x text-google" aria-hidden="true"></i></a></li>
                </ul>
            </div>
        </div>

        <div class="small-12 large-7 cell small-order-1  medium-order-2">
            <div class="article-content">

                <p>
                    ${actionBean.noticia.cuerpo}                    
                </p>
            </div>
        </div>


    </div>

</div>



<!--FIN DE LA NOTICIA-->


<footer class="grid-x grid-padding-x grid-padding-y align-justify align-middle blue-grey darken-4">
    <div class="small-12 large-shrink cell">
        <p class="white-text">&copy; 2017 No rights reserved</p>
    </div>
    <div class="small-12 large-shrink cell">
        <ul class="menu ">
            <li><a class="white-text" href="#">Home</a></li>
            <li><a class="white-text" href="#">About</a></li>
            <li><a class="white-text" href="#">Services</a></li>
            <li><a class="white-text" href="#">Works</a></li>
            <li><a class="white-text" href="#">News</a></li>
            <li><a class="white-text" href="#">Contact</a></li>
        </ul>
    </div>
</footer>


    <script src="pages/web/js/jquery.min.js"></script>
    <script src="pages/web/js/what-input.min.js"></script>
    <script src="pages/web/js/foundation.min.js"></script>
    <script src="https://use.fontawesome.com/b825156fce.js"></script>
    <script src="pages/web/js/app.js"></script>
</body>
</html>
<script>
    $(document).foundation();
</script>
