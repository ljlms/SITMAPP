<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Añadir Empresa</title>
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
            <div class="container"> <h1> <label style="margin: 5%;"> <strong> Registrar Empresa </strong></label> </h1> </div>
            <br>
            <div class="container" style="font-size: 20px">
                <div class="row"> <!-- Primera Fila Troncales - Pretroncales -->
                    <div class="col-md-1"></div>
                    <div class="col-md-11">
                        <form action="ERegistrar" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nic">NIC: </label>
                                    <input type="number" class="form-control" name="nic_empresa" id="nic" placeholder="Ingrese NIC..." required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="nombre">Nombre:</label>
                                    <input type="text" class="form-control" name="nombre_empresa" id="nombre" placeholder="Ingrese nombre..." required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label> Descripción: </label>
                                    <textarea name="descripcion_empresa" class="form-control" rows="6" placeholder="Ingrese descripcion de la empresa..." required></textarea>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6"> 
                                    <input type="submit" class="form-control btn btn-primary" value="Registrar Empresa">
                                </div>
                                <div class="form-group col-md-6" style="margin: -1%">
                                    <a href="Administrar_Empresa.jsp"> <button type="button" class="form-control btn btn-light" style="border-color: black;"> Cancelar </button> </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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

