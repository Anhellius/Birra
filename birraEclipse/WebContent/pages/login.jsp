<%@ include file="/pages/include/header.jsp" %>
<html>
<body>

<div class="row align-center">
  <div class="medium-4 columns vHeight">

    <stripes:form id="form1" beanclass="birra.controlador.actionBeans.LoginActionBean">
      <div class="row column profile-card">
      <div class="content">
        <h4 class="text-center">Ingrese con su cuenta </h4>
        <label>Email
          <div class="input-group">
            <input class="input-group-field" type="text" name="usuarioLogin" id="username" required placeholder="Usuario">           
          </div>
        </label>
        <label>Contraseña
          <input type="password" name="passwordLogin" id="password" required placeholder="Contraseña">
        </label>
        
        <button type="submit" class="button expanded" name="ingresar">Ingresar</button>
          <stripes:errors/>
          <stripes:messages/>
      </div>	
      </div>
    </stripes:form>
</div>
</div>
        



    <script src="https://www.inti.gob.ar/js/jquery.min.js"></script>
    <script src="https://www.inti.gob.ar/js/what-input.js"></script>
    <script src="https://www.inti.gob.ar/js/foundation.min.js"></script>
    <script src="https://www.inti.gob.ar/js/app.js"></script>
    <script>
    
   $(document).foundation();
     </script>
    
    
    
      </body>
</html>