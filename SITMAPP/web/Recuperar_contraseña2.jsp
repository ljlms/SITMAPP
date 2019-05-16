<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Recuperar Contraseña</title>
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
		<form class="form-row">
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
							<label><strong><h3>Recuperar contraseña</h3></strong></label>
							<div style="margin-top:40px ; margin-bottom: 40px"></div>

							<div><label for="">Revise bandeja de entrada en su correo electronico.</label></div>
							
							<input type="number" name="" class="form-control" placeholder="Codigo de Verificación..." required>
							<div style="margin-top: 10px; margin-bottom: 10px"></div>
							
							<div><input type="submit" name="enviar_codigo" value="Verificar codigo" class="form-control btn btn-dark"></div>

							
							<div style="margin-top: 10px; margin-bottom: 10px"></div>
							<div> <input type="submit" name="verificar_codigo" value="Reenviar codigo" class="form-control btn btn-dark"></div>


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