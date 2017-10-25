<!doctype html>
<html class="no-js" lang="es">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Birra</title>
	<link rel="stylesheet" href="pages/web/css/app.css">
</head>
  

<body>
<div class="grid-y grid-frame">
<%@ include file="/pages/include/header.jsp" %>

<div class="cell auto body">
    <div class="grid-x grid-padding-x align-center-middle height-100 material-forms">
      <div class="cell small-11 medium-4 shadow padding-horizontal-2 padding-vertical-3">
      <div class="grid-x align-center">
	      <div class="cell small-4">
			<img class="" src="pages/web/img/birra3.jpg" alt="" />
	   	  </div>
   	  </div>
    <stripes:form id="form1" beanclass="birra.controlador.actionBeans.LoginActionBean">

 
        <h4 class="text-center">LOGIN</h4>
        <div class="input-field">
          <input type="text" name="usuarioLogin" id="username" class="validate" required>
          <label for="username">Email</label>
        </div>
        <div class="input-field">
          <input type="password" name="passwordLogin" id="password" required class="validate">
          <label for="password">Password</label>
        </div>        
<!--         <label>Email -->
<!--           <div class="input-group"> -->
<!--             <input class="input-group-field" type="text" name="usuarioLogin" id="username" required placeholder="Usuario">            -->
<!--           </div> -->
<!--         </label> -->
<!--         <label>Contraseña -->
<!--           <input type="password" name="passwordLogin" id="password" required placeholder="Contraseña"> -->
<!--         </label> -->
        
        <button type="submit" class="button expanded margin-top-3" name="ingresar">Ingresar</button>
          <stripes:errors/>
          <stripes:messages/>
	

    </stripes:form>
</div>
</div>
        </div>
        



    <script src="pages/web/js/jquery.min.js"></script>
    <script src="pages/web/js/what-input.min.js"></script>
    <script src="pages/web/js/foundation.min.js"></script>
    <script src="pages/web/js/forms.js"></script>
    <script src="pages/web/js/app.js"></script>
    <script>
    
   $(document).foundation();
     </script>
    
   </div> 
   </body>
   </html> 
