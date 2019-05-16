<%@page import="Empresa.Empresa"%>
<%@page import="sitmapp.controllers.empresa.EmpresaController"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrar Empresa</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="css/principalStyle.css" rel="stylesheet" type="text/css"/>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGQUFgalVpzmjnc3sWaRg7cJZDaFXqZq8"></script>
        <!--        <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
                <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>  Icons Link 
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        -->
    </head>
    <body>
        <!-- Java Space -->  
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            String valor = u.getTipo_usuario();
            //ArrayList<Empresa> emp = EmpresaController.list();
            ArrayList<Empresa> emp = sitmapp.controllers.empresa.EmpresaController.list();

        %>
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
                    <h1 style="margin: 5%"> <strong> Empresas registradas </strong> </h1>
                </div>
                <section class="main row">
                    <br>
                    <article class="col-md-10">
                        <% if (emp.size() > 0) { %>
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
                        </div>
                        <% } else {%>
                        <div style="text-align: center">

                            <h2>Debe registrar una Empresa previamente</h2>
                            <a href="Añadir_Empresa.jsp">Ir a registrar empresa</a>
                        </div>
                        <% }%>
                    </article>
                    <aside class="col-md-2">
                        <% if (emp.size() > 0) { %>
                        <div class="form-group">
                            <button class="btn btn-light form-control " >
                                <a href="Añadir_Empresa.jsp">Registrar Empresa</a>
                            </button>
                        </div>   
                        <br>
                        <div style="text-align: center" class="form form-group">
                            <form class="form" action="EConsultar" method="post"><!-- Consultar una empresa -->
                                <div style="margin: 5%;">
                                    <input type="text" name="buscar-empresa" id="emp-busc" class="form-control" placeholder="Consultar empresa...">
                                    <input type="submit" class="form-control btn btn-primary" id="enviar" name="enviar-datos" value="Consultar..." style="margin: 5%">
                                </div>
                            </form>
                        </div>
                        <% }%>
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
