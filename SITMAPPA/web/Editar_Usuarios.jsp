<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="index.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Usuarios</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="css/principalStyle.css" rel="stylesheet" type="text/css"/>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGQUFgalVpzmjnc3sWaRg7cJZDaFXqZq8"></script>
    </head>
    <body>
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();

            int id = Integer.parseInt(request.getParameter("id_usuario"));
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String usuario = request.getParameter("usuario");
            String correo = request.getParameter("correo");
            long telefono = Long.parseLong(request.getParameter("telefono"));
            String tipo_usuario = request.getParameter("tipo");
            String contraseña = request.getParameter("contraseña");

            System.out.println("Tipo : " + tipo_usuario);
            System.out.println("No. Telefono: " + telefono);
            System.out.println("Apellidos: " + apellidos);

        %>
        <!-- Java Space -->  
        <section class="wrapper clearfix" data-section="home">
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
                        <li id="li_registrar-paradas"> <a href="Administrar_Paradas.jsp">
                            <img src="templates/icons8-map-marker-48.png" class="iconos_png" alt="Icono administrar paradas"/>
                            Admin. Paradas</a></li> 
                        <li id="li_registrar-rutas"> <a href="Administrar_Rutas.jsp">
                                <img src="templates/icons8-map-editing-48.png" class="iconos_png" alt=""/>
                                Admin. Rutas</a>   </li> 
                        <li id="registrar-empresa"> <a href="Administrar_Empresa.jsp">
                                <img src="templates/icons8-contact-us-48.png" alt=""/>
                                Admin. Empresa </a> </li>
                        <li id="registrar-articulado"> <a href="Administrar_Articulados.jsp">
                                <img src="templates/icons8-bus-48.png" class="iconos_png" alt=""/>
                                Admin. Articulados </a> </li>

                        <li id="administrar-usuarios"> <a href="Administrar_Usuarios.jsp">
                                <img src="templates/icons8-user-account-48.png"  class="iconos_png"alt=""/>
                                Admin. Usuarios </a> </li>
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
            <div class="container"> <header> <h1 style="margin: 5%"> <label> <strong>Editar Usuario</strong></label> </h1> </header> </div>
            <div class="container">
                <section class="main row">
                    <br>
                    <div class="col-md-12">
                        <form  method="post" action="USEditar" class="form">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <!--//String Nombre, String Apellidos, String NombreUsuario, 
                                         //String Contraseña, String Email, long Numero_telefono, String tipo_usuario) -->
                                    <label> ID: </label>
                                    <input value="<%=id%>" class="form-control" name="id" readonly type="number"> 
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="">Nombre: </label>
                                    <input type="text" name="nombre" class="form-control" value="<%=nombre%>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="">Apellidos: </label>
                                    <input type="text" class="form-control" name="apellidos" value="<%=apellidos%>">
                                </div>
                                <div class=" form-group col-md-6"> 
                                    <label for="">Usuario: </label>
                                    <input type="text" name="usuario" class="form-control" value="<%=usuario%>" maxlength="6" minlength="6">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label> Contraseña: </label>
                                    <input type="password" name="contra" class="form-control" value="<%=contraseña%>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label> Correo: </label>
                                    <input type="email" name="correo" class="form-control" value=" <%=correo%>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label> Numero de Telefono: </label>
                                    <input type="tel" name="telefono" class="form-control" value="<%=telefono%>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label> Tipo Usuario: </label>
                                    <input type="text" name="tipo" class="form-control" value="<%=tipo_usuario%>">
                                </div>
                            </div>
                            <div class="col-md-12"><br></div>
                            <div class="form-row">
                                <div class="col-md-4">
                                    <input type="submit" class="form-control btn btn-primary" value="Editar Usuario">
                                </div>
                                <div class="col-md-4">
                                    <a href="Administrar_Usuarios.jsp"> <button style="border-color: black;" class="form-control btn btn-light" type="button"> Cancelar </button> </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </section>
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

