<%@page import="sitmapp.models.Noticia"%>
<%@page import="sitmapp.controllers.noticia.NoticiaController"%>
<%@page import="sitmapp.models.Ruta"%>
<%@page import="sitmapp.controllers.ruta.RutaControllers"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="index.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Ver Noticias</title>
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
            String valor = "";
            try {
                Usuario u = (Usuario) session.getAttribute("usuario");
                valor = u.getTipo_usuario();

            } catch (Exception e) {

                response.sendRedirect("errorSesion?error=La sesion ha cerrado, ingrese nuevamente");
                //              response.sendRedirect("../index.jsp?error=La sesion cerró, ingrese nuevamente");

            }
        %>
        <!-- Menu -->
        <section class="wrapper clearfix" data-section="home">
            <header class="header">
                <div class="logo">
                    <a href="Home.jsp">
                        <img src="templates/Map logo.png" alt="Logo Sitmapp" class="responsive animated bounceIn"/>
                    </a>
                </div>
                <a href="#" class="toggle_menu" onclick="navigation()">
                    <i class="fa fa-navicon"></i>
                </a>
                                     <nav class="menu" >
                    <ul>
                        <li class="active">
                            <a href="Home.jsp">
                                <img src="templates/icons8-home.svg" class="iconos_nav">
                                Menu Principal</a></li>
                        <li><a href="Ver_Rutas.jsp">
                                <img src="templates/icons8-waypoint-map-48.png" class="iconos_png" alt="Rutas icono"/>
                                Rutas</a></li>
                        <li><a href="Ver_Noticias.jsp">
                                <img src="templates/icons8-noticias.svg" class="iconos_png" alt="Noticias icono"/>
                                Noticias</a></li>
                        <li id="adm_noticias"><a href="Administrar_Noticias.jsp"
                                >
                                <img src="templates/icons8-news.svg" class="iconos_nav">
                                Administrar Noticias</a></li>

                        <li id="li_Home-Conductor"> <a href="Home_Conductor.jsp">
                                <img src="templates/icons8-conductor-48.png" class="iconos_png" alt="Icono home conductor"/>
                                Modo conductor</a></li>        
                        <li>
                            <a href="#">
                                <img src="templates/icons8-info.svg" class="iconos_a" >Informacion</a> 
                        </li> 
                        <li>  <a href="Home_Administrador.jsp"
                                 id="adm_home">  
                                <img id="img_home" src="templates/icons8-puzzle.svg" class="iconos_a" >Home Administrador</a></li>

                        <li> <a href="Editar_Configuracion.jsp">
                                <img src="templates/icons8-settings-50.svg" class="iconos_a" >Configuracion</a></li>
                        <li> <a href="./USCerrarSesion?var=off">
                                <img src="templates/icons8-key.svg" class="iconos_a" >Cerrar sesion</a></li>
                        </li>
                    </ul>
                </nav>

            </header>
            <script>
                var tipo = '<%=valor%>';
                  if (tipo === 'usuario') {
                      $('#adm_home').hide();
                      $('#li_Home-Conductor').hide();
                      $('#adm_noticias').hide();
                  }
                  if (tipo === 'conductor') {
                      $('#adm_home').hide();
                       $('#adm_noticias').hide();
                  }
                  if (tipo === 'administrador') {
                      $('#li_Home-Conductor').hide();
                  }
                  if (tipo === 'moderador') {
                      $('#li_Home-Conductor').hide();    
                      $('#adm_home').hide();
                  }
            </script>
            <!-- Menu -->
            <div class="container" style="margin-top: 3%; margin-bottom: 2%">
                <h3><label><strong>Noticias Publicadas</strong></label></h3>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <%if (NoticiaController.list().size() > 0) {%>
                        <table style="text-align: center;" class="table table-striped">
                            <tr>
                                </td>
                                <td><label for=""> <strong>Titulo</strong> </label>
                                </td>
                                <td><label> <strong>Contenido</strong> </label></td>
                                <td><label> <strong>Fecha</strong> </label></td>
                            </tr>
                            <%for (Noticia n : NoticiaController.list()) {%>
                            <tr>
                                <td><%=n.getTitulo()%></td>
                                <td><%=n.getContenido()%></td>
                                <td><%=n.getFecha()%></td>
                            </tr>
                            <%}%>
                        </table>
                        <%} else {%>
                        <h1>No hay noticias registradas</h1>
                        <%}%>
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