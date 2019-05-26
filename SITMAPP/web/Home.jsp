<%@page import="sitmapp.controllers.articulado.ArticuladoController"%>
<%@page import="sitmapp.models.Articulado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sitmapp.models.Ruta"%>
<%@page import="sitmapp.controllers.ruta.RutaControllers"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vista Principal</title>
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
        <script src="https://unpkg.com/leaflet@1.0.2/dist/leaflet.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/animate.css"><!--Aniamte library-->
        <script src="js/SmartSuppChat.js"></script>
        <style>
            #map {
                width: 600px;
                height: 520px;
            }
        </style>
    </head>
    <body> 
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
        %>

        <!-- Menu -->
        <section class="wrapper clearfix" data-section="home">
            <header class="header">
                <div class="logo">
                    <a href="javascript:void(0);">
                        <img src="templates/Map logo.png" alt="Logo Sitmapp" class="responsive animated bounceIn"/>
                    </a>
                </div>

                <a href="#" class="toggle_menu" >
                    <i class="fa fa-navicon"></i>
                </a>

                <nav class="menu">
                    <ul>
                        <li class="active">
                            <a href="Home.jsp">
                                <img src="templates/icons8-home.svg" class="iconos_nav">
                                Menu Principal</a></li>

                        <li><a href="Ver_Rutas.jsp">
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
                        <li><a href="#">
                                <img src="templates/icons8-info.svg" class="iconos" ></a>
                            </i></a></li>

                        <li id="adm_home"><a href="Home_Administrador.jsp">  
                                <img id="img_home" src="templates/icons8-puzzle.svg" class="iconos" ></a>
                            </i></a></li>

                        <li id="driver_home"><a href="Home_Conductor.jsp">  
                                <img id="img_home" src="templates/icons8-conductor-48.png" class="iconos" ></a>
                            </i></a></li>

                        <li><a href="#">
                                <img src="templates/icons8-settings-50.svg" class="iconos" ></a>
                            </i></a></li>

                        <li><a href="./USCerrarSesion?var=off">
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
            <div class="container" style="margin-top: 3%; margin-bottom: 2%">
                <h3><strong>Menú Principal</strong></h3>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-5"> 
                        <div id="map"></div>

                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <table class="table table-bordered" style="text-align: center;">
                            <tr>
                                <td><strong>Seleccione Ruta</strong></td>
                            </tr>
                            <tr>
                                <td>
                                    <select name="ruta" id="ruta_select" required>
                                        <option disabled selected value="0"></option>
                                        <%for (Ruta r : RutaControllers.list()) {%>
                                        <option value="<%=r.getId_ruta()%>" id="opt"> <%=r.getNombre_Ruta()%> </option>
                                        <%}%>
                                    </select>
                                </td>
                            </tr>

                            <script>
                                var opc = 0; // id de la opcion seleccionada
                                var marker; // marcador
                                var map;
                                var no_marcadores = 0;
                                var marker_array = [];
                                function showPosition(position) {
                                    map = L.map('map').setView([position.coords.latitude, position.coords.longitude], 18);
                                    L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
                                        maxZoom: 18
                                    }).addTo(map);
                                    L.control.scale().addTo(map);

                                    $('#ruta_select').change(function () {
                                        opc = $('#ruta_select').val();
                                        $.ajax({
                                            url: './VisualizarRutaMapa',
                                            data: {
                                                'IdRuta': opc
                                            },
                                            type: 'POST',
                                            success: function (result) {
                                                // java space
                                                var i;
                                                $('#ruta_select').change(function () {
                                                    for (i = 0; i < no_marcadores; i++) {
                                                        map.removeLayer(marker_array[i]);
                                                    }
                                                });
                                <%for (Articulado art : ArticuladoController.list()) {%>
                                                if (opc == <%=art.getRuta_IdRuta()%>) {
                                                    marker = L.marker([<%=art.getUbicacion_Latitud()%>, <%=art.getUbicacion_Longitud()%>]).addTo(map);
                                                    marker_array.push(marker);
                                                    no_marcadores++;
                                                }
                                <%}%>
                                            }
                                        });

                                    });
                                }
                                function geo_error() {
                                    alert("Sorry, no position available.");
                                }

                                function acucuracy() {
                                    var geo_options = {
                                        enableHighAccuracy: true,
                                        maximumAge: 30000,
                                        timeout: 27000
                                    };
                                }

                                navigator.geolocation.watchPosition(showPosition, geo_error, acucuracy);

                            </script>
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