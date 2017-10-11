<%@ include file="/pages/taglibs.jsp" %>
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