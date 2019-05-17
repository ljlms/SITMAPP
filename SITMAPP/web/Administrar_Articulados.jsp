<%@page import="sitmapp.controllers.empresa.EmpresaController"%>
<%@page import="sitmapp.controllers.articulado.ArticuladoController"%>
<%@page import="sitmapp.models.Usuario"%>
<%@page import="sitmapp.models.Articulado"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sitmapp.models.Usuario"%>
<!DOCTYPE html>
<%
    Usuario u = (Usuario) session.getAttribute("usuario");
    String valor = u.getTipo_usuario();
    ArrayList<Articulado> art = ArticuladoController.list();
    //ArrayList<Empresa> emp = EmpresaController.list();
    //ArrayList<Empresa.Empresa> emp = sitmapp.controllers.empresa.EmpresaController.list();
    ArrayList<Empresa.Empresa> emp = sitmapp.controllers.empresa.EmpresaController.list();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrar Articulados</title>
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
                <div class="container" style="margin : 5%">
                    <h1> <label> <strong> Articulados registrados  </strong></label> </h1>
                </div>
                <section class="main row">
                    <%if (emp.size() > 0) {%>
                    <article class="col-md-9">
                        <% if (art.size() > 0) { %>
                        <div class="form-group col-md-12" id="tabla-completa">
                            <br>
                            <table class="table table-light table-striped" style="text-align: center;">
                                <tr>
                                    <td> <label> Id Articulado </label> </td>
                                    <td><label for=""> Placa </label>
                                    </td>
                                    <td><label for=""> Estado </label>
                                    <td><label for=""> Empresa </label>

                                    </td>
                                    <td><label for=""> Editar </label></td>
                                    <td><label for=""> Eliminar </label></td>
                                </tr>
                                <% for (Articulado e : art) {%>
                                <tr>
                                    <td> <%= e.getIdArticulado()%> </td>
                                    <td> <%= e.getPlaca()%> </td>
                                    <td> <%=  e.getEstado()%></td>
                                    <td> <%=  e.getNombre_Empresa()%></td>
                                    <td><a style='font-size:24px' class='fas' href="./Editar_Articulado.jsp?CodigoArticulado=<%=e.getCodigo_Articulado()%>&Placa=<%=e.getPlaca()%>&NomEmpresa=<%=e.getNombre_Empresa()%>&id=<%=e.getIdArticulado()%>&estado=<%=e.getEstado()%>"><img src="templates/icons8-edit.svg" class="icono_edit" width="30" height="30"></a></td>
                                    <td><a style='font-size:24px' class='fas' href="./ARTEliminar?CodigoArticulado=<%=e.getCodigo_Articulado()%>&Placa=<%=e.getPlaca()%>&NomEmpresa=<%=e.getNombre_Empresa()%>&id=<%=e.getIdArticulado()%>&estado=<%=e.getEstado()%>"><img src="templates/icons8-remove.svg" class="icono_edit" width="30" height="30"></a> </td>

                                </tr>
                                <%}%>
                            </table>
                        </div>
                        <% } else {%>
                        <div style="text-align: center">
                            <h2>Debe registrar un articulado</h2>
                            <a href="Añadir_Articulado.jsp"> Ir a Registrar Articulado </a>
                        </div>
                        <% }%>
                        <div class="form-group col-md-8"></div>
                    </article>
                    <aside class="col-md-3">
                        <%if (art.size() > 0) {%>
                        <div>
                            <!-- ****************** -->
                            <div style="text-align: center;">
                                <a href="Añadir_Articulado.jsp" style="font-size: 120%">  <button type="button" class="btn btn-light btn-block ">
                                        Registrar Articulado
                                    </button></a>
                                <br>
                            </div> 
                            <!-- ******************** -->
                            <form  action="ARTConsultar" method="post" class="formulario"> 
                                <!--se debe cambiar en la hoja de Estilo la etiqueta form (Crear)-->
                                <div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" >Consultar Empresa:</span>
                                        </div>
                                        <input type="text" placeholder="Nombre empresa" class="form-control" name="empresa_consultar" id="emp-con" size="30">
                                        <br>

                                    </div>
                                    <input type="submit" class="form-control btn btn-primary" id="enviar" name="enviar-datos" value="Consultar" style="margin: 2%">
                                </div>
                            </form>   
                        </div>
                        <%}%>
                    </aside>
                    <% } else {%>
                    <div style="text-align: center">
                        <h2>Debe registrar una Empresa previamente</h2>
                        <a href="Añadir_Empresa.jsp">Ir a registrar empresa</a>
                    </div>
                    <% }%>
                </section>
            </div>
        </section>
        <!-- lightModal -->
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