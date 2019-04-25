<%-- 
    Document   : Consultar_Rutas
    Created on : 9/04/2019, 01:56:39 PM
    Author     : Jhon Baron
--%>

<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Consultar Ruta</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
                    <li id="li_registrar-rutas" class="active"><a href="Administrar_Rutas.jsp">Admin. Rutas</a></li> <!-- Para miembros Staff -->
                    <li id="registrar-empresa"> <a href="Administrar_Empresa.jsp">Admin. Empresa </a> </li>
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
                    <form class="form" action="" method="">
                        <div class="form-group col-md-8">
                            <label for="nom-ruta"> Ingrese ID Ruta: </label>
                            <input type="text" id="nom-ruta" class="form-control" name="nombre-ruta_consultar">
                        </div>

                        <div class="form-group col-md-4">
                            <label for="enviar-nombre-ruta"> <br></label>
                            <label for="enviar-nombre-ruta"></label>
                            <input type="submit" name="enviar" id="enviar-nombre-ruta" class="form-control btn btn-primary" value="Consultar Ruta">
                        </div>
                        <div class="form-group col-md-12">
                            <table class="table table-light table-striped" style="text-align: center;">
                                <tr>
                                    <td><label for=""> Nombre </label>
                                    </td>
                                    <td><label for=""> Tipo Ruta </label>
                                    </td>

                                    <td><label> Paraderos </label></td>
                                    <td><label> Horario </label></td>
                                </tr>
                                <tr>
                                    <td> T100E Portal - Centro</td>
                                    <td> Troncales </td>

                                    <td> 
                                        <div>
                                            La Bodeguita	
                                        </div> 
                                        <div>
                                            Centro 	
                                        </div>
                                        <div>
                                            Maria Auxiliadora 	
                                        </div>
                                        <div>
                                            Cuatro Vientos 	
                                        </div>
                                        <div>
                                            La Castellana 	
                                        </div>
                                        <div>
                                            Madre Bernarda 	
                                        </div>
                                        <div>
                                            Portal 	
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <label for="h_100e_lunes-viernes"><i>Lunes - Viernes</i></label>
                                            <p id="h_100E_lunes-viernes">6:00 am - 8:00 pm</p>
                                        </div>
                                        <div>
                                            <label for="h_100E_sabado"><i>Sabado</i></label>
                                            <p id="h_100E_sabado">6:00 am - 10:00 am </p>
                                        </div>
                                        <div>
                                            <label for="h_100E_Domingo-Festivo"><i>Domingo - Festivos</i></label>
                                            <p id="h_100E_Domingo-Festivo"> No Opera </p>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td> T101 Portal - Centro</td>
                                    <td> Troncales </td>

                                    <td> 
                                        <div>
                                            La Bodeguita	
                                        </div> 
                                        <div>
                                            Centro 	
                                        </div>
                                        <div>
                                            Chambacu	
                                        </div>
                                        <div>
                                            La Popa 	
                                        </div>
                                        <div>
                                            Bazurto 	
                                        </div>
                                        <div>
                                            El Prado 	
                                        </div>
                                        <div>
                                            España 	
                                        </div>
                                        <div>
                                            Cuatro Vientos
                                        </div>
                                        <div>
                                            Los Ejecutivos
                                        </div>
                                        <div>
                                            La Castellana
                                        </div>
                                        <div>
                                            Madre Bernarda 
                                        </div>
                                        <div>
                                            Portal
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <label for="h_1001_lunes-viernes"><i>Lunes - Viernes</i></label>
                                            <p id="h_100E_lunes-viernes">5:30 am - 11:00 pm</p>
                                        </div>
                                        <div>
                                            <label for="h_1001_sabado"> <i>Sabado</i> </label>
                                            <p id="h_100E_sabado">5:30 am - 9:00 am </p>
                                        </div>
                                        <div>
                                            <label for="h_1001_Domingo-Festivo"><i>Domingo - Festivos</i></label>
                                            <p id="h_100E_Domingo-Festivo"> 7:00 am - 8:00 pm </p>
                                        </div>
                                    </td>
                                </tr>

                            </table>
                        </div>
                    </form>
                </article>
                <aside class="col-md-2">
                    <div class="">
                        <button class="btn form-control" >
                            <a href="Añadir_Rutas.jsp">Registrar Ruta</a>
                        </button>
                    </div>   
                    <div class="">
                        <button class="btn  form-control" >
                            <a href="Editar_Rutas.jsp">Editar Ruta</a>
                        </button>
                    </div>
                    <div class="">
                        <button class="btn  form-control active" >
                            <a href="Consultar_Rutas.jsp">Consultar Ruta</a>
                        </button>
                    </div>

                    <div class="">
                        <button class="btn  form-control" >
                            <a href="Eliminar_Rutas.jsp">Eliminar Ruta</a>
                        </button>
                    </div>
                </aside>

            </section>
        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    </body>
</html>
