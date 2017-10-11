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


<div class="grid-container fluid">
    <div class="grid-x grid-margin-x align-center">
        <div class="cell small-12 large-7">
            <div class="grid-x align-justify">
                <div class="cell shrink">
                    <h2 >Categorías</h2>
                </div>
                <div class="cell shrink align-self-middle">
                    <ul class="menu">
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                <div class="cell small-12">
                    <c:forEach items="${actionBean.categoriasNoticias}" var="p" varStatus="i">
                   		 <li><a href="categoria?id=${p.idCategoriaNoticia}">${p.descripcion}</a></li>
                    </c:forEach>
                </div>
            </div>


            <hr>
            
            <c:forEach items="${actionBean.noticias}" var="p" varStatus="i">
	            <div class="separator-center margin-top-2">
	                <a href="noticia?id=${p.idNoticia}">
		                <div class="media-object">
		                    <div class="media-object-section">
		                        <div class="thumbnail">
		                            <img src="pages/imagenesCargadas/${p.nombreImagenPrincipal}" style="width: 100px">
		                        </div>
		                    </div>
		                    <div class="media-object-section main-section text-left">
		                        <h4 class="robotoMono-light">${p.titulo}</h4>
		                        <p class="black-text">${p.copete}</p>
		                        <p><small class="grey-text"><fmt:formatDate value="${p.fecha}" pattern="dd/MM/yyyy"/> - <i class="fa fa-user-circle-o" aria-hidden="true"></i> ${p.autor}</small></p>
		                    </div>
		                </div>
	                </a>
	            </div>
            </c:forEach>
            
            
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
</script>
