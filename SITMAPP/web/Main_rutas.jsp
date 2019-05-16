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
    </head>
    <body> 
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
        %>
        <!-- Menu -->
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
                    <li><a href="#">
                            <img src="templates/icons8-news.svg" class="iconos_nav">
                            Sección de Noticias</a></li>
                    <li><a href="#">
                            <img src="templates/icons8-speech-bubble.svg" class="iconos_nav">  
                            Chat</a></li>
                    <li class="active"><a href="Main_rutas.jsp">
                            <img src="templates/icons8-waypoint-map-48.png" class="iconos_png" alt=""/>
                            Rutas</a></li>
                </ul>
            </nav>

            <div class="footer clearfix">
                <ul class="social clearfix">
                    <li><a href="#"><i>
                                <img src="templates/icons8-info.svg" class="iconos" ></a>
                            </i></a></li>

                    <li><a href="Home_Administrador.jsp"><i>   
                                <img src="templates/icons8-puzzle.svg" class="iconos" ></a>
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
        <!-- Menu -->

        <div class="container">
            <div>
                <br>
            </div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4 col-xs-4" >   <!-- Imagenes Horarios -->
                    <div class="text-center">
                        <div id="blank_space">
                        </div>
                        <table style="text-align: center; border: 1px solid black;">
                            <tr>
                                <td>
                                    <label for="horarios"> <h1> <strong> Horarios </strong> </h1> </label>
                                    <div id="horarios">
                                        <label for="tipo_lunes-viernes">Lunes - Viernes</label>
                                        <label for="tipo_lunes-viernes">Lunes - Viernes</label>
                                        <div style="margin: 5px;"></div>
                                        <label id="tipo_lunes-viernes"> 5:30 am - 9:00 pm    </label>
                                        <div style="margin: 5px;"></div>
                                        <label for="tipo_sabado">Sabado</label>
                                        <div style="margin: 5px;"></div>
                                        <label id="tipo_sabado"> 5:30 am - 9:00 pm</label>
                                        <div style="margin: 5px;"></div>
                                        <label for="tipo_domingo-festivo">Domingo/Festivo</label>
                                        <div style="margin: 5px;"></div>
                                        <label id="tipo_domingo-festivo"> 7:00 am - 8:00 pm </label>
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
                <div>
                    <br>
                </div>	
                <div class="col-md-4 col-xs-4" style="position: fixed; right: 0;"><!-- Seleccionar -->
                    <table class="table" style="text-align: center; border: 1px solid black">
                        <th style="text-align: center; border: 1px solid black">
                            <label for=""><h3>Mostrar Información </h3></label>
                        </th>
                        <tr> <!-- Selecionar el tipo de ruta -->
                            <td>
                                <div>
                                    <h4>Tipo Ruta</h4>
                                    <select id="tipo_ruta" onchange="ver_horarios()">
                                        <option value="nada">  </option>
                                        <option value= "t_alimentadoras"> Alimentadoras </option>
                                        <option value="t_troncales"> Troncales </option>}
                                        <option value="t_pre-troncales"> Pre-Troncales </option>}
                                        <option value="t_circulares"> Circulares </option>}
                                    </select>
                                </div>
                                </div>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
        </div>
        
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