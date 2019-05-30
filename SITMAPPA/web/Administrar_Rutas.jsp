<%@page import="sitmapp.controllers.ruta.RutaControllers"%>
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

            String valor = "";

            try {
                Usuario u = (Usuario) session.getAttribute("usuario");
                valor = u.getTipo_usuario();
                if (!valor.equalsIgnoreCase("administrador")) {
                    response.sendRedirect("Home.jsp");
                }

            } catch (Exception e) {

                response.sendRedirect("errorSesion?error=La sesion ha cerrado, ingrese nuevamente");
                //              response.sendRedirect("../index.jsp?error=La sesion cerró, ingrese nuevamente");

            }

        %>
        <section class="wrapper clearfix" data-section="home">
            <header class="header">

                <div class="logo">
                    <a href="Home_Administrador.jsp">
                        <img src="templates/Map logo.png" alt="Logo Sitmapp" class="responsive animated bounceIn"/>
                    </a>
                </div>

                <a href="#" class="toggle_menu" onclick="navigation()">
                    <i class="fa fa-navicon"></i>
                </a>
                <nav class="menu">
                    <ul>
                        <!--                    <li id="li_Home-Administrador"> <a href="Home_Administrador.jsp">
                                                    <img src="templates/icons8-casa.svg" class="iconos_png" alt="Icono home administrador"/>
                                                    Menu Principal</a></li> -->
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
                        <li><a href="#">
                                <img src="templates/icons8-info.svg" class="iconos_a" >Informacion</a>
                        </li>

                        <li><a href="Home.jsp">  
                                <img src="templates/icons8-external-link.svg" class="iconos_a" >Modo Usuario</a>
                        </li>
                        <li><a href="Editar_Configuracion.jsp">  
                                <img src="templates/icons8-settings-50.svg" class="iconos_a" >Configuracion</a>
                        </li>

                        <li><a href="./USCerrarSesion?var=off">
                                <img src="templates/icons8-key.svg" class="iconos_a" >Cerrar sesion</a>
                        </li>
                    </ul>
                </nav>

            </header>
            <script>
                var tipo = '<%=valor%>';
                if (tipo === 'usuario') {
                    $('#adm_home').hide();
                    $('#li_Home-Conductor').hide();
                }
                if (tipo === 'conductor') {
                    $('#adm_home').hide();
                }
                if (tipo === 'administrador') {
                    $('#li_Home-Conductor').hide();
                }
                if (tipo == 'moderador') {
                    $('#li_Home-Conductor').hide();
                    $('#li_Home-Conductor').hide();
                    $('#adm_home').hide();
                }
            </script>

            <div class="container">
                <h1 style="margin: 2%"> <strong>  Rutas registradas </strong> </h1>
            </div>
            <div class="container">
                <br>
                <div class="row">
                    <div class="col-md-8">
                        <%if (RutaControllers.list().size() > 0) {%>
                        <table class="table table-striped" style="text-align: center;">
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
                            <% for (Ruta r : RutaControllers.list()) {%>
                            <tr>
                                <td><%=r.getNombre_Ruta()%></td>
                                <td><%=r.getTipo_Ruta()%></td>
                                <td>
                                    <%for (String p : RutaControllers.listParada(r.getId_ruta())) {%>
                                    <label><%=p%></label><br>
                                    <%}%>
                                </td>
                                <td>
                                    <label><strong>Lunes - Viernes: <%=r.getLunes_viernes()%></strong></label><br>
                                    <label><strong>Sabados: <%=r.getSabado()%></strong></label><br>
                                    <label><strong>Domingo - Festivos: <%=r.getDomingo_festivo()%></strong></label><br>
                                </td>

                                <td><a style='font-size:24px' class='fas' href="./Editar_Rutas.jsp?id=<%=r.getId_ruta()%>"><img src="templates/icons8-edit.svg" class="icono_edit" width="30" height="30"></a></td>
                                <td><a style='font-size:24px' class='fas' href="./SREliminar?Id=<%=r.getId_ruta()%>"><img src="templates/icons8-remove.svg" class="icono_edit" width="30" height="30"></a> </td>
                            </tr>
                            <%}%>
                        </table>
                        <%} else {%>
                        <div class="alert alert-danger" role="alert">
                            <h3><strong>No hay Rutas registradas</strong></h3>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>

                        </div>
                        <%}%>
                    </div>
                    <div><br></div>
                    <div class="col-md-3">
                        <div >
                            <button class="btn form-control btn-light" style="width: 200px;margin-left: 5%;font-size: 120%">
                                <a href="Añadir_Rutas.jsp" style="font-size: 120%">Registrar Ruta</a>
                            </button>
                        </div>
                    </div>

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
