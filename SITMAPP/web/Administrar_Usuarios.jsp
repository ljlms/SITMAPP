<%@page import="sitmapp.controllers.usuario.UsuarioController"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrar Usuarios</title>
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
            String valor = u.getTipo_usuario();
            ArrayList<Usuario> usuario = UsuarioController.list();
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
                <div class="container">
                    <h1 style="margin: 5%"> <label><strong> Usuarios Registrados </strong></label> </h1>
                </div>
                <section class="main row">
                    <article class="col-md-10">
                        <% if (usuario.size() > 0) { %>
                        <div class="form-group col-md-12" id="tabla-completa">
                            <br>
                            <table class="table table-light table-striped" style="text-align: center;">
                                <tr>
                                    <td> <label for=""> ID </label>  </td>
                                    <td> <label for=""> Nombre </label> </td>
                                    <td><label for=""> Apellidos </label>
                                    </td>
                                    <td><label for=""> Nombre de Usuario </label>
                                    <td> <label for=""> Contraseña </label> </td>
                                    <td><label for=""> Correo </label>
                                    </td>
                                    <td><label for=""> Telefono </label></td>
                                    <td><label for=""> Tipo de Usuario </label></td>
                                    <td> <label for=""> Editar </label> </td>
                                    <td> <label for=""> Eliminar </label> </td>
                                </tr>

                                <% for (Usuario e : usuario) {%>
                                <tr>
                                    <td><%= e.getId_usuario()%>  </td>
                                    <td> <%= e.getNombre()%> </td>
                                    <td> <%= e.getApellidos()%> </td>
                                    <td> <%=  e.getNombreUsuario()%></td>
                                    <td> <%= e.getContraseña()%> </td>
                                    <td> <%=  e.getEmail()%></td>
                                    <td><%= e.getNumero_telefono()%></td>
                                    <td><%= e.getTipo_usuario()%></td>
                                    <td><a style='font-size:24px' class='fas' href="./Editar_Usuarios.jsp?id_usuario=<%=e.getId_usuario()%>&nombre=<%=e.getNombre()%>&apellidos=<%=e.getApellidos()%>&usuario=<%=e.getNombreUsuario()%>&correo=<%=e.getEmail()%>&telefono=<%=e.getNumero_telefono()%>&tipo=<%=e.getTipo_usuario()%>&contraseña=<%=e.getContraseña()%>"><img src="templates/icons8-edit.svg" class="icono_edit" width="30" height="30"></a></td>
                                    <td><a style='font-size:24px' class='fas' href="./USEliminar?id_usuario=<%=e.getId_usuario()%>"><img src="templates/icons8-remove.svg" class="icono_edit" width="30" height="30"></a> </td>
                                </tr>

                                <%}%>
                            </table>
                        </div>
                        <% } else {%>
                        <div style="text-align: center">
                            <h2>Debe registrar un usuario</h2>
                            <a href="Registrar_Usuario.jsp" style="font-size: 120%">Registrar Usuario</a>
                        </div>
                        <% }%>
                    </article>
                    <aside class="col-md-2">
                        <%if (usuario.size() > 0) {%>
                        <div style="text-align: center;">
                            <button class="btn form-control btn-light" >
                                <a href="Registrar_Usuario.jsp" style="font-size: 120%">Registrar Usuario</a>
                            </button>
                        </div>   
                        <div style="text-align: center;">
                        </div>
                        <%}%>
                    </aside>
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
