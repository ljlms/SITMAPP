<%-- 
    Document   : Administrar_Usuarios
    Created on : 17/04/2019, 09:51:45 AM
    Author     : Jhon Baron
--%>
<%@page import="Usuario.fun.Usuario_Metodos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrar Usuarios</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'> <!-- Icons Link -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
            ArrayList<Usuario> usuario = Usuario_Metodos.list();
        %>
        <!-- Java Space -->  

        <nav class="navbar navbar-inverse"> <!--  Nav Bar Menu -->
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">SITMAPP</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="Home.jsp">Menu Principal</a></li><!--class="active"--> <!-- en un li -->
                    <li><a href="#">Sección de Noticias</a></li>
                    <li><a href="#">Chat</a></li>
                    <li><a href="Main_rutas.jsp">Rutas</a></li>
                    <li id="li_registrar-rutas"><a href="Administrar_Rutas.jsp">Admin. Rutas</a></li> <!-- Para miembros Staff -->
                    <li id="registrar-empresa"> <a href="Administrar_Empresa.jsp">Admin. Empresa </a> </li>
                    <li id="registrar-articulado"> <a href="Administrar_Articulados.jsp">Admin. Articulados </a> </li>
                    <li id="administrar-usuarios" class="active"> <a href="Administrar_Usuarios.jsp">Admin. Usuarios </a> </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%= u.getNombreUsuario()%> </a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Config</a></li>
                    <li><a href="./USCerrarSesion?var=off"> Cerrar Sesión</a></li>
                </ul>
            </div>
        </nav>
        <br>
        <div class="container">
            <div class="container">
                <h3> <label> Usuarios Registrados </label> </h3>
            </div>
            <section class="main row">
                <article class="col-md-10">
                    <!--
                     <div class="form-group col-md-8">
                         <label for="nom-ruta"> Ingrese nombre empresa: </label>
                         <input type="text" id="nom-ruta" class="form-control" name="id-empresa">
                     </div>
                    <div class="form-group col-md-4">
                        <label for="enviar-nombre-ruta"> <br></label>
                        <label for="enviar-nombre-ruta"></label>
                        <input type="submit" name="enviar" id="enviar-nombre-ruta" class="form-control btn btn-primary" value="Consultar Articulado">
                    </div>
                    --> 
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
                                <td><a style='font-size:24px' class='fas' href="./Editar_Usuarios.jsp?id_usuario=<%=e.getId_usuario()%>&nombre=<%=e.getNombre()%>&apellidos=<%=e.getApellidos()%>&usuario=<%=e.getNombreUsuario()%>&correo=<%=e.getEmail()%>&telefono=<%=e.getNumero_telefono()%>&tipo=<%=e.getTipo_usuario()%>&contraseña=<%=e.getContraseña()%>">&#xf044;</a></td>
                                <td><a style='font-size:24px' class='fas' href="./USEliminar?id_usuario=<%=e.getId_usuario()%>">&#xf2ed;</a> </td>
                            </tr>

                            <%}%>
                        </table>
                    </div>
                    <% } else {%>
                    <div style="text-align: center">
                        <h2>Debe registrar un usuario</h2>
                        <a href="Registrar_Usuario.jsp">Registrar Usuario</a>
                    </div>
                    <% }%>


                    <!--<div class="form-group col-md-8"></div>
                    <div class="form-group col-md-4"> <a href="#"> <button type="button" class="btn btn-primary btn-block"> Editar Empresa </button> </a> </div>-->
                </article>
                <aside class="col-md-2">
                    <%if (usuario.size() > 0) {%>
                    <div style="text-align: center;">
                        <button class="btn form-control" >
                            <a href="Registrar_Usuario.jsp">Registrar Usuario</a>
                        </button>
                    </div>   
                    <div style="text-align: center;">
                        <!--
                        <form class="form" action="USConsultar" method="post"> 
                            <div form-row> 
                                <div>
                                    <div style="text-align: center; margin: 5%;" class="container-fluid">
                                        <label> <h5>Consultar Articulado</h5> </label>
                                        <input type="text" placeholder="Nombre empresa" class="form-control" name="empresa_consultar" id="emp-con">
                                        <input type="submit" class="form-control btn btn-primary" id="enviar" name="enviar-datos" value="Consultar" style="margin: 2%">
                                    </div>

                                </div>
                            </div>
                        </form>
                        -->
                    </div>
                    <%}%>
                </aside>
            </section>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    </body>
</html>
