<%-- 
    Document   : index
    Created on : 28/04/2019, 07:09:38 PM
    Author     : MANUEL PONTON RICO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<html>
    <head>
        <meta charset="utf-8">
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/animate.css"><!--Aniamte library-->

</head>
<body>
    <div class="container">
        <header><h3><br><br></h3></header>
    </div>
    <div class="container">
        <form class="form-row" action="USIngresar" method="post"> <!-- Servlet USIngresar -->
            <div class="col-md-2 col-xs-2"></div>
            <div class="col-md-6">
                <img src="https://i.imgur.com/uEYS6LA.jpg" class="img-responsive animated  bounceInLeft" width="350" height="400">
            </div>  

            <div class="form-group">
                <label><strong><h3>Iniciar sesión</h3></strong></label>
                <div></div>
                <label>¿Ya tienes cuenta? </label>

                <input type="text" name="correo_usuario" id="email_usuario" class="form-control" placeholder="Ingresar correo electronico" required>
                <div style="margin-top: 10px"></div>
                <input type="password" name="contra_usuario" id="pass_usuario"
                       class="form-control" placeholder="Ingresar contraseña" required>
                <div style="margin-top: 10px"></div>

                <input type="submit" name="Enviar" class="form-control btn btn-dark" style="margin-top: 5px" value="Ingresar"> 
                <!-- Enviar Formulario / email_usuario y contraseña -->
                <a href="recuperar_contraseña.html"><label style="margin-top: 5px; cursor: pointer; color: grey"><small>Recuperar contraseña</small></label></a>

                <div><strong>------------------------------------</strong></div>
                <label>¿No tienes cuenta?</label>
                <div>
                    <a class="btn btn-dark" href="Registrar_Usuario.jsp" role="button">Registrarse</a>
                </div>

            </div>
            <div class="col-md-2 col-xs-2">

                <%String error = (String) request.getAttribute("error");
                    if (error != null) {
                %>
                <div class="alert alert-danger" role="alert">
                    Correo o contraseña no valido, Intente nuevamente
                </div>
                <%}%>

            </div>
        </form>
    </div>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="js/bootstrap.bundle.js" type="text/javascript"></script>
</body>
</html>