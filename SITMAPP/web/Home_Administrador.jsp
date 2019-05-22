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
        <link rel="stylesheet" href="css/animate.css"><!--Aniamte library-->
        <script src="js/SmartSuppChat.js"></script>

        <style>
            #map {
                width: 700px;
                height: 550px;
            }
        </style>
    </head>
    <body> 
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
        %>

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
                <br>
                <div class="row">
                    <div class="col-md-8"> 
                        <div id="map"></div>
                        <script>
            function showPosition(position) {
                var map = L.map('map').setView([position.coords.latitude, position.coords.longitude], 18);

                L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
                    maxZoom: 18
                }).addTo(map);
                L.control.scale().addTo(map);
                L.marker([position.coords.latitude, position.coords.longitude]).addTo(map);
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
                    </div>
                    <div>
                        <br>
                    </div>	
                    <div class="col-md-4">
                        <table class="table table-bordered" style="text-align: center;">
                            <th style="text-align: center;">
                                <label for=""><h3>Visualizar Articulados</h3></label>
                            </th>
                            <tr>  
                                <td>
                                    <div>
                                        <h4>Tipo Ruta</h4>
                                        <select id="tipo_ruta" onchange="tipo_ruta()">
                                            <option value="nada"></option>                        
                                            <option value="t_troncal">Troncales</option>
                                            <option value="t_pre">Pre-Troncales</option>
                                            <option value="t_alimentadoras">Alimentadoras</option>
                                            <option value="t_circulares">Circulares</option>
                                        </select>

                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>
                                        <h4>Seleccione Articulado</h4>
                                    </div>
                                    <div id="div_troncales" style="display: none;">  Troncales 
                                        <select id="" >
                                            <option value="">T100E</option>
                                            <option value="">T101</option>
                                            <option value="">T102</option>
                                            <option value="">T103</option>
                                        </select>
                                    </div>

                                    <div style="margin: 10px;">
                                    </div>

                                    <div id="div_pre-troncales" style="display: none;">  Pre-Troncales 
                                        <select id="">
                                            <option value="">X101</option>
                                            <option value="">X102</option>
                                            <option value="">X103</option>
                                            <option value="">X104</option>
                                            <option value="">X105</option>
                                            <option value="">X106</option>
                                        </select>
                                    </div>

                                    <div style="margin: 10px;">
                                    </div>

                                    <div id="div_alimentadoras" style="display: none;">  Alimentadoras 
                                        <select id="">
                                            <option value="">A102</option>
                                            <option value="">A103</option>
                                            <option value="">A104</option>
                                            <option value="">A105</option>
                                            <option value="">A107</option>
                                            <option value="">A108</option>
                                            <option value="">A109</option>
                                            <option value="">A111</option>
                                            <option value="">A114</option>
                                            <option value="">A117</option>
                                        </select>
                                    </div>

                                    <div style="margin: 10px;">
                                    </div>

                                    <div id="div_circulares" style="display: none;">  Circulares 
                                        <select id="">
                                            <option value="">C015</option>
                                            <option value="">Ruta Circular RC</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
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