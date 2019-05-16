<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Usuario</title>
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>
    <body>
        <div class="container">
            <div class="col-md-12">
                <br>    <br>

            </div>
            <form class="form-row" action="USRegistrar" method="post" >
                <div class="col-md-2 col-xs-2">
                    <!--<a href="index.jsp"><span class="glyphicon">&#xe258;</span></a>-->  
                </div>      
                <div class="col-md-6    ">
                    <img src="https://i.imgur.com/uEYS6LA.jpg" class="img-responsive" width="350" height="400">
                </div>
                <div class="form-group">
                    <label><strong><h3>Crear cuenta</h3></strong></label>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Nombre:</span>
                        </div>
                        <input type="text"  class="form-control" placeholder="José" name="nombre_usuario" required>
                    </div>
                    <div></div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Apellidos:</span>
                        </div>
                        <input type="text"  class="form-control" placeholder="Sanchez Vidal" name="apellidos_usuario" required>
                    </div>


                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Tipo de usuario</span>
                        </div>

                        <select name="tipo_usuario" class="form-control" style="align-content: center" >
                            <option value="administrador">Administrador</option>
                            <option value="usuario">Usuario</option>
                            <option value="conductor">Conductor</option>
                            <option value="moderador">Moderador</option>
                        </select>
                    </div>


                    <div></div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Telefono: </span>
                        </div>
                        <div class="input-group-prepend">
                            <span class="input-group-text" >+57</span>
                        </div>
                        <input type="number"  class="form-control" placeholder="301-010-1010" name="telefono_usuario" minlength="10" maxlength="10" required>
                    </div>
                    <div></div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Email:</span>
                        </div>
                        <input type="email"  class="form-control" placeholder="Ejemplo@gmail.com" name="correo_usuario" required>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >@</span>
                        </div>
                        <input type="text"  class="form-control" placeholder="Nombre de usuario" name="usuario" required>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Contraseña</span>
                        </div>
                        <input type="password"  class="form-control" placeholder="Contraseña" name="pass_usuario" minlength="6"  required>
                    </div>

                    <div>
                        <div style="margin-top: 10px; margin-bottom: 10px"></div>
                        <!--<a class="btn btn-dark" href="Registrar_codigo_verificacion.jsp" role="button">Registrarse</a>-->
                        <input type="submit" class="btn btn-dark form-control" value="Registrar">
                    </div>
<!--                    <div>
                        <label></label>
                    </div>
                    <div>
                        <a href="index.jsp"><button type="button" class="btn btn-dark form-control"> Cancelar </button></a>
                    </div>-->
                </div>
                <div class="col-md-2 col-xs-2"></div>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>