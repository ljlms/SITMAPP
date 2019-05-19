<%@page import="sitmapp.models.Parada"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sitmapp.models.Ruta"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrar Rutas</title>
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
            ArrayList<Ruta> lista = sitmapp.controllers.ruta.RutaControllers.list();
        %>
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
            <div class="container">
                <header> <h1 style="margin: 5%"> <strong> Rutas registradas </strong> </h1> </header>
            </div>
            <div class="row">
                <div class="col-md-10">
                    <div class="form-group col-md-12">
                        <table class="table table-light table-striped" style="text-align: center;">
                            <tr>
                                <td><label for=""> <strong>Nombre</strong> </label>
                                </td>
                                <td><label for=""> <strong>Tipo Ruta</strong> </label>
                                </td>
                                <td><label> <strong>Paraderos</strong> </label></td>
                                <td><label> <strong>Horario</strong> </label></td>
                                <td> <label> <strong> Editar </strong> </label> </td>
                                <td> <label> <strong>Eliminar</strong> </label> </td>
                            </tr>
                            <% for (Ruta r : lista) {%>
                            <tr>
                                <td><%=r.getNombre_Ruta()%></td>
                                <td><%=r.getTipo_Ruta()%></td>
                                <td>
                                    <%for (String p : sitmapp.controllers.ruta.RutaControllers.listParada(r.getId_ruta())) {%>
                                    <label><%=p%></label><br>
                                    <%}%>
                                </td>
                                <td>
                                    <label><strong>Lunes - Viernes: <%=r.getLunes_viernes()%></strong></label><br>
                                    <label><strong>Sabados: <%=r.getSabado()%></strong></label><br>
                                    <label><strong>Domingo - Festivos: <%=r.getDomingo_festivo()%></strong></label><br>
                                </td>
                                <td><a style='font-size:24px' class='fas' href="./Editar_Paradas.jsp?"><img src="templates/icons8-edit.svg" class="icono_edit" width="30" height="30"></a></td>
                                <td><a style='font-size:24px' class='fas' href="./SREliminar?Id=<%=r.getId_ruta()%>"><img src="templates/icons8-remove.svg" class="icono_edit" width="30" height="30"></a> </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
                <aside class="col-md-2" style="margin-top: 5%">
                    <div>
                        <label style="margin:15%"> </label>
                    </div>
                    <div class="">
                        <button class="btn form-control btn-light" >
                            <a href="Añadir_Rutas.jsp" style="font-size: 120%">Registrar Ruta</a>
                        </button>
                    </div>   

                </aside>

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
