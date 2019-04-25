function tipo_ruta(){
	var tipo_ruta = $('#tipo_ruta').val();

	if (tipo_ruta == 'nada') {
		$('#div_troncales').hide();
		$('#div_pre-troncales').hide();
		$('#div_alimentadoras').hide();
		$('#div_circulares').hide();
	}


	if (tipo_ruta == 't_troncal') {
		$('#div_troncales').show();
		$('#div_pre-troncales').hide();
		$('#div_alimentadoras').hide();
		$('#div_circulares').hide();
		
	}

	if (tipo_ruta == 't_pre') {
		$('#div_pre-troncales').show();
		$('#div_alimentadoras').hide();
		$('#div_circulares').hide();
		$('#div_troncales').hide();

	}

	if (tipo_ruta == 't_alimentadoras') {
		$('#div_alimentadoras').show();
		$('#div_troncales').hide();
		$('#div_pre-troncales').hide();
		$('#div_circulares').hide();
	}

	if (tipo_ruta == 't_circulares') {
		$('#div_circulares').show();
		$('#div_pre-troncales').hide();
		$('#div_alimentadoras').hide();
		$('#div_troncales').hide();

	}
}

