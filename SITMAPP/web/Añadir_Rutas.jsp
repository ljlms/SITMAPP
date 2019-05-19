<%@page import="java.util.ArrayList"%>
<%@page import="sitmapp.models.Parada"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Añadir Rutas</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/><!--Min-->
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="css/principalStyle.css" rel="stylesheet" type="text/css"/>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGQUFgalVpzmjnc3sWaRg7cJZDaFXqZq8"></script>
    </head>
    <body>
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
            ArrayList<Parada> paradas = sitmapp.controllers.parada.ParaderoController.list(); //it returns all paradas saved in db

        %>
        <!-- Java Space --> 
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
                        <li id="li_registrar-paradas"> <a href="Administrar_Paradas.jsp">
                            <img src="templates/icons8-map-marker-48.png" class="iconos_png" alt="Icono administrar paradas"/>
                            Admin. Paradas</a></li> 
                        <li id="li_registrar-rutas"> <a href="Administrar_Rutas.jsp">
                                <img src="templates/icons8-map-editing-48.png" class="iconos_png" alt=""/>
                                Admin. Rutas</a>   </li> 
                        <li id="registrar-empresa"> <a href="Administrar_Empresa.jsp">
                                <img src="templates/icons8-contact-us-48.png" alt=""/>
                                Admin. Empresa </a> </li>
                        <li id="registrar-articulado"> <a href="Administrar_Articulados.jsp">
                                <img src="templates/icons8-bus-48.png" class="iconos_png" alt=""/>
                                Admin. Articulados </a> </li>

                        <li id="administrar-usuarios"> <a href="Administrar_Usuarios.jsp">
                                <img src="templates/icons8-user-account-48.png"  class="iconos_png"alt=""/>
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
            <div class="container">
                <div>
                    <h1 style="margin: 5%"> <label>  <strong>Añadir Rutas</strong> </label> </h1>
                </div>
                <div class="row"> <!-- Primera Fila Troncales - Pretroncales -->
                    <div class="col-md-1"></div>
                    <div class="col-md-9">
                        <form action="SRregistrar" method="post" class="form">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nombre"><strong>Nombre:</strong></label>
                                    <input type="text" class="form-control " name="nombre_ruta" id="nombre" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tipo"><strong>Tipo Ruta:</strong></label>
                                    <input type="text" class="form-control" id="tipo" name="tipo_ruta" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nada"><strong>Paraderos:</strong></label>
                                    <div id="nada"></div>
                                    <div class="form-check-inline">
                                        <%for (Parada x : paradas) {%>
                                        <input type="checkbox" name="paradas[]" value="<%=x.getIdParada()%>"><label style="margin-right: 10px;"><%=x.getNombre()%></label>
                                            <%}%>
                                    </div><!--idparadas[i] = paradas.get(i).getIdParada();-->
                                </div>

                                <div class="form-group col-md-6s">
                                    <table>
                                        <thead><label><strong>Horarios</strong></label></thead>
                                        <tr>
                                            <td style="padding: 1%"> Lunes - Viernes: </td>
                                            <td style="padding: 1%"> <input type="time" name="hora_inicio_lunes_viernes" id="lunes-viernes-inicio" min="05:00" max="11:00" step="600"> </td>
                                            <td style="padding: 1%"> <input type="time" name="hora_final_lunes_viernes" id="lunes-viernes-final" min="12:00"  step="600"></td>
                                        </tr>

                                        <tr>
                                            <td style="padding: 1%">Sabados: </td>
                                            <td style="padding: 1%"><input type="time" name="hora_inicio_sabados" id="sabado-inicio" min="05:00" max="11:00" step="600"></td>
                                            <td style="padding: 1%"><input type="time" name="hora_final_sabados" id="sabado-final" min="12:00"  step="600"></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 1%">Domingos/Festivos: </td>
                                            <td style="padding: 1%"><input type="time" name="hora_inicio_domingos_festivos" id="domingos-festivos-inicio" min="05:00" max="11:00" step="600"></td>
                                            <td style="padding: 1%"><input type="time" name="hora_final_domingos_festivos" id="domingos-festivos-final" min="12:00"  step="600"></td>
                                        </tr>
                                    </table>

                                </div>
                                    
                                    <div style="margin-bottom: 12px;margin-left: 10px">
                                       <strong>Nota:</strong> no ingresar hora los días que no opere la ruta.
                                    </div>
                                    
                                <div class="form-group col-md-12">
                                    <input type="submit" name="enviar" id="enviar_input" class="form-control btn btn-primary" value="Añadir">
                                </div>
                            </div>
                        </form>
                    </div>

                    <aside class="col-md-2">
                        <div class="">
                            <button class="btn btn-light form-control active" >
                                <a href="Añadir_Rutas.jsp">Registrar Ruta</a>
                            </button>
                        </div>   
                    </aside>
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
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.bundle.js" type="text/javascript"></script>
        <script src="js/Visibility.js" type="text/javascript"></script>
        <script src="js/principalJavaScript.js" type="text/javascript"></script>
    </body>
</html>
