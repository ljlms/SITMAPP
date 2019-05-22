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
                        <li><a href="#">
                                <img src="templates/icons8-news.svg" class="iconos_nav">
                                Sección de Noticias</a></li>
                        <li><a href="#">
                                <img src="templates/icons8-speech-bubble.svg" class="iconos_nav">  
                                Chat</a></li>
                        <li><a href="Main_rutas.jsp">
                                <img src="templates/icons8-waypoint-map-48.png" class="iconos_png" alt=""/>
                                Rutas</a></li>
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
            }
                    </script>

                    <div class="right">
                        <p>Copyright © 2019.</p>
                    </div>
                </div>
            </header>
            <br>
            <div class="container">
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
                                        <div style="margin: 5px;">

                                        </div>
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