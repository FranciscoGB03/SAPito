<%-- 
    Document   : ModificarEmpleado
    Created on : 31/08/2018, 01:32:24 PM
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
        <title>Modificar&nbsp;Empleado</title>
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
                        <form method="POST" action="../ModificarEmpleado" autocomplete="off">
                            <table>
                                <tr>
                                    <td>
                                        ID&nbsp;del&nbsp;empleado
                                    </td>
                                    <td>
                                        <input type="number" id="modificarIdEmpleado" name="modificarIdEmpleado" class="form-control form-control-sm" required="required"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <center>
                                            <input type="submit" class="btn btn-success" value="Buscar"/>
                                        </center>
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