<%-- 
    Document   : Añadir_Rutas
    Created on : 8/04/2019, 11:41:05 AM
    Author     : Jhon Baron
--%>

<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Añadir Rutas</title>
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
            <div class="row"> <!-- Primera Fila Troncales - Pretroncales -->
                <div class="col-md-10">
                    <form action="" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="nombre">Nombre:</label>
                                <input type="text" class="form-control " name="nombre_ruta" id="nombre">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="tipo">Tipo Ruta</label>
                                <input type="text" class="form-control" id="tipo" name="tipo_ruta">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="nada">Paraderos</label>
                                <div id="nada"></div>
                                <label class="checkbox-inline" for="p_4v"><input type="checkbox" name="parad_4v" id="p_4v">4 vientos</label>
                                <label class="checkbox-inline" for="p_centro"><input type="checkbox" name="parad_centro" id="p_centro">Centro</label>
                                <label class="checkbox-inline" for="p_bod"><input type="checkbox" name="parad_bodeguita" id="p_bod">Bodeguita</label>
                            </div>
                            <div class="form-group col-md-6s">

                                <table>
                                    <thead><label>Tipo Horarios</label></thead>
                                    <tr>
                                        <td style="padding: 1%"> Lunes - Viernes </td>
                                        <td style="padding: 1%"> <input type="time" name="hora_inicio_lunes-vienres" id="lunes-viernes-inicio" min="05:00" max="11:00" step="600"> </td>
                                        <td style="padding: 1%"> <input type="time" name="hora_final_lunes-viernes" id="lunes-viernes-final" min="12:00"  step="600"></td>
                                    </tr>

                                    <tr>
                                        <td style="padding: 1%">Sabados: </td>
                                        <td style="padding: 1%"><input type="time" name="hora_inicio-sabados" id="sabado-inicio" min="05:00" max="11:00" step="600"></td>
                                        <td style="padding: 1%"><input type="time" name="hora_final-sabados" id="sabado-final" min="12:00"  step="600"></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 1%">Domingos/Festivos: </td>
                                        <td style="padding: 1%"><input type="time" name="hora_inicio-domingos-festivos" id="domingos-festivos-inicio" min="05:00" max="11:00" step="600"></td>
                                        <td style="padding: 1%"><input type="time" name="hora_final-domingos-festivos" id="domingos-festivos-final" min="12:00"  step="600"></td>
                                    </tr>
                                </table>

                            </div>
                            <div class="form-group col-md-12">
                                <input type="submit" name="enviar" id="enviar_input" class="form-control btn btn-primary" value="Añadir">
                            </div>
                        </div>
                    </form>
                </div>
                <aside class="col-md-2">
                    <div class="">
                        <button class="btn form-control active" >
                            <a href="Añadir_Rutas.jsp">Registrar Ruta</a>
                        </button>
                    </div>   
                    <div class="">
                        <button class="btn  form-control" >
                            <a href="Editar_Rutas.jsp">Editar Ruta</a>
                        </button>
                    </div>
                    <div class="">
                        <button class="btn  form-control" >
                            <a href="Consultar_Rutas.jsp">Consultar Ruta</a>
                        </button>
                    </div>
                    <div class="">
                        <button class="btn  form-control" >
                            <a href="Eliminar_Rutas.jsp">Eliminar Ruta</a>
                        </button>
                    </div>
                </aside>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    </body>
</html>
