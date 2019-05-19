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
            ArrayList<Ruta> listado = sitmapp.controllers.ruta.RutaControllers.list();
            Ruta ruta = new Ruta();
            for (Ruta r : listado) {
                if (r.getId_ruta() == id) {
                    ruta = r;
                }
            }

            boolean lunes_viernes_no_opera = false;
            boolean sabado_no_opera = false;
            boolean domingo_festivo_no_opera = false;

            if (!ruta.getLunes_viernes().equalsIgnoreCase("No Opera")) {
                String lunes_viernes[] = ruta.getLunes_viernes().split("-");
            }

            if (!ruta.getSabado().equalsIgnoreCase("No Opera")) {
               String sabado[] = ruta.getSabado().split("-");
            }

            if (!ruta.getDomingo_festivo().equalsIgnoreCase("No Opera")) {
                 String domingo_festivo[] = ruta.getDomingo_festivo().split("-");
            }
            
            
            
            if (ruta.getLunes_viernes().equalsIgnoreCase("No Opera")) {
                
            }

            if (ruta.getSabado().equalsIgnoreCase("No Opera")) {
               
            }

            if (ruta.getDomingo_festivo().equalsIgnoreCase("No Opera")) {
                
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
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-8">
                        <form action="#" method="post">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label><strong>Nombre</strong></label>
                                    <input type="text" class="form-control" value="<%=ruta.getNombre_Ruta()%>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label><strong>Tipo</strong></label>
                                    <input type="text" class="form-control" value="<%=ruta.getTipo_Ruta()%>">
                                </div>    
                            </div>
                            <div class="row">
                            </div>
                        </form>
                    </div>
                    <div class="col-md-3">

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
