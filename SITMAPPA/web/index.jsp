
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta charset="utf-8">
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/animate.css"><!--Aniamte library-->
        <link href="css/login.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="container">
            <header><h3><br><br></h3></header>
        </div>
        <div class="container">
            <form class="form-row" action="USIngresar" method="post"> <!-- Servlet USIngresar -->
                <div class="col-xs-0 col-sm-1 col-md-2 col-lg-2"></div>
                <div class="col-xs-2 col-sm-5 col-md-5 col-lg-6 logo">
                    <img  src="templates/Logo Principal.jpg" class="img-responsive animated  bounceInLeft logo" >
                </div>  
                <div class="col-xs-2 col-sm-5 col-md-4 col-lg-3">
                    <div class="col-xs-1 col-sm-12 col-md-12 col-lg-12">
                        <%String error = (String) request.getAttribute("error");
                            if (error != null) {
                        %>
                        <div class="alert alert-danger" role="alert">
                            <%=error%>
                        </div>
                        <%}%>
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
                </div> 
            </form>
        </div>
    </body>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="js/bootstrap.bundle.js" type="text/javascript"></script>
</html>

