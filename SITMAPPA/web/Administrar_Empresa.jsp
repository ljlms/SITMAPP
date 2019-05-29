<%@page import="sitmapp.controllers.empresa.EmpresaController"%>
<%@page import="sitmapp.models.Empresa"%>
<%@page import="java.util.ArrayList"%>
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
        <link href="css/mapa.css" rel="stylesheet" type="text/css"/>
    </head>
    <body> 
        <!-- Java Space -->  
        <%
            ArrayList<Empresa> emp = null;
            String valor = "";
            try {
                Usuario u = (Usuario) session.getAttribute("usuario");
                valor = u.getTipo_usuario();
                if (!valor.equalsIgnoreCase("administrador")) {
                    response.sendRedirect("Home.jsp");
                }
                emp = EmpresaController.list();
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
                <h1 style="margin: 2%"> <strong> Administrar Empresa </strong> </h1>
            </div>
            <div class="container">
                <br>
                <div class="row">
                    <div class="col-md-8"> 
                        <%if (emp.size() > 0) {%>
                        <table class="table table-striped" style="text-align: center;">
                            <tr>
                                <td><strong>Id Empresa</strong></td> 
                                <td><strong>Nombre</strong></td> 
                                <td><strong>Tipo</strong></td> 
                                <td><strong>Editar</strong></td>
                                <td><strong>Eliminar</strong></td>
                            </tr>                       
                            <% for (Empresa e : emp) {%>
                                <tr>
                                    <td> <%= e.getIdEmpresa()%> </td>
                                    <td> <%= e.getNombre()%> </td>
                                    <td> <%=  e.getDescripcion()%></td>
                                    <td><a style='font-size:24px' class='fas' href="./Editar_Empresa.jsp?Nit=<%=e.getIdEmpresa()%>&Nombre=<%=e.getNombre()%>&Descripcion=<%=e.getDescripcion()%>"><img src="templates/icons8-edit.svg" class="icono_edit" width="30" height="30"></a></td>
                                    <td><a style='font-size:24px' class='fas' href="./EEliminar?Nit=<%=e.getIdEmpresa()%>&Nombre=<%=e.getNombre()%>&Descripcion=<%=e.getDescripcion()%>"><img src="templates/icons8-remove.svg" class="icono_edit" width="30" height="30"></a> </td>
                                </tr>

                                <%}%>
                        </table>
                        <%} else {%>
                        <div class="alert alert-danger" role="alert">
                            <h3><strong>No hay empresas registradas</strong></h3>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                     
                        </div>
                        <%}%>
                    </div>
                    <div>
                        <br>
                    </div>	
                    <div class="col-md-3">
                        <div >
                            <button class="btn form-control btn-light" style="width: 200px;margin-left: 5%;font-size: 120%">
                                <a href="Añadir_Empresa.jsp">Registrar Empresa</a>
                            </button>
                        </div>
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
