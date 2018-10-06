/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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