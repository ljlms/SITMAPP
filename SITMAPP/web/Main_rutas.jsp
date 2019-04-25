<%-- 
    Document   : Main_rutas
    Created on : 5/04/2019, 05:01:57 PM
    Author     : Jhon Baron
--%>

<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Información Rutas</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <script type="text/javascript" src="ver_horarios.js"> // Script externo
        </script>

    </head>
    <body> 
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
        %>
        <nav class="navbar navbar-inverse"> <!--  Nav Bar Menu -->
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">SITMAPP</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="Home.jsp">Menu Principal</a></li><!--class="active"--> <!-- en un li -->
                    <li><a href="#">Sección de Noticias</a></li>
                    <li><a href="#">Chat</a></li>
                    <li class="active"><a href="Main_rutas.jsp">Rutas</a></li>
                    <li id="li_registrar-rutas" ><a href="Administrar_Rutas.jsp">Admin. Rutas</a></li> <!-- Para miembros Staff -->
                    <li id="registrar-empresa"> <a href="Administrar_Empresa.jsp">Admin. Empresa </a> </li>
                    <li id="registrar-articulado"> <a href="Administrar_Articulados.jsp">Admin. Articulados </a> </li>
                    <li id="administrar-usuarios"> <a href="Administrar_Usuarios.jsp">Admin. Usuarios </a> </li>
                </ul>
                <!--JavaScript Space-->
                <script>
                    var tipo = '<%=valor%>';
                    if (tipo == 'usuario') {
                        $('#li_registrar-rutas').hide();
                        $('#registrar-empresa').hide();
                        $('#registrar-articulado').hide();
                        $('#administrar-usuarios').hide();
                        console.log('esconde');
                    } else {
                        $('#li_registrar-rutas').show();
                        $('#registrar-empresa').show();
                        $('#registrar-articulado').show();
                        $('#administrar-usuarios').show();
                        console.log('muestra');
                    }
                </script>
                <!--JavaScript Space-->
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=u.getNombreUsuario()%> </a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Config</a></li>
                    <li><a href="./USCerrarSesion?var=off"> Cerrar Sesión</a></li>
                </ul>
            </div>
        </nav><!--  Nav Bar Menu -->
        <div class="container">
            <div class="row">

                <div class="col-md-8" >   <!-- Imagenes Horarios -->
                    <div class="text-center">
                        <div id="blank_space">
                        </div>

                        <table style="text-align: center; border: 1px solid black;">
                            <tr>
                                <td>

                                    <label for="horarios"> <h1> <strong> Horarios </strong> </h1> </label>
                                    <div id="horarios">
                                        <label for="tipo_lunes-viernes">Lunes - Viernes</label>
                                        <label for="tipo_lunes-viernes">Lunes - Viernes</label>
                                        <div style="margin: 5px;"></div>
                                        <label id="tipo_lunes-viernes"> 5:30 am - 9:00 pm    </label>
                                        <div style="margin: 5px;"></div>
                                        <label for="tipo_sabado">Sabado</label>
                                        <div style="margin: 5px;"></div>
                                        <label id="tipo_sabado"> 5:30 am - 9:00 pm</label>
                                        <div style="margin: 5px;"></div>
                                        <label for="tipo_domingo-festivo">Domingo/Festivo</label>
                                        <div style="margin: 5px;"></div>
                                        <label id="tipo_domingo-festivo"> 7:00 am - 8:00 pm </label>
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
                <div>
                    <br>
                </div>	
                <div class="col-md-4" style="position: fixed; right: 0;"><!-- Seleccionar -->
                    <table class="table" style="text-align: center; border: 1px solid black">
                        <th style="text-align: center; border: 1px solid black">
                            <label for=""><h3>Mostrar Información </h3></label>
                        </th>
                        <tr> <!-- Selecionar el tipo de ruta -->
                            <td>
                                <div>
                                    <h4>Tipo Ruta</h4>
                                    <select id="tipo_ruta" onchange="ver_horarios()">
                                        <option value="nada">  </option>
                                        <option value= "t_alimentadoras"> Alimentadoras </option>
                                        <option value="t_troncales"> Troncales </option>}
                                        <option value="t_pre-troncales"> Pre-Troncales </option>}
                                        <option value="t_circulares"> Circulares </option>}
                                    </select>
                                </div>
                                </div>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    </body>
</html>