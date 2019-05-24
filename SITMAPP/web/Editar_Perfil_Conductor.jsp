<%@page import="sitmapp.controllers.usuario.UsuarioController"%>
<%@page import="sitmapp.models.Ruta"%>
<%@page import="sitmapp.controllers.ruta.RutaControllers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sitmapp.controllers.articulado.ArticuladoController"%>
<%@page import="sitmapp.models.Articulado"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vista Conductor</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/visualizar_ruta.js"> // Script externo
        </script>
        <link href="css/principalStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/animate.css"><!--Animate library-->
    </head>
    <body> 
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            Usuario user = UsuarioController.listEspecificUser(u.getId_usuario());
        %>

        <header class="header">

            <div class="logo">
                <a href="javascript:void(0);">
                    <img src="templates/Map logo.png" alt="Logo Sitmapp" class="responsive"/>
                </a>
            </div>

            <a href="#" class="toggle_menu" >
                <i class="fa fa-navicon"></i>
            </a>
            <nav class="menu">
                <ul>
                    <li id="li_Home-Conductor"> <a href="Home_Conductor.jsp">
                            <img src="templates/icons8-casa.svg" class="iconos_png" alt="Icono home conductor"/>
                            Menú Principal</a></li>
                    <li id="li_Editar-Perfil-Conductor"> <a href="Editar_Perfil_Conductor.jsp">
                            <img src="templates/icons8-conductor-64.png" class="iconos_png" alt="Icono editar perfil"/>
                            Editar Perfil</a></li>
                </ul>
            </nav>

            <div class="footer clearfix">
                <ul class="social clearfix">
                    <li><a href="#"><i>
                                <img src="templates/icons8-info.svg" class="iconos" ></a>
                            </i></a></li>

                    <li><a href="Home.jsp"><i>   
                                <img src="templates/icons8-external-link.svg" class="iconos" ></a>
                            </i></a></li>
                    <li><a href="#"><i>   
                                <img src="templates/icons8-settings-50.svg" class="iconos" ></a>
                            </i></a></li>

                    <li><a href="./USCerrarSesion?var=off"><i>
                                <img src="templates/icons8-key.svg" class="iconos" ></a>
                            </i></a></li>
                </ul>

                <div class="right">
                    <p>Copyright © 2019.</p>
                </div>
            </div>
        </header>

        <section class="wrapper clearfix" data-section="home">
            <div class="container" style="margin-top: 3%; margin-bottom: 3%">
                <h2><strong>Información Personal</strong></h2>
            </div>
            <div class="container">
                <form action="ConductorEditar" method="post">
                    <div style="visibility: hidden;"><input type="number" value="<%=user.getId_usuario()%>" name="driver_id" required></div>
                    <div style="visibility: hidden;"><input type="text" value="<%=user.getTipo_usuario()%>" name="user_type" required></div>
                    <div class="row">
                        <div class="col-md-1"><br></div>
                        <div class="col-md-11">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Nombre</label>    
                                    <input type="text" class="form-control" value="<%=user.getNombre()%>" name="driver_name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Apellidos</label>
                                    <input type="text" class="form-control"  value="<%=user.getApellidos()%>" name="driver_lastname" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Usuario</label>
                                    <input type="text" class="form-control" value="<%=user.getNombreUsuario()%>" name="user" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Contraseña</label>
                                    <input type="password" class="form-control" value="<%=user.getContraseña()%>" name="password" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Correo</label>
                                    <input type="email" class="form-control" value="<%=user.getEmail()%>" name="email" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Telefono</label>
                                    <input type="tel" class="form-control" value="<%=user.getNumero_telefono()%>" name="phone_number" maxlength="10" required>
                                </div>
                            </div>
                            <div class="row"><br></div>
                            <div class="row">
                                <div class="form-group col-md-3">
                                    <input type="submit" class="form-control formulario btn btn-primary" value="Editar">
                                </div>
                                <div class="form-group col-md-3">
                                    <a href="Home_Conductor.jsp"><button type="button" class="form-control formulario btn btn-primary" style="border-color: black">Cancelar</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- lightModal -->
        <div class="lightModal">
            <div class="lightModal-inner">
                <button class="lightModal-close" role="button">&times;</button>
                <h3 class="lightModal-title"></h3>
                <img class="lightModal-image" src="http://placehold.it/350x150" alt="Title here">
            </div>
        </div>
        <!-- / lightModal -->
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.bundle.js" type="text/javascript"></script>
        <script src="js/Visibility.js" type="text/javascript"></script>
        <script src="js/principalJavaScript.js" type="text/javascript"></script>
    </body>
</html>