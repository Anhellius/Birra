<%@ include file="/pages/taglibs.jsp" %>
<!doctype html>
<html class="no-js" lang="es">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>INTI</title>
	<link rel="stylesheet" href="https://www.inti.gob.ar/css/app.css">
	<link href="https://www.inti.gob.ar/css/foundation-icons/foundation-icons.css" rel="stylesheet">
	<link href="https://www.inti.gob.ar/css/material-design-icons/material-icons.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="https://www.inti.gob.ar/css/dataTables.foundation.css">
	<link href="pages/js/jquery-ui.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
	@media print {
	    /* hide main content when dialog open */
	    body.is-reveal-open div.off-canvas-wrapper {
	        /*display: none;*/
	    }
	}
	</style>
</head>
  

<body>

<div class="panel-sidenav off-canvas-wrapper">      
<div class="top-bar bg-institucional-1 hide-for-small-only" id="example-menu">
		<div class="top-bar-left">
			<ul class="dropdown menu" data-dropdown-menu>
				<li class="menu-text"><span class="txt-white">Instituto Nacional de Tecnología Industrial</span></li>
			</ul>
		</div>
		<stripesDin:form data-abide="" id="form3" method="post" beanclass="birra.controlador.actionBeans.PanelActionBean">
			<div class="top-bar-right">	
				<ul class="dropdown menu" data-dropdown-menu>
					<li>
						<a href="${ctx}/buscador"><span class="txt-white"><i class="fi-home size-22"></i> <span>Inicio</span></span></a>
					</li>
					<li>
						<a href="#"><span class="txt-white"><i class="mdi-action-account-circle size-24"></i><span>Nombre</span></span></a>
						<ul class="menu vertical">
							<li><a href="mailto:sistemas@inti.gob.ar"><i class="mdi-action-help"></i> <span>Ayuda</span></a></li>
							<li><a href="${ctx}/logout"><i class="mdi-action-exit-to-app"></i> <span>Salir</span></a></li>
						</ul>
					</li>
				</ul>
			</div>
		</stripesDin:form>
	</div>
	<header class="expanded row bannerHeader bg-institucional  hide-for-small-only">
		<div class="columns">
			<h2 class="txt-white light">birra <small class="size-12">v.</small></h2>
		</div>
	</header>