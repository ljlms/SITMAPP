<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="index.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta charset="utf-8">
        <title>Registrar usuario</title>
        <link rel="stylesheet" href="estilos_sitmapp.css"> <!-- Estilos  -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/animate.css"><!--Aniamte library-->
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <header><h3><br><br></h3></header>
        </div>
        <div class="container">


            <form class="form-row" action="USRegistrar" method="post" >
                <div class="col-xs-0 col-sm-0 col-md-1 col-lg-1"></div>
                <div class="col-xs-2 col-sm-5 col-md-5 col-lg-7 logo">
                    <img  src="templates/Logo Principal.jpg" class="img-responsive animated  bounceInLeft logo" >
                </div> 
                <div class="col-xs-10 col-sm-7 col-md-6 col-lg-4">


                    <div class="form-group">
                        <label><strong><h3>Crear cuenta</h3></strong></label>
                        <%String error = (String) request.getAttribute("error");
                            if (error != null) {
                        %>
                        <div class="alert alert-danger" role="alert">
                            <%=error%>
                        </div>
                        <%}%>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >Nombre:</span>
                            </div>
                            <input type="text"  class="form-control" placeholder="José" name="nombre_usuario" required>
                            <!--<input type="text" onblur="validarNombreUsuario(this)" class="form-control" placeholder="José" name="nombre_usuario" required>-->

                        </div>
                        <!--                        <script type="text/javascript">
                                                    function validarNombreUsuario(nombre_usuario) {
                                                        var url='/validarNombreUsuario';
                                                        var parametros='usuario='+nombre_usuario.value;
                                                        var ajax = new jQuery().ajax(
                                                                )
                                                        
                                                    }
                            
                        }
                                                    
                                                    
                                                </script>-->


                        <div></div>

                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >Apellidos:</span>
                            </div>
                            <input type="text"  class="form-control" placeholder="Sanchez Vidal" name="apellidos_usuario" required>
                        </div>


                        <div class="input-group mb-2 ">
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
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >Telefono: </span>
                            </div>
                            <div class="input-group-prepend">
                                <span class="input-group-text" >+57</span>
                            </div>
                            <input type="number"  class="form-control" placeholder="301-010-1010" name="telefono_usuario" maxlength="10"  required>
                        </div>
                        <div></div>

                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >Email:</span>
                            </div>
                            <input type="email"  class="form-control" placeholder="Ejemplo@gmail.com" name="correo_usuario" required>
                        </div>

                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >@</span>
                            </div>
                            <input type="text"  class="form-control" placeholder="Nombre de usuario" name="usuario" required>
                        </div>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >Contraseña</span>
                            </div>
                            <input type="password"  class="form-control" placeholder="Contraseña" name="pass_usuario" minlength="6"  required>
                        </div>

                        <div>
                            <div class="input-group mb-10">
                                <input type="submit" class="btn btn-dark form-control" value="Registrar">

                            </div>

                        </div>

                    </div>
                </div>
            </form>
        </div>

        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.bundle.js" type="text/javascript"></script>
    </body>
</html>