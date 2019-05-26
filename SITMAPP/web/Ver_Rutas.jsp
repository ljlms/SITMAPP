<%@page import="sitmapp.models.Ruta"%>
<%@page import="sitmapp.controllers.ruta.RutaControllers"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Información Rutas</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="visualizar_ruta.js"> // Script externo
        </script>
        <link href="css/principalStyle.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="ver_horarios.js"> // Script externo
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    </head>
    <body> 
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
        %>
        <!-- Menu -->
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
                        <li >
                            <a href="Home.jsp">
                                <img src="templates/icons8-home.svg" class="iconos_nav">
                                Menu Principal</a></li>
                        <li class="active"><a href="Ver_Rutas.jsp">
                                <img src="templates/icons8-waypoint-map-48.png" class="iconos_png" alt=""/>
                                Rutas</a></li>
                        <li><a href="#">
                                <img src="templates/icons8-news.svg" class="iconos_nav">
                                Sección de Noticias</a></li>
                        <li><a href="#">
                                <img src="templates/icons8-speech-bubble.svg" class="iconos_nav">  
                                Chat</a></li>

                    </ul>
                </nav>

                <div class="footer clearfix">
                    <ul class="social clearfix">
                        <li><a href="#"><i>
                                    <img src="templates/icons8-info.svg" class="iconos" ></a>
                                </i></a></li>

                        <li id="adm_home"><a href="Home_Administrador.jsp"><i>   
                                    <img id="img_home" src="templates/icons8-puzzle.svg" class="iconos" ></a>
                                </i></a></li>
                         <li id="driver_home"><a href="Home_Conductor.jsp">  
                                <img id="img_home" src="templates/icons8-conductor-48.png" class="iconos" ></a>
                            </i></a></li>
                        <li><a href="#"><i>   
                                    <img src="templates/icons8-settings-50.svg" class="iconos" ></a>
                                </i></a></li>

                        <li><a href="./USCerrarSesion?var=off"><i>
                                    <img src="templates/icons8-key.svg" class="iconos" ></a>
                                </i></a></li>
                    </ul>

                    <script>
            var tipo = '<%=valor%>';
            if (tipo === 'usuario') {
                $('#adm_home').hide();
                $('#driver_home').hide();
            }
            if (tipo === 'conductor') {
                $('#adm_home').hide();
            }
            if (tipo === 'administrador') {
                $('#driver_home').hide();
            }
                    </script>

                    <div class="right">
                        <p>Copyright © 2019.</p>
                    </div>
                </div>
            </header>
            <!-- Menu -->
            <div class="container" style="margin-top: 3%; margin-bottom: 2%">
                <h3><label><strong>Rutas Registradas</strong></label></h3>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <table style="text-align: center;" class="table table-striped">
                            <tr>
                                <td><label for=""> <strong>Nombre</strong> </label>
                                </td>
                                <td><label for=""> <strong>Tipo Ruta</strong> </label>
                                </td>
                                <td><label> <strong>Paraderos</strong> </label></td>
                                <td><label> <strong>Horario</strong> </label></td>
                            </tr>
                            <%if (RutaControllers.list().size() > 0) {%>
                            <%for (Ruta r : RutaControllers.list()) {%>
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
                            </tr>
                            <%}%>
                            <%} else {%>
                            <p>No hay rutas registradas, aún</p>
                            <%}%>
                        </table>
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