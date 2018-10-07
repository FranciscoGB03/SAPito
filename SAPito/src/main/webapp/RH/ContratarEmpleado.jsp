<%-- 
    Document   : ContratarEmpleado
    Created on : 31/08/2018, 01:29:52 PM
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
        <title>Contratar&nbsp;Empleado</title>
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
                        <form method="POST" autocomplete="off" action="../ContratarEmpleado" onsubmit="return valida();" id="formContratarEmp" name="formContratarEmp">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        Lugar&nbsp;de&nbsp;origen
                                    </td>
                                    <td>
                                        <input class="form-check-input" type="radio" name="empleadoOrigen" id="origenMexico" checked="checked" value="mexico"/>
                                        <label for="origenMexico">M&eacute;xico</label>
                                    </td>
                                    <td>
                                        <input class="form-check-input" type="radio" name="empleadoOrigen" id="origenExtranjero" value="extranjero"/>
                                        <label for="origenExtranjero">Extranjero</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        CURP
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" style="text-transform: uppercase;" id="curpContratarEmp" name="curpContratarEmp" onblur="datosCurp()" required="required"/>
                                    </td>
                                    <td>
                                        RFC
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" style="text-transform: uppercase;" id="rfcContratarEmp" name="rfcContratarEmp" required="required"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Nombre
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="nombreContratarEmp" name="nombreContratarEmp" required="required"/>
                                    </td>
                                    <td>
                                        &Aacute;rea
                                    </td>
                                    <td>
                                        <select class="custom-select custom-select-sm" id="areaContratarEmp" name="areaContratarEmp" required="required">
                                            <option selected="selected" value="">Selecciona&nbsp;un&nbsp;&aacute;rea...</option>
                                            <option value="1">Gerencia</option>
                                            <option value="2">Recursos&nbsp;Humanos</option>
                                            <option value="3">Contabilidad</option>
                                            <option value="4">Ventas</option>
                                            <option value="5">Compras</option>
                                            <option value="6">Inventario</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Primer&nbsp;apellido
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="paternoContratarEmp" name="paternoContratarEmp" required="required"/>
                                    </td>
                                    <td>
                                        Puesto
                                    </td>
                                    <td>
                                        <select class="custom-select custom-select-sm" id="puestoContratarEmp" name="puestoContratarEmp" required="required">
                                            <option selected="selected" value="">Selecciona&nbsp;un&nbsp;puesto...</option>
                                            <option value="1">Administrador</option>
                                            <option value="2">Empleado&nbsp;de&nbsp;planta</option>
                                            <option value="3">Asistente</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Segundo&nbsp;apellido
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="maternoContratarEmp" name="maternoContratarEmp" required="required"/>
                                    </td>
                                    <td>
                                        Tel&eacute;fono
                                    </td>
                                    <td>
                                        <input type="number" class="form-control form-control-sm" id="telContratarEmp" name="telContratarEmp" minlength="10" maxlength="15" required="required"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Edad
                                    </td>
                                    <td>
                                        <input type="number" class="form-control form-control-sm" id="edadContratarEmp" name="edadContratarEmp" min="18" max="80" required="required"/>
                                    </td>
                                    <td>
                                        Horario
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="horarioContratarEmp" name="horarioContratarEmp" required="required" readonly="readonly"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Lugar&nbsp;de&nbsp;nacimiento
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="lugarContratarEmp" name="lugarContratarEmp" required="required" readonly="readonly"/>
                                    </td>
                                    <td>
                                        Actividad
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="activContratarEmp" name="activContratarEmp" required="required"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Direcci&oacute;n
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="dirContratarEmp" name="dirContratarEmp" required="required"/>
                                    </td>
                                    <td>
                                        Sueldo
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="sueldoContratarEmp" name="sueldoContratarEmp" required="required" readonly="readonly"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Nacionalidad
                                    </td>
                                    <td>
                                        <input type="text" class="form-control form-control-sm" id="nacContratarEmp" name="nacContratarEmp" value="Mexicana" required="required" readonly="readonly"/>
                                    </td>
                                    <td>
                                        Cuenta&nbsp;bancaria
                                    </td>
                                    <td>
                                        <input type="number" class="form-control form-control-sm" id="cuentaContratarEmp" name="cuentaContratarEmp" maxlength="16" required="required"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
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