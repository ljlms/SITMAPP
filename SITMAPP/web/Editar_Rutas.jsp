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
            Ruta ruta = RutaControllers.BusquedaRuta(id);

            ArrayList<Parada> paraderos = RutaControllers.BusquedaParadasDeRutaEspecifica(id); //Paradas asignadas.
            ArrayList<Parada> paraderos_todos = RutaControllers.listTodasParadas(); // Todos los paraderos.

            String lunes_viernes_inicio = "";
            String lunes_viernes_final = "";
            String sabado_inicio = "";
            String sabado_final = "";
            String domingo_festivo_inicio = "";
            String domingo_festivo_final = "";

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
        %>

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
                <h1 style="margin-top: 4%; margin-bottom: 3%"> <strong> Editar Ruta </strong> </h1>
            </div>
            <div class="container">
                <form action="SRModificar" method="post"> <!--Inicia el formulario-->
                    <div style="display: none"><input type="text" value="<%=id%>" name="id_ruta"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-5" >
                                <div class="row">
                                    <div class="form-group" style="width: 100%">
                                        <label><strong>Nombre</strong></label>
                                        <input type="text" class="form-control" value="<%=ruta.getNombre_Ruta()%>" name="nombre_ruta" required>
                                    </div>    
                                </div>    
                                <div class="row">
                                    <div class="form-group" style="width: 100%">
                                        <label><strong>Tipo</strong></label>
                                        <input type="text" class="form-control" value="<%=ruta.getTipo_Ruta()%>" name="tipo_ruta" required>
                                    </div>  
                                </div>    
                            </div>
                            <div class="col-md-1">
                                <br>
                            </div>
                            <div class="col-md-5">
                                <table class="table table-bordered" style="text-align: center; width: 190%">
                                    <tr>
                                        <td colspan="3"><strong>Horarios</strong></td>
                                    </tr>
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
                        </div>
                    </div>
                    <div>
                        <br>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5" ><!--Tabla Paraderos que tiene una ruta-->
                                <table class="table table-bordered" style="text-align: center; width: 140%">
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

                            </div><!--Tabla Paraderos que tiene una ruta-->
                            <div class="col-md-2"><br></div>
                            <div class="col-md-5"><!--Tabla Paraderos que no tiene una ruta-->
                                <div>
                                    <table class="table table-bordered" style="text-align: center; width: 190%">
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
                            </div><!--Tabla Paraderos que no tiene una ruta-->
                            <div class="row" style="margin-top: 3%; margin-left: 1%"> <!--Enviar y Cancelar-->
                                <div class="col-md-5">
                                    <input type="submit" value="Guardar" class="form-control btn btn-primary formulario" style="width: 150%; margin-right: 3%">
                                </div>
                                <div class="col-md-2">

                                </div>
                                <div class="col-md-5">
                                    <a href="Administrar_Rutas.jsp"><button type="button" class="form-control btn btn-primary formulario" style="width: 150%; margin-left: 3%; border-color: black;">Cancelar</button></a>
                                </div>    
                            </div>
                        </div>
                    </div>
                </form> <!--Finaliza el formulario-->
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
