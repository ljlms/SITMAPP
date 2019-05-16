<%@page import="sitmapp.models.Parada"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vista Administrador</title>
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
        <!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGQUFgalVpzmjnc3sWaRg7cJZDaFXqZq8"></script>-->
        <script src="https://unpkg.com/leaflet@1.0.2/dist/leaflet.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
        <style>
            #map {
                width: 600px;
                height: 550px;
            }
        </style>
    </head>
    <body> 
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
            ArrayList<Parada> paradas = sitmapp.controllers.parada.ParaderoController.list();
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
                    <li id="li_registrar-paradas"> <a href="Administrar_Paradas.jsp">
                            <img src="templates/icons8-map-marker-48.png" class="iconos_png" alt="Icono administrar paradas"/>
                            Admin. Paradas</a></li> 
                    <li id="li_registrar-rutas"> <a href="Administrar_Rutas.jsp">
                            <img src="templates/icons8-map-editing-48.png" class="iconos_png" alt="Icono administrar rutas"/>
                            Admin. Rutas</a>   </li> 

                    <li id="registrar-empresa"> <a href="Administrar_Empresa.jsp">
                            <img src="templates/icons8-contact-us-48.png" alt="Icono administrar empresa"/>
                            Admin. Empresa </a> </li>
                    <li id="registrar-articulado"> <a href="Administrar_Articulados.jsp">
                            <img src="templates/icons8-bus-48.png" class="iconos_png" alt="Icono administrar articulados"/>
                            Admin. Articulados </a> </li>

                    <li id="administrar-usuarios"> <a href="Administrar_Usuarios.jsp">
                            <img src="templates/icons8-user-account-48.png"  class="iconos_png"alt="Icono administrar usuarios"/>
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

        <section class="wrapper clearfix" data-section="home">

            <div class="container">
                <h1 style="margin: 2%"> <strong> Administrar Paradas </strong> </h1>
            </div>

            <div class="container">
                <br>
                <div class="row">
                    <div class="col-md-8"> 

                        <table class="table table-bordered" style="text-align: center;">
                            <tr>
                                <td><strong>Id Parada</strong></td> 
                                <td><strong>Nombre</strong></td> 
                                <td><strong>Tipo</strong></td> 
                                <td><strong>Editar</strong></td>
                                <td><strong>Eliminar</strong></td>
                            </tr>                       
                            <%for (Parada x : paradas) {%>
                            <tr>
                                <td><%= x.getIdParada()%></td>
                                <td><%= x.getNombre()%></td>
                                <td><%= x.getTipo()%></td>
                                <td><a style='font-size:24px' class='fas' href="./PModificar?Id=<%=x.getIdParada()%>&Nom=<%=x.getNombre()%>&Lat=<%=x.getLatitud()%>&Lng=<%=x.getLongitud()%>&Tipo=<%=x.getTipo()%>"><img src="templates/icons8-edit.svg" class="icono_edit" width="30" height="30"></a></td>
                                <td><a style='font-size:24px' class='fas' href="./PEliminar?Id=<%=x.getIdParada()%>"><img src="templates/icons8-remove.svg" class="icono_edit" width="30" height="30"></a> </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <div>
                        <br>
                    </div>	
                    <div class="col-md-4">
                        <div class="container">
                            <button class="btn form-control btn-light" >
                                <a href="Añadir_Parada.jsp">Registrar Parada</a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
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
