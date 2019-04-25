<%-- 
    Document   : Registrar_Usuario
    Created on : 5/04/2019, 04:55:29 PM
    Author     : Jhon Baron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Usuario</title>
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>
    <body>
        <div class="container">
            <header><h3><br><br></h3></header>
        </div>
        <div class="container">
            <form class="form-row" action="USRegistrar" method="post">
                <div class="col-md-2 col-xs-2"></div>
                <table class="table  col-md-8 col-xs-8" style="text-align: center;">
                    <tr>
                        <!-- Logo -->
                        <td id="td_izq" class="td_izq"> <!-- Lado izquierdo -->
                            <div class="col-md-6">
                                <img src="https://i.imgur.com/uEYS6LA.jpg" class="img-responsive" width="329" height="329">
                            </div>
                        </td>
                        <!-- Formulario -->
                        <td id="td_der" class="td_der"> <!-- Lado derecho -->
                            <div class="form-group">
                                <label><strong><h3>Crear cuenta</h3></strong></label>
                                <div></div>
                                <input type="text"  class="form-control" placeholder="Nombre" name="nombre_usuario" required>
                                <div style="margin-top: 5px"></div>

                                <input type="text"  class="form-control" placeholder="Apellidos" name="apellidos_usuario" required>
                                <div style="margin-top: 5px"></div>

                                <!--<input style="visibility: none;" type="number"  class="form-control" placeholder="Identificacion" name="id_usuario" minlength="10" maxlength="10" required>
                                <div style="margin-top: 5px"></div> -->
                                   
                                <select name="tipo_usuario">
                                    <option value="administrador">Administrador</option>
                                    <option value="usuario">Usuario</option>
                                    <option value="conductor">Conductor</option>
                                    <option value="moderador">Moderador</option>
                                </select>
                                <div style="margin-top: 5px"></div>

                                <input type="number"  class="form-control" placeholder="Numero de Telefono" name="telefono_usuario" minlength="10" maxlength="10" required>
                                <div style="margin-top: 5px"></div>

                                <input type="email"  class="form-control" placeholder="Correo electronico" name="correo_usuario" required>
                                <div style="margin-top: 5px"></div>

                                <input type="text"  class="form-control" placeholder="Usuario" name="usuario" required>
                                <div style="margin-top: 5px"></div>

                                <input type="password"  class="form-control" placeholder="Contraseña" name="pass_usuario" minlength="6"  required>
                                <div style="margin-top: 5px"></div>

                                <div>
                                    <div style="margin-top: 10px; margin-bottom: 10px"></div>
                                    <!--<a class="btn btn-dark" href="Registrar_codigo_verificacion.jsp" role="button">Registrarse</a>-->
                                    <input type="submit" class="btn btn-dark form-control" value="Registrar">
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="col-md-2 col-xs-2"></div>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>