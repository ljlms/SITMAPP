<%-- 
    Document   : Home
    Created on : 5/04/2019, 04:51:30 PM
    Author     : Jhon Baron
--%>

<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vista Principal</title>
        <meta charset="utf-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="visualizar_ruta.js"> // Script externo
        </script>

        <!--        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <link rel="stylesheet" href="tasties.css" type="text/css">
                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
                <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">-->

        <!--<script type="text/javascript" src="staff-visibility.js"></script>// Script externo-->
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
                    <li class="active"><a href="Home.jsp">Menu Principal</a></li><!--class="active"--> <!-- en un li -->
                    <li><a href="#">Sección de Noticias</a></li>
                    <li><a href="#">Chat</a></li>
                    <li><a href="Main_rutas.jsp">Rutas</a></li>
                    <li id="li_registrar-rutas"><a href="Administrar_Rutas.jsp">Admin. Rutas</a></li> <!-- Para miembros Staff -->
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
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=  u.getNombreUsuario()%> </a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Config</a></li>
                    <li><a href="./USCerrarSesion?var=off"> Cerrar Sesión</a></li>
                </ul>
            </div>
        </nav><!--  Nav Bar Menu -->
        <div class="container">
            <div class="row">

                <div class="col-md-8"> <!-- Map -->
                    <div class="text-center">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/GoogleMaps_logo.svg/245px-GoogleMaps_logo.svg.png" class="img-fluid" alt="Responsive image">
                    </div>
                </div>
                <div>
                    <br>
                </div>	
                <div class="col-md-4"><!-- Seleccionar -->
                    <table class="table" style="text-align: center; border: 1px solid black">
                        <th style="text-align: center; border: 1px solid black">
                            <label for=""><h3>Visualizar Articulados</h3></label>
                        </th>
                        <tr> <!-- Selecionar el tipo de ruta -->
                            <td>
                                <div>
                                    <h4>Tipo Ruta</h4>
                                    <select id="tipo_ruta" onchange="tipo_ruta()">
                                        <option value="nada"></option>                        
                                        <option value="t_troncal">Troncales</option>
                                        <option value="t_pre">Pre-Troncales</option>
                                        <option value="t_alimentadoras">Alimentadoras</option>
                                        <option value="t_circulares">Circulares</option>
                                    </select>
                                    <div style="margin: 5px;">

                                    </div>
                                </div>
                            </td>
                        </tr>
                        <!--******************************************************************************************************************-->
                        <tr>
                            <td>
                                <div>
                                    <h4>Seleccione Articulado</h4>
                                </div>
                                <div id="div_troncales" style="display: none;"> <!-- Troncales -->
                                    <select id="" >
                                        <option value="">T100E</option>
                                        <option value="">T101</option>
                                        <option value="">T102</option>
                                        <option value="">T103</option>
                                    </select>
                                </div>

                                <div style="margin: 10px;">
                                </div>

                                <div id="div_pre-troncales" style="display: none;"> <!-- Pre-Troncales -->
                                    <select id="">
                                        <option value="">X101</option>
                                        <option value="">X102</option>
                                        <option value="">X103</option>
                                        <option value="">X104</option>
                                        <option value="">X105</option>
                                        <option value="">X106</option>
                                    </select>
                                </div>

                                <div style="margin: 10px;">
                                </div>

                                <div id="div_alimentadoras" style="display: none;"> <!-- Alimentadoras -->
                                    <select id="">
                                        <option value="">A102</option>
                                        <option value="">A103</option>
                                        <option value="">A104</option>
                                        <option value="">A105</option>
                                        <option value="">A107</option>
                                        <option value="">A108</option>
                                        <option value="">A109</option>
                                        <option value="">A111</option>
                                        <option value="">A114</option>
                                        <option value="">A117</option>
                                    </select>
                                </div>

                                <div style="margin: 10px;">
                                </div>

                                <div id="div_circulares" style="display: none;"> <!-- Circulares -->
                                    <select id="">
                                        <option value="">C015</option>
                                        <option value="">Ruta Circular RC</option>
                                    </select>
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