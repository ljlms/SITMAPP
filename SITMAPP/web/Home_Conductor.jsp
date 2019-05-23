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
    </head>
    <body> 
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
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
                    <li id="li_Home-Administrador"> <a href="#">
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
                <h2><strong>Articulados - Rutas</strong></h2>
            </div>
            <div class="container">
                <form action="#" method="post">
                    <div class="row">
                        <div class="col-md-5">
                            <%if (articulado_list.size() > 0) {%>
                            <table class="table table-bordered" style="text-align: center">
                                <tr>
                                    <td><label><strong>Codigo</strong></label></td>
                                    <td><label><strong>Placa</strong></label></td>
                                    <td><label><strong>Empresa</strong></label></td>
                                    <td><label><strong>Asignar</strong></label></td>
                                </tr>
                                <%for (Articulado art : articulado_list) {%>
                                <%if(art.getEstado().equalsIgnoreCase("NO ASIGNADO")){%>
                                <tr>
                                    <td><%=art.getCodigo_Articulado()%></td>    
                                    <td><%=art.getPlaca()%></td>    
                                    <td><%=art.getNombre_Empresa()%></td>    
                                    <td><input type="radio" value="<%=art.getIdArticulado()%>" name="IdArticulado" required></td>    
                                </tr>
                                <%}%>
                                <%}%>
                            </table>
                            <%}%>
                        </div>
                        <div class="col-md-2"></div>

                        <div class="col-md-5">
                            <%if (ruta_list.size() > 0) {%>
                            <table style="text-align: center;" class="table table-bordered">
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