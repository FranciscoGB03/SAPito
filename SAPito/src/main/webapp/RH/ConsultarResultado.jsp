<%-- 
    Document   : ConsultarResultado
    Created on : 15/09/2018, 02:17:43 PM
    Author     : Windows 10 Pro
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList lista = (ArrayList) request.getSession().getAttribute("nomina");
%>
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
        <title>Consultar&nbsp;N&oacute;mina</title>
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
                    <scroll-container>
                        <table align="center" class="table-bordered pantallaCompleta">
                            <tr>
                                <td>ID</td>
                                <td>Empleado</td>
                                <td>Cantidad</td>
                                <td>Estado</td>
                                <td>Origen&nbsp;del&nbsp;recurso</td>
                                <td>Regimen</td>
                                <td>Periodicidad</td>
                                <td>Tipo</td>
                                <td>Percepci&oacute;n</td>
                                <td>Situaci&oacute;n</td>
                            </tr>
                            <tr>
                                <%
                                    for(int i = 0 ; i < lista.size() ; i++){
                                        if(i%10 == 0){
                                            %>
                            </tr>
                            <tr>
                                            <%
                                        }%>
                                        <td><%= lista.get(i) %></td>
                                <%
                                    }
                                %>
                            </tr>
                        </table>
                    </scroll-container>
                </div>
            </div><!-- FIN DE SECCION PRINCIPAL -->
        </div>
    </body>
</html>
