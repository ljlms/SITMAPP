<%@page import="sitmapp.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Articulado</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="css/principalStyle.css" rel="stylesheet" type="text/css"/>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGQUFgalVpzmjnc3sWaRg7cJZDaFXqZq8"></script>
    </head>
    <body>
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            Integer id_articulado = new Integer(request.getParameter("id"));
            String placa = request.getParameter("Placa");
            String CodArticulado = request.getParameter("CodigoArticulado");
            String nom_empresa = request.getParameter("NomEmpresa");

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
            <div class="container"> <header> <h1> <label style="margin: 5%"><strong>Editar Articulado</strong></label> </h1> </header> </div>
            <div class="container" style="font-size: 20px;">
                <section class="main row">
                    <div class="col-md-12">
                        <form  method="post" action="ARTModificar" class="form">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label> Id Articulado </label>
                                    <input value="<%=id_articulado%>" class="form-control" name="id_articulado_edit" readonly type="number"> 
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="">Codigo Articulado </label>
                                    <input type="number" name="codigo_articulado_edit" class="form-control" value="<%= CodArticulado%>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="">Nombre Empresa</label>
                                    <input type="text" class="form-control" name="nombre_empresa_edit" value="<%= nom_empresa%>">
                                </div>
                                <div class="col-md-6"> 
                                    <label for="">Placa </label>
                                    <input type="text" name="placa_edit" class="form-control" value="<%= placa%>" maxlength="6" minlength="6">
                                </div>
                            </div>
                            <div class="col-md-12"><br></div>
                            <div class="form-row">
                                <div class="col-md-4">
                                    <input type="submit" class="form-control btn btn-primary" value="Editar Articulado">
                                </div>
                                <div class="col-md-4" style="margin: -1%">
                                    <a href="Administrar_Articulados.jsp"> <button style="border-color: black;" class="form-control btn btn-light" type="button"> Cancelar </button> </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
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

