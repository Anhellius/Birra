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

<jsp:include page="include/header.jsp" />

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
                     ${actionBean.noticia.descAutor}
                </p>
                <p class="article-date-read"><fmt:formatDate value="${actionBean.noticia.fecha}" pattern="dd/MM/yyyy"/></p><a href="categoria?id=${actionBean.noticia.categorianoticia.idCategoriaNoticia}"><button class="hollow button tiny rounded">${actionBean.noticia.categorianoticia.descripcion}</button></a>
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

<jsp:include page="include/piePagina.jsp" />



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
