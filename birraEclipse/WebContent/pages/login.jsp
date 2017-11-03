<!doctype html>
<html class="no-js" lang="es">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Birra</title>
	
</head>
  

<body>
<div class="grid-y grid-frame">
<%@ include file="/pages/include/header.jsp" %>

<div class="cell auto body">
    <div class="grid-x grid-padding-x align-center-middle height-100 material-forms">
      <div class="cell small-11 medium-3 shadow padding-horizontal-2 padding-vertical-3">
      <div class="grid-x align-center">
	      <div class="cell small-4">
			<img class="" src="pages/web/img/birra.png" alt="" />
	   	  </div>
   	  </div>
    <stripes:form id="form1" beanclass="birra.controlador.actionBeans.LoginActionBean">
<br />
 
        <h5 class="margin-bottom-2 text-center">LOGIN</h5>
        <div class="small-12 cell input-field">
          <input type="text" name="usuarioLogin" id="username" required>
          <label class="active" for="username">Usuario</label>
        </div>
        <div class="small-12 cell input-field">
          <input type="password" name="passwordLogin" id="password" required>
          <label class="active" for="password">Password</label>
        </div>               
<!--         <label>Email -->
<!--           <div class="input-group"> -->
<!--             <input class="input-group-field" type="text" name="usuarioLogin" id="username" required placeholder="Usuario">            -->
<!--           </div> -->
<!--         </label> -->
<!--         <label>Contraseña -->
<!--           <input type="password" name="passwordLogin" id="password" required placeholder="Contraseña"> -->
<!--         </label> -->
        
        <button type="submit" class="button radius expanded margin-top-3 shadow" name="ingresar">Ingresar</button>
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
    <script src="https://use.fontawesome.com/b825156fce.js"></script>
    <script src="pages/web/js/app.js"></script>
    <script>
    
   $(document).foundation();
     </script>
    
   </div> 
   </body>
   </html> 
