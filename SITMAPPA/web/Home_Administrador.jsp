<%@page import="sitmapp.controllers.parada.ParaderoController"%>
<%@page import="sitmapp.models.Parada"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sitmapp.models.Articulado"%>
<%@page import="sitmapp.controllers.articulado.ArticuladoController"%>
<%@page import="sitmapp.models.Ruta"%>
<%@page import="sitmapp.controllers.ruta.RutaControllers"%>
<%@page import="sitmapp.models.Usuario"%>
<%@ page errorPage="index.jsp" %>
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
        <link href="css/mapa.css" rel="stylesheet" type="text/css"/>
        <link href="css/principalStyle.css" rel="stylesheet" type="text/css"/>
        <script src="https://unpkg.com/leaflet@1.0.2/dist/leaflet.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
        <link rel="stylesheet" href="css/animate.css"><!--Aniamte library-->
        <script src="js/SmartSuppChat.js"></script>


    </head>
    <body> 
        <!-- Java Space -->  
        <%
            String valor = "";
            ArrayList<Articulado>  articulados = ArticuladoController.list();
            ArrayList<Ruta> rutas  = RutaControllers.list();
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
            </script>
        <section class="wrapper clearfix" data-section="home">
            <div class="container">
                <br>
                <div class="row">
                    <%if (rutas.size() > 0) {%>
                    <div class="col-xs-12 col-sm-12  col-md-9 col-lg-9"> 
                        <%} else {%>
                        <div class="col-xs-12 col-sm-12  col-md-12 col-lg-12"> 
                            <%}%>
                            <div>   
                                <div id="map"></div>
                            </div>
                        </div>
                     
                        <%if (rutas.size() > 0) {%>
                        <div class="col-md-3">
                            <table class="table table-bordered" style="text-align: center;">
                                <tr>
                                    <td><strong>Seleccione Ruta</strong></td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="ruta" id="ruta_select" required>
                                            <option disabled selected value="0"></option>
                                            <%for (Ruta r : rutas) {%>
                                            <option value="<%=r.getId_ruta()%>" id="opt"> <%=r.getNombre_Ruta()%> </option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>


                            </table>
                        </div>
                        <%}%>       

                    </div>
                </div>
        </section>
        <script>
                       if (navigator.geolocation) {
                navigator.geolocation.watchPosition(showPosition, geo_error, acucuracy);
            } else {
                alert("La Geolocalización no es soportada por este navegador");
            }

            function showPosition(position) {
                ejecucion(position.coords.latitude, position.coords.longitude);
            }
            function geo_error(error) {
                var lat = 10.411944;
                var log = -75.445639;
                var errores = {1: 'Permiso denegado', 2: 'Posición no disponible', 3: 'Expiró el tiempo de respuesta'};
                alert("Ubicacion: " + errores[error.code]);
                ejecucion(lat, log);
            }
            function ejecucion(lat, log) {
                var opc = 0; // id de la opcion seleccionada
                var marker; // marcador
                var map;
                var salida;
                var no_marcadores = 0;
                var marker_array = [];
                map = L.map('map').setView([lat, log], 13);
                L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
                    maxZoom: 18
                }).addTo(map);
                L.control.scale().addTo(map);
                var LeafIcon = L.Icon.extend({
                    options: {
                        iconSize: [38, 38],
                        shadowSize: [50, 64],
                        iconAnchor: [40, 40],
                        shadowAnchor: [4, 62],
                        popupAnchor: [-3, -76]
                    }
                });

                var paradero = new LeafIcon({iconUrl: 'templates/icons8-trolleybus-64.png'}),
                        estacion = new LeafIcon({iconUrl: 'templates/icons8-railway-station-48.png'});
            <%for (Parada par : ParaderoController.list()) {
            %>


            <% if (par.getTipo().equalsIgnoreCase("estacion")) {%>
                marker = L.marker([<%=par.getLatitud()%>, <%=par.getLongitud()%>], {icon: estacion}).addTo(map);
                marker_array.push(marker);
                no_marcadores++;

            <%} else {%>


                marker = L.marker([<%=par.getLatitud()%>, <%=par.getLongitud()%>], {icon: paradero}).addTo(map);
                marker_array.push(marker);
                no_marcadores++;


            <%}
                }%>
                $('#ruta_select').change(function () {
                    for (i = 0; i < no_marcadores; i++) {
                        map.removeLayer(marker_array[i]);
                    }

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
            <%for (Parada pa : RutaControllers.ListarTodasParadas()) {%>

                            if (opc == <%=pa.getIdRuta()%>) {
            <% if (pa.getTipo().equalsIgnoreCase("estacion")) {%>
                                marker = L.marker([<%=pa.getLatitud()%>, <%=pa.getLongitud()%>], {icon: estacion}).addTo(map).bindPopup();
                                marker_array.push(marker);
                                no_marcadores++;

            <%} else {%>


                                marker = L.marker([<%=pa.getLatitud()%>, <%=pa.getLongitud()%>], {icon: paradero}).addTo(map);
                                marker_array.push(marker);
                                no_marcadores++;


            <%}%>
                            }

            <%}%>


                        }
                    });
                });
            }
            function acucuracy() {
                var geo_options = {
                    enableHighAccuracy: true,
                    maximumAge: 30000,
                    timeout: 27000
                };
            }
        </script>
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