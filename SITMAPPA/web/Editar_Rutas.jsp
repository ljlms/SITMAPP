<%@page import="java.util.List"%>
<%@page import="sitmapp.controllers.ruta.RutaControllers"%>
<%@page import="sitmapp.models.Ruta"%>
<%@page import="sitmapp.models.Parada"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    </head>
    <body> 
        <!-- Java Space -->  
        <%

            int id = Integer.parseInt(request.getParameter("Id"));
            String valor = "";
            String tipo = "";
            String nombre = "";
            double lng = 0;
            double lat = 0;
          
            Ruta ruta = RutaControllers.BusquedaRuta(id);

            ArrayList<Parada> paraderos= null ;
            ArrayList<Parada> paraderos_todos = null;

            String lunes_viernes_inicio = "";
            String lunes_viernes_final = "";
            String sabado_inicio = "";
            String sabado_final = "";
            String domingo_festivo_inicio = "";
            String domingo_festivo_final = "";

            try {
                Usuario u = (Usuario) session.getAttribute("usuario");
                valor = u.getTipo_usuario();
                paraderos= RutaControllers.BusquedaParadasDeRutaEspecifica(id); //Paradas asignadas.
                paraderos_todos= RutaControllers.listTodasParadas(); 
                if (!valor.equalsIgnoreCase("administrador")) {
                    response.sendRedirect("Home.jsp");
                }
                id = Integer.parseInt(request.getParameter("Id"));
                nombre = request.getParameter("Nom");
                lat = Double.parseDouble(request.getParameter("Lat"));
                lng = Double.parseDouble(request.getParameter("Lng"));
                tipo = request.getParameter("Tipo");
                if (!ruta.getLunes_viernes().equalsIgnoreCase("No Opera")) {
                    String lunes_viernes[] = ruta.getLunes_viernes().split("-");
                    lunes_viernes_inicio = lunes_viernes[0];
                    lunes_viernes_final = lunes_viernes[1];
                }

                if (!ruta.getSabado().equalsIgnoreCase("No Opera")) {
                    String sabado[] = ruta.getSabado().split("-");
                    sabado_inicio = sabado[0];
                    sabado_final = sabado[1];

                }

                if (!ruta.getDomingo_festivo().equalsIgnoreCase("No Opera")) {
                    String domingo_festivo[] = ruta.getDomingo_festivo().split("-");
                    domingo_festivo_inicio = domingo_festivo[0];
                    domingo_festivo_final = domingo_festivo[1];
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
                $('#driver_home').hide();
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
                <h1 style="margin-top: 4%; margin-bottom: 3%"> <strong> Editar Ruta </strong> </h1>
            </div>
            <div class="container">

                <div> <!-- Primera Fila Troncales - Pretroncales -->

                    <div class="col-md-9">
                        <form action="SRModificar" method="post" class="form formulario">
                            <div style="display: none"><input type="text" value="<%=id%>" name="id_ruta"></div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label><strong>Nombre</strong></label>
                                    <input type="text" class="form-control" value="<%=ruta.getNombre_Ruta()%>" name="nombre_ruta" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label><strong>Tipo</strong></label>
                                    <input type="text" class="form-control" value="<%=ruta.getTipo_Ruta()%>" name="tipo_ruta" required>
                                </div>
                            </div>

                            <div class="form-row">


                                <div class="form-group col-md-6">
                                    <table class="table">
                                        <thead><label><strong>Horarios</strong></label></thead>
                                        <tr>
                                            <td>Lunes - Viernes</td>
                                            <td><input class="form-control" type="time" value="<%=lunes_viernes_inicio%>" name="lunes_inicio"></td>
                                            <td><input class="form-control" type="time" value="<%=lunes_viernes_final%>" name="lunes_final"></td>
                                        </tr>

                                        <tr>
                                            <td>Sabados</td>
                                            <td><input class="form-control" type="time" value="<%=sabado_inicio%>" name="sabado_inicio"></td>
                                            <td><input class="form-control" type="time" value="<%=sabado_final%>" name="sabado_final"></td>
                                        </tr>

                                        <tr>
                                            <td>Domingos - Festivos</td>
                                            <td><input class="form-control" type="time" value="<%=domingo_festivo_inicio%>" name="domingo_festivo_inicio"></td>
                                            <td><input class="form-control" type="time" value="<%=domingo_festivo_final%>" name="domingo_festivo_final"></td>
                                        </tr>
                                    </table>

                                </div>
                                <div class="form-group col-md-6">
                                    <table class="table border">

                                        <tr>
                                            <td colspan="2"><label><strong>Paraderos Asignados</strong></label></td>
                                        </tr>
                                        <tr>
                                            <td><label><strong>Nombre</strong></label></td>
                                            <td><label><strong>Eliminar</strong></label></td>
                                        </tr>
                                        <%for (Parada a : paraderos) {%>
                                        <tr>
                                            <td><%=a.getNombre()%></td>    
                                            <td><a style='font-size:24px' class='fas' href="./EliminarParadaRuta?IdParada=<%=a.getIdParada()%>&IdRuta=<%=id%>"><img src="templates/icons8-remove.svg" class="icono_edit" width="20" height="20"></a> </td>
                                        </tr>
                                        <%}%>
                                    </table>

                                </div>
                                <div class="form-group col-md-6">
                                    <table class="table border">
                                        <tr>
                                            <td colspan="2"><label><strong>Paraderos Disponibles</strong></label></td>
                                        </tr>

                                        <tr>
                                            <td><label><strong>Nombre</strong></label></td>
                                            <td><label><strong>Añadir</strong></label></td>
                                        </tr>
                                        <%for (Parada p : RutaControllers.ParadasDiferentes(paraderos, paraderos_todos)) {%>
                                        <tr>
                                            <td><%=p.getNombre()%></td>
                                            <td><input type="checkbox" value="<%=p.getIdParada()%>" name="id_paradas[]"></td>
                                        </tr>
                                        <%}%>
                                    </table>

                                </div>
                                <div style="margin-bottom: 12px;margin-left: 10px">
                                    <strong>Nota:</strong> no ingresar hora los días que no opere la ruta.
                                </div>

                                <div class="form-group col-md-12">
                                    <input type="submit" name="enviar" id="enviar_input" class="form-control  btn-primary" value="Editar ruta" style="width: 100px;">
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
        <!-- / lightModal -->
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.bundle.js" type="text/javascript"></script>
        <script src="js/Visibility.js" type="text/javascript"></script>
        <script src="js/principalJavaScript.js" type="text/javascript"></script>
    </body>
</html>
