var tipo = '<%=valor%>';
if (tipo === 'usuario') {
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
