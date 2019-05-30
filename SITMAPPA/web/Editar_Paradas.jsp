<%@page import="sitmapp.controllers.parada.ParaderoController"%>
<%@page import="sitmapp.models.Parada"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="index.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Vista Administrador</title>
        <meta charset="UTF-8">
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
        <link href="css/mapa.css" rel="stylesheet" type="text/css"/>
    </head>
    <body> 
        <!-- Java Space -->  

        <%
            int id = 0;
            String valor = "";
            String tipo = "";
            String nombre = "";
            double lng = 0;
            double lat = 0;

            try {
                Usuario u = (Usuario) session.getAttribute("usuario");
                valor = u.getTipo_usuario();
                if (!valor.equalsIgnoreCase("administrador")) {
                    response.sendRedirect("Home.jsp");
                }
                id = Integer.parseInt(request.getParameter("Id"));
                nombre = request.getParameter("Nom");
                lat = Double.parseDouble(request.getParameter("Lat"));
                lng = Double.parseDouble(request.getParameter("Lng"));
                tipo = request.getParameter("Tipo");
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
                <h1 style="margin: 2%"> <strong> Editar Parada </strong> </h1>
            </div>

            <div class="container">
                <br>
                <div class="row">
                    <div class="col-md-7"> 
                        <!-- Map IMG Space -->
                        <div id='map'>
                        </div>
                        <!-- Map script Space -->
                        <script>

                            var opc = 0; // id de la opcion seleccionada
                            var marker; // marcador
                            var map;
                            var no_marcadores = 0;
                            var marker_array = [];

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

                                var latitude_init = '<%=lat%>';
                                var longitude_init = '<%=lng%>';
                                var map = L.map('map').setView([latitude_init, longitude_init], 17);

                                var init_marker = L.marker([latitude_init, longitude_init]).addTo(map);

                                L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
                                    maxZoom: 18
                                }).addTo(map);

                                L.control.scale().addTo(map);

                                //How to add a marker
                                map.on('click', function (e) {
                                    map.removeLayer(init_marker); //remove init_marker
                                    init_marker = L.marker([e.latlng.lat, e.latlng.lng]).addTo(map); // create a new marker with new parameters lat & lng
                                    $('#latitude').val(e.latlng.lat);
                                    $('#longitude').val(e.latlng.lng);
                                    //How to add a marker
                                    init_marker.on('click', function () {
                                        map.removeLayer(init_marker)
                                    });
                                });









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
                            <%for (Parada par : ParaderoController.list()) {%>
                            <% if (par.getTipo().equalsIgnoreCase("estacion")) {%>
                                marker = L.marker([<%=par.getLatitud()%>, <%=par.getLongitud()%>], {icon: estacion}).addTo(map);
                                marker_array.push(marker);
                                no_marcadores++;

                            <%} else {%>


                                marker = L.marker([<%=par.getLatitud()%>, <%=par.getLongitud()%>], {icon: paradero}).addTo(map);
                                marker_array.push(marker);
                                no_marcadores++;


                            <%}%>

                            <%}%>


                            }
                            function acucuracy() {
                                var geo_options = {
                                    enableHighAccuracy: true,
                                    maximumAge: 30000,
                                    timeout: 27000
                                };
                            }
                        </script>
                    </div>
                    <!--                    <div>
                                            <br>
                                        </div>	-->
                    <div class="col-md-5">
                        <form method="post" action="PModificar">

                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label><strong>Nombre:</strong></label>
                                    <input class="form-control" type="text" name="nombre_parada" placeholder="Ingrese nombre" required value="<%=nombre%>">
                                </div>
                            </div>
                            <div class="form-row" style="display: none;">
                                <div class="form-group col-md-12">
                                    <label><strong>Id:</strong></label>
                                    <input class="form-control" type="number" name="id" placeholder="Ingrese nombre..."  value="<%=id%>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label><strong>Tipo:</strong></label>
                                    <select name="tipo_parada" class="form-control" style="align-content: center" >
                                        <option value="Estacion">Estacion</option>
                                        <option value="Paradero">Paradero</option>

                                    </select>  </div>
                            </div>
                            <!--Lat & Lng-->
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label><strong>Latitud:</strong></label>
                                    <input class="form-control" type="number" name="latitud_parada" id="latitude" readonly required placeholder="Seleccione en el mapa..." value="<%=lat%>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label><strong>Longitud:</strong></label>
                                    <input style="margin-bottom: 2%" class="form-control" type="number" name="longitud_parada" id="longitude" readonly required placeholder="Seleccione en el mapa..." value="<%=lng%>">
                                </div>
                            </div>
                            <!--Lat & Lng-->    
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <input type="submit" class="form-control btn btn-primary">
                                </div>
                            </div>



                        </form>
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
