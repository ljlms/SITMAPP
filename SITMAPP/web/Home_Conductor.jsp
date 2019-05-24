<%@page import="sitmapp.controllers.usuario.UsuarioController"%>
<%@page import="sitmapp.models.Ruta"%>
<%@page import="sitmapp.controllers.ruta.RutaControllers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sitmapp.controllers.articulado.ArticuladoController"%>
<%@page import="sitmapp.models.Articulado"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vista Conductor</title>
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
        <link rel="stylesheet" href="css/animate.css"><!--Animate library-->
        <script src="js/SmartSuppChat.js"></script> <!--Chat Script-->
        <script src="https://unpkg.com/leaflet@1.0.2/dist/leaflet.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!--JQuery + AJAX-->
        <style>
            #map {
                width: 400px;
                height: 450px;
            }
        </style>
    </head>
    <body> 
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            ArrayList<Articulado> articulado_list = ArticuladoController.list();
            ArrayList<Ruta> ruta_list = RutaControllers.list();
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
                    <li id="li_Home-Conductor"> <a href="Home_Conductor.jsp">
                            <img src="templates/icons8-casa.svg" class="iconos_png" alt="Icono home conductor"/>
                            Menú Principal</a></li>
                    <li id="li_Editar-Perfil-Conductor"> <a href="Editar_Perfil_Conductor.jsp">
                            <img src="templates/icons8-conductor-64.png" class="iconos_png" alt="Icono editar perfil"/>
                            Editar Perfil</a></li> 
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
            <div class="container" style="margin-top: 3%; margin-bottom: 3%">
                <h2><strong>Menú Principal</strong></h2>
            </div>
            <% if (ArticuladoController.VerificarActividad(u.getId_usuario()) == false) {%>
            <div class="container">
                <form action="AsignarRutaConductor" method="post">
                    <div style="visibility: hidden;">
                        <input type="number" class="form-control" name="IdConductor" value="<%=u.getId_usuario()%>">
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <%if (articulado_list.size() > 0) {%>
                            <table class="table table-bordered" style="text-align: center">
                                <tr>
                                    <td colspan="4"><strong><label>Articulados Disponibles</label></strong></td>
                                </tr>
                                <tr>
                                    <td><label><strong>Codigo</strong></label></td>
                                    <td><label><strong>Placa</strong></label></td>
                                    <td><label><strong>Empresa</strong></label></td>
                                    <td><label><strong>Asignar</strong></label></td>
                                </tr>
                                <%for (Articulado art : articulado_list) {%>
                                <%if (art.getEstado().equalsIgnoreCase("NO ASIGNADO")) {%>
                                <tr>
                                    <td><%=art.getCodigo_Articulado()%></td>    
                                    <td><%=art.getPlaca()%></td>    
                                    <td><%=art.getNombre_Empresa()%></td>    
                                    <td><input type="radio" value="<%=art.getIdArticulado()%>" name="IdArticulado" required></td>    
                                </tr>
                                <%}%>
                                <%}%>
                            </table>
                            <%} else {%>
                            <div>
                                <p>No hay articulados registrados en la plataforma</p>
                            </div>
                            <%}%>
                        </div>
                        <div class="col-md-2"></div>

                        <div class="col-md-5">
                            <%if (ruta_list.size() > 0) {%>
                            <table style="text-align: center;" class="table table-bordered">
                                <tr>
                                    <td colspan="3"><label><strong>Rutas Registradas</strong></label></td>
                                </tr>
                                <tr>
                                    <td><label><strong>Nombre</strong></label></td>
                                    <td><label><strong>Tipo</strong></label></td>
                                    <td><label><strong>Asignar</strong></label></td>
                                </tr>
                                <%for (Ruta rut : ruta_list) {%>
                                <tr>
                                    <td><%=rut.getNombre_Ruta()%></td>    
                                    <td><%=rut.getTipo_Ruta()%></td>    
                                    <td><input type="radio" value="<%=rut.getId_ruta()%>" name="IdRuta" required></td>
                                </tr>
                                <%}%>
                            </table>
                            <%} else {%>
                            <p>No hay rutas registradas en la plataforma</p>
                            <%}%>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <input type="submit" class="btn btn-primary formulario" value="Asignar">
                        </div>
                    </div>
                    <div class="row">
                        <br>
                    </div>
                </form>

            </div>
            <%} else {%>
            <!--Java Space-->
            <%
                //Articulado que tiene asignado el conductor
                Articulado articulado = ArticuladoController.ArticuladoEspecificoConductor(u.getId_usuario());
                //Ruta que tiene asignado el articulado
                Ruta ruta = RutaControllers.BusquedaRuta(articulado.getRuta_IdRuta());
            %>
            <!--Java Space-->
            <div class="container">
                <h2 style="color: red"><strong>Advertencia:</strong> usted aún tiene asignado un articulado.</h2>
                <div class="row">
                    <div class="col-md-5"><!--Mapa-->
                        <div id="map"></div>
                        <p id="demo"></p>
                        <script>
            var x = document.getElementById("demo");
            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.watchPosition(showPosition);
                } else {
                    x.innerHTML = "Geolocation is not supported by this browser.";
                }
            }
            function showPosition(position) {
                var map = L.map('map').setView([position.coords.latitude, position.coords.longitude], 18);

                $.ajax({
                    url: './UbicacionArticulado',
                    data: {
                        'lat': position.coords.latitude,
                        'lng': position.coords.longitude,
                        'IdArticulado': <%=articulado.getIdArticulado()%>,
                    },
                    type: 'POST',
                    success: function (result) {
                        // If your backend page sends something back
//                alert(result);
                    }
                });

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
                    <div class="col-md-5"><!--Tabla-->
<table class="table table-bordered" style="text-align: center;">
                            <tr>
                                <td><label><strong>Ruta</strong></label></td>
                                <td><label><strong>Cod. Articulado</strong></label></td>
                                <td><label><strong>Placa</strong></label></td>
                                <td><label><strong>Conductor</strong></label></td>
                            </tr>
                            <tr>
                                <td><%=ruta.getNombre_Ruta()%></td>
                                <td><%=articulado.getIdArticulado()%></td>
                                <td><%=articulado.getPlaca()%></td>
                                <td><%=u.getNombre()%> <%=u.getApellidos()%></td>
                            </tr>
                        </table>
                            <div class="container" style="margin-top: 3%">
                            <div class="row">
                                <div class="col-md-4">
                                    <a href="./FinalizarLocalizacion?IdArticulado=<%=articulado.getIdArticulado()%>&IdConductor=<%=u.getId_usuario()%>"><button type="button" class="form-control btn btn-dark formulario">Finalizar</button></a>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
            <%}%>
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