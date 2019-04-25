<%-- 
    Document   : Añadir_Empresa
    Created on : 15/04/2019, 03:55:42 PM
    Author     : Jhon Baron
--%>

<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Añadir Empresa</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
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
                    <li id="registrar-empresa" class="active"> <a href="Administrar_Empresa.jsp">Admin. Empresa </a> </li>
                    <li id="registrar-articulado"> <a href="Administrar_Articulados.jsp">Admin. Articulados </a> </li>
                    <li id="administrar-usuarios"> <a href="Administrar_Usuarios.jsp">Admin. Usuarios </a> </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%= u.getNombreUsuario()%> </a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Config</a></li>
                    <li><a href="./USCerrarSesion?var=off"> Cerrar Sesión</a></li>
                </ul>
            </div>
        </nav>
        <div class="container"> <h2> <label>Registrar Empresa</label> </h2> </div>
        <br>
        <div class="container">
            <div class="row"> <!-- Primera Fila Troncales - Pretroncales -->
                <div class="col-md-10">
                    <form action="ERegistrar" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="nic">NIC</label>
                                <input type="number" class="form-control" name="nic_empresa" id="nic" placeholder="Ingrese NIC..." required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="nombre">Nombre:</label>
                                <input type="text" class="form-control" name="nombre_empresa" id="nombre" placeholder="Ingrese nombre..." required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label> Descripción: </label>
                                <textarea name="descripcion_empresa" class="form-control" rows="6" placeholder="Ingrese descripcion de la empresa..." required></textarea>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4"> 
                                <input type="submit" class="form-control btn btn-primary" value="Registrar Empresa">
                            </div>
                            <div class="col-md-4">
                                <a href="Administrar_Empresa.jsp"> <button type="button" class="form-control btn btn-primary"> Cancelar </button> </a>
                            </div>
                        </div>


                    </form>
                </div>
                <aside class="col-md-2">
                    <!-- Empty Space -->
                </aside>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    </body>
</html>

