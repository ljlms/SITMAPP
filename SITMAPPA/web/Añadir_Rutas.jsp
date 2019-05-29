<%@page import="sitmapp.controllers.parada.ParaderoController"%>
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

            ArrayList<Parada> paradas = null;

            String valor = "";

            try {
                Usuario u = (Usuario) session.getAttribute("usuario");
                valor = u.getTipo_usuario();
                if (!valor.equalsIgnoreCase("administrador")) {
                    response.sendRedirect("Home.jsp");
                }
                paradas = ParaderoController.list();
            } catch (Exception e) {

                response.sendRedirect("errorSesion?error=La sesion ha cerrado, ingrese nuevamente");
                //              response.sendRedirect("../index.jsp?error=La sesion cerró, ingrese nuevamente");

            }

        %>
        <!-- Java Space --> 
        <section class="wrapper clearfix" data-section="home">
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
                    $('#driver_home').hide();
                }
                if (tipo === 'conductor') {
                    $('#adm_home').hide();
                }
                if (tipo === 'administrador') {
                  
                    $('#li_Home-Conductor').hide();
                }
            </script>
            <div class="container">
                <div>
                    <h1 style="margin: 5%"> <label>  <strong>Añadir Rutas</strong> </label> </h1>
                </div>
                <div class="row"> <!-- Primera Fila Troncales - Pretroncales -->
                    <div class="col-md-1"></div>
                    <div class="col-md-9">
                        <form action="SRregistrar" method="post" class="form formulario">
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
                                    <label><strong>Paraderos:</strong></label>


                                    <%    if (paradas.size() > 0) {
                                            for (Parada x : paradas) {%>

                                    <div class="form-check-inline">
                                        <input class="form-check-input" name="paradas[]" type="checkbox" value="<%=x.getIdParada()%>" id="<%=x.getNombre()%>"  class="form-control"  >
                                        <label class="form-check-label" style="margin: 2%" for=<%=x.getNombre()%> >
                                            <%=x.getNombre()%>
                                        </label>
                                    </div>

                                    <%}
                                    } else {%>

                                    <label >
                                       No hay paraderos registrados
                                    </label>
                                    <%}%>

                                </div>

                                <div class="form-group col-md-6">
                                    <table class="table">
                                        <thead><label><strong>Horarios</strong></label></thead>
                                        <tr>
                                            <td > Lunes - Viernes: </td>
                                            <td > <input type="time" name="hora_inicio_lunes_viernes" id="lunes-viernes-inicio"  class="form-control" > </td>
                                            <td > <input type="time" name="hora_final_lunes_viernes" id="lunes-viernes-final"  class="form-control" ></td>
                                        </tr>

                                        <tr>
                                            <td >Sabados: </td>
                                            <td ><input type="time" name="hora_inicio_sabados" id="sabado-inicio"  class="form-control" ></td>
                                            <td ><input type="time" name="hora_final_sabados" id="sabado-final" class="form-control" ></td>
                                        </tr>
                                        <tr>
                                            <td >Domingos/Festivos: </td>
                                            <td><input type="time" name="hora_inicio_domingos_festivos" id="domingos-festivos-inicio" class="form-control" ></td>
                                            <td ><input type="time" name="hora_final_domingos_festivos" id="domingos-festivos-final"  class="form-control" ></td>
                                        </tr>
                                    </table>

                                </div>

                                <div style="margin-bottom: 12px;margin-left: 10px">
                                    <strong>Nota:</strong> no ingresar hora los días que no opere la ruta.
                                </div>

                                <div class="form-group col-md-12">
                                    <input type="submit" name="enviar" id="enviar_input" class="form-control btn btn-primary" value="Añadir ruta" style="width: 100px;">
                                </div>
                            </div>
                        </form>
                    </div>


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
