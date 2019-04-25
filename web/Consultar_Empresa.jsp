<%-- 
    Document   : Consultar_Empresa
    Created on : 17/04/2019, 09:51:45 AM
    Author     : Jhon Baron
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Empresa.Empresa"%>
<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Consultar Empresa</title>
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
            ArrayList<Empresa> emp = Empresa.list();
            boolean busqueda = false;
            String consulta = request.getAttribute("con").toString();
            int contador = 0;

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
        <br>
        <div class="container">
            <section class="main row">
                <br>
                <article class="col-md-10">
                    <!--
                     <div class="form-group col-md-8">
                         <label for="nom-ruta"> Ingrese nombre empresa: </label>
                         <input type="text" id="nom-ruta" class="form-control" name="id-empresa">
                     </div>
                    <div class="form-group col-md-4">
                        <label for="enviar-nombre-ruta"> <br></label>
                        <label for="enviar-nombre-ruta"></label>
                        <input type="submit" name="enviar" id="enviar-nombre-ruta" class="form-control btn btn-primary" value="Consultar Empresa">
                    </div>
                    -->

                    <%
                        for (Empresa a : emp) {
                            if (a.getNombre().equalsIgnoreCase(consulta)) {
                                contador++;
                            }
                        }
                        if (contador > 0) { %>
                    <div class="form-group col-md-12" id="tabla-completa">
                        <br>
                        <table class="table table-light table-striped" style="text-align: center;">
                            <tr>
                                <td> <label> NIT </label> </td>
                                <td><label for=""> Nombre </label>
                                </td>
                                <td><label for=""> Descripcion </label>
                                </td>
                                <td><label for=""> Editar </label></td>
                                <td><label for=""> Eliminar </label></td>
                            </tr>

                            <% for (Empresa e : emp) {
                                    if (e.getNombre().equalsIgnoreCase(consulta)) {
                            %>
                            <tr>
                                <td> <%= e.getIdEmpresa()%> </td>
                                <td> <%= e.getNombre()%> </td>
                                <td> <%=  e.getDescripcion()%></td>
                                <td><a style='font-size:24px' class='fas' href="./Editar_Empresa.jsp?Nit=<%=e.getIdEmpresa()%>&Nombre=<%=e.getNombre()%>&Descripcion=<%=e.getDescripcion()%>">&#xf044;</a></td>
                                <td><a style='font-size:24px' class='fas' href="./EEliminar?Nit=<%=e.getIdEmpresa()%>&Nombre=<%=e.getNombre()%>&Descripcion=<%=e.getDescripcion()%>">&#xf2ed;</a> </td>
                            </tr>
                            <%}
                                }%>
                        </table>
                    </div>
                    <% } else {%>
                    <div style="text-align: center">

                        <h2>No se han encontrado resultados en la busqueda de la empresa<strong> <i><%=consulta%></i></strong></h2>
                        <a href="Administrar_Empresa.jsp">Regresar</a>
                    </div>
                    <% }%>

                    <!--<div class="form-group col-md-8"></div>
                    <div class="form-group col-md-4"> <a href="#"> <button type="button" class="btn btn-primary btn-block"> Editar Empresa </button> </a> </div>-->
                </article>
                <aside class="col-md-2">
                    <div class="">
                        <button class="btn form-control" >
                            <a href="Añadir_Empresa.jsp">Registrar Empresa</a>
                        </button>
                    </div>   
                    <div class="">

                    </div>
                    <br>
                    <div style="text-align: center;s">
                        <form class="form" action="EConsultar" method="post"><!-- Consultar una empresa -->
                            <div style="text-align: center; margin: 5%;">
                                <label> <h5>Consultar empresa</h5> </label>
                                <input type="text" name="buscar-empresa" id="emp-busc" class="form-control" placeholder="Ingrese nombre...">
                                <input type="submit" class="form-control btn btn-primary" id="enviar" name="enviar-datos" value="Consultar..." style="margin: 5%">
                            </div>

                        </form>
                    </div>
                </aside>

            </section>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    </body>
</html>
