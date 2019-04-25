<%-- 
    Document   : Editar_Articulado
    Created on : 20/04/2019, 12:58:26 PM
    Author     : Jhon Baron
--%>

<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Articulado</title>
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

            Integer id_articulado = new Integer(request.getParameter("id"));

            String placa = request.getParameter("Placa");
            String CodArticulado = request.getParameter("CodigoArticulado");
            String nom_empresa = request.getParameter("NomEmpresa");

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
                    <li id="li_registrar-rutas" ><a href="Administrar_Rutas.jsp">Administrar Rutas</a></li> <!-- Para miembros Staff -->
                    <li id="registrar-empresa" class="active"> <a href="Administrar_Articulado.jsp"> Administrar Articulado </a></li> <!-- Para miembros Staff -->
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%= u.getNombreUsuario()%> </a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Config</a></li>
                    <li><a href="./USCerrarSesion?var=off"> Cerrar Sesión</a></li>
                </ul>
            </div>
        </nav>
        <br>
        <div class="container"> <header> <h3> Editar Articulado </h3> </header> </div>
        <div class="container">
            <section class="main row">
                <br>
                <article class="col-md-10">
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
                            <div class="col-md-3">
                                <a href="Administrar_Articulados.jsp"> <button class="form-control btn btn-primary" type="button"> Cancelar </button> </a>
                            </div>
                            <div class="col-md-5"><label> </label></div>
                        </div>

                    </form>
                </article>
                <aside class="col-md-2">
<!--                    <div class="">
                        <button class="btn form-control" >
                            <a href="Añadir_Articulado.jsp">Registrar Articulado</a>
                        </button>
                    </div>   
                    <div class="">
                        <button class="btn  form-control active" >
                            <a href="Consultar_Articulado.jsp">Consultar Articulado</a>
                        </button>
                    </div>-->
                </aside>

            </section>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    </body>
</html>

