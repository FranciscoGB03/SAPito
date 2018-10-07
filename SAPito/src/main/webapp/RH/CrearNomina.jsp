<%-- 
    Document   : CrearNomina
    Created on : 31/08/2018, 11:24:50 AM
    Author     : Windows 10 Pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link href="../Recursos/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
        <script src="../Recursos/Bootstrap/include/jquery-3.3.1.min.js" type="text/javascript"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed --> 
        <script src="../Recursos/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/Bootstrap/include/popper.min.js" type="text/javascript"></script>
        <!--CSS3 personalizado-->
        <link href="../Recursos/css/RecursosHumanos.css" rel="stylesheet" type="text/css"/>
        <!--Validacion de campos-->
        <script src="../Recursos/js/RecursosHumanos.js" type="text/javascript"></script>
        <title>Crear&nbsp;N&oacute;mina</title>
    </head>
    <body onload="regreso();">
        <div class="container-fluid">
            <div class="row"><!-- INICIO DE NAVBAR -->
                <div class="container-fluid">
                    <header class="sticky-top">
                        <nav class="navbar navbar-expand-lg navbar-light bg-primary">
                            <a href="#" class="navbar-brand text-white">Recursos&nbsp;Humanos</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#rh_navbar" aria-controls="rh_navbar" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="rh_navbar">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item dropdown">
                                        <a href="#" class="nav-link dropdown-toggle text-white" id="empleado" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Empleado</a>
                                        <div class="dropdown-menu bg-primary" aria-labelledby="empleado">
                                            <a class="nav-link text-white" href="ContratarEmpleado.jsp">Contrataci&oacute;n</a>
                                            <a class="nav-link text-white" href="ActividadEmpleado.jsp">Asignar&nbsp;actividad</a>
                                            <a class="nav-link text-white" href="DespedirEmpleado.jsp">Despido</a>
                                            <a class="nav-link text-white" href="BuscarEmpleado.jsp">Buscar</a>
                                            <a class="nav-link text-white" href="ModificarEmpleado.jsp">Modificar&nbsp;informaci&oacute;n</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a href="#" class="nav-link dropdown-toggle text-white" id="nomina" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">N&oacute;mina</a>
                                        <div class="dropdown-menu bg-primary" aria-labelledby="nomina">
                                            <a class="nav-link text-white" href="CrearNomina.jsp">Crear</a>
                                            <a class="nav-link text-white" href="EliminarNomina.jsp">Eliminar</a>
                                            <a class="nav-link text-white" href="ConsultarNomina.jsp">Consultar</a>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../index.jsp" class="nav-link bg-primary text-white">Cerrar&nbsp;sesi&oacute;n</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </header>
                </div>
            </div>
            <br><br>
            <!-- FIN DE NAVBAR -->
            <div class="row"><!-- INICIO DE SECCION PRINCIPAL -->
                <div class="container-fluid">
                    <center>
                        <form method="POST" action="../CrearNomina" autocomplete="off">
                            <table>
                                <tr>
                                    <td>
                                        ID&nbsp;del&nbsp;empleado
                                    </td>
                                    <td>
                                        <input type="number" id="idCrearNomina" name="idCrearNomina" class="form-control form-control-sm" required="required"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cantidad
                                    </td>
                                    <td>
                                        <input type="number" step="any" id="cantidadCrearNomina" name="cantidadCrearNomina" class="form-control form-control-sm" required="required"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Estado
                                    </td>
                                    <td>
                                        <select class="custom-select custom-select-sm" id="estadoCrearNomina" name="estadoCrearNomina" required="required">
                                            <option selected="selected" value="">Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                            <option value="AGU">Aguascalientes</option>
                                            <option value="BCN">Baja&nbsp;California&nbsp;Norte</option>
                                            <option value="BCS">Baja&nbsp;California&nbsp;Sur</option>
                                            <option value="CAM">Campeche</option>
                                            <option value="CHP">Chiapas</option>
                                            <option value="MEX">Estado&nbsp;de&nbsp;M&eacute;xico</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Origen&nbsp;del&nbsp;recurso
                                    </td>
                                    <td>
                                        <select class="custom-select custom-select-sm" id="recursoCrearNomina" name="recursoCrearNomina" required="required">
                                            <option selected="selected" value="">Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                            <option value="IP">Ingresos&nbsp;propios</option>
                                            <option value="IF">Ingresos&nbsp;federales</option>
                                            <option value="IM">Ingresos&nbsp;mixtos</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Regimen&nbsp;fiscal
                                    </td>
                                    <td>
                                        <select class="custom-select custom-select-sm" id="regimenCrearNomina" name="regimenCrearNomina" required="required">
                                            <option selected="selected" value="">Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                            <option value="605">Sueldos&nbsp;y&nbsp;salarios</option>
                                            <option value="612">Actividades&nbsp;profesionales&nbsp;y&nbsp;empresariales</option>
                                            <option value="614">Ingresos&nbsp;por&nbsp;intereses</option>
                                            <option value="616">Sin&nbsp;obligaciones&nbsp;fiscales</option>
                                            <option value="615">Obtenci&oacute;n&nbsp;de&nbsp;premios</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Periodicidad&nbsp;de&nbsp;pago
                                    </td>
                                    <td>
                                        <select class="custom-select custom-select-sm" id="periodicidadCrearNomina" name="periodicidadCrearNomina" required="required">
                                            <option selected="selected" value="">Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                            <option value="1">Diario</option>
                                            <option value="2">Semanal</option>
                                            <option value="3">Catorcenal</option>
                                            <option value="4">Quincenal</option>
                                            <option value="5">Mensual</option>
                                            <option value="6">Bimestral</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Tipo&nbsp;de&nbsp;n&oacute;mina
                                    </td>
                                    <td>
                                        <select class="custom-select custom-select-sm" id="tipoCrearNomina" name="tipoCrearNomina" required="required">
                                            <option selected="selected" value="">Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                            <option value="O">Ordinaria</option>
                                            <option value="E">Extraordinaria</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Tipo&nbsp;de&nbsp;percepci&oacute;n
                                    </td>
                                    <td>
                                        <select class="custom-select custom-select-sm" id="percepcionCrearNomina" name="percepcionCrearNomina" required="required">
                                            <option selected="selected" value="">Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                            <option value="1">Salarios</option>
                                            <option value="2">Aguinaldo</option>
                                            <option value="10">Premios&nbsp;por&nbsp;puntualidad</option>
                                            <option value="12">Gastos&nbsp;m&eacute;dicos&nbsp;mayores</option>
                                            <option value="14">Subsidios&nbsp;por&nbsp;incapacidad</option>
                                            <option value="19">Horas&nbsp;extra</option>
                                            <option value="20">Prima&nbsp;dominical</option>
                                            <option value="21">Prima&nbsp;vacacional</option>
                                            <option value="23">Pagos&nbsp;por&nbsp;separaci&oacute;n</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="submit" value="Registrar" class="btn btn-success"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </center>
                </div>
            </div><!-- FIN DE SECCION PRINCIPAL -->
        </div>
    </body>
</html>