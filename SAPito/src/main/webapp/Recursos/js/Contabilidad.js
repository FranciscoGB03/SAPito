/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function regreso(){
   window.location.hash="no-back-button";
   window.location.hash="Again-No-back-button";
   window.onhashchange=function(){window.location.hash="no-back-button";};
}
function habilitar(value){
        if(value=="1")
        {
                // habilitamos
                document.getElementById("cuentapro").disabled=true;
                //deshabilitamos
                document.getElementById("cuentacli").disabled=false;
        }else if(value=="2"){
                // deshabilitamos
                document.getElementById("cuentapro").disabled=false;
                //habilitamos
                document.getElementById("cuentacli").disabled=true;
        }
}

$(document).ready(function() {
                $('#submit').click(function(event) {
                        var clavebuscar = $('#clave').val();        
                        // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
                        $.post('../BuscarClave', {
                                clavep : clavebuscar
                        }, function(responseText) {                            
                                $('#tabla').html(responseText);
                        });
                });
});

$(document).ready(function() {
                $('#btncliente').click(function(event) {
                        var clavebuscar = $('#clave').val();        
                        // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
                        $.post('../BuscarClaveCliente', {
                                clavep : clavebuscar
                        }, function(responseText) {                            
                                $('#tabla').html(responseText);
                        });
                });
});