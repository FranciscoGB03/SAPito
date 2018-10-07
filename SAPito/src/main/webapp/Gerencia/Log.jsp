<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList lista = (ArrayList) request.getSession().getAttribute("lista"); %>
<!DOCTYPE html>
<html>
    <head>
        <title>Informacion Gerencial</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../Gerencia/validaciones/validacion.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
    </head>

    <body> 
         <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav class="navbar navbar-expand-lg navbar-dark barra" style="background: #C2C2C2;" >
                <a class="navbar-brand text-white" href="../Gerencia/InicioGerencia.html"><h1>Informaci&oacute;n Gerencial</h1></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <li class="nav-item dropdown" style="list-style:none;">
                        <a id="menu" data-toggle="dropdown" class="nav-link dropdown-toggle" style="color: white;" >Historia</a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-item dropdown-submenu">
                                <form onsubmit="return validalog(fecha, area, horaInicio, horaFin);" action="" name="historial" method="post" autocomplete="off">
                                    <label>Fecha
                                        <input type="date" name="fecha" id="fecha" max="3000-12-31"  min="1000-01-01" class="form-control">
                                    </label>
                                    <br>
                                    <p>Area</p>
                                    <select name="area" id="area">
                                        <option value="gerencia">Gerencia</option> 
                                        <option value="rh">Recursos Humanos</option> 
                                        <option value="contabilidad">Contabilidad</option>
                                        <option value="inventarios">Inventarios</option> 
                                        <option value="compras">Compras</option> 
                                        <option value="ventas">Ventas</option> 
                                    </select>
                                    <br>
                                    <br>
                                    <label>Intervalo&nbsp;de&nbsp;tiempo</label>
                                    <div id="hora">
                                        <label>De: <input id="horaInicio" for="example-time-input" type="time" name="horaInicio" max="22:30:00" min="10:00:00" class="form-control"></label>
                                        <br>
                                        <label>A:   <input id="horaFin" for="example-time-input" type="time" name="horaFin" max="22:30:00" min="10:00:00"  class="form-control"></label>  
                                    </div>
                                    <br>
                                    <input type="submit" class="btn btn-danger text-white" value="Generar">
                                </form>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown" style="list-style:none;">
                        <a id="menu" data-toggle="dropdown" class="nav-link dropdown-toggle" style="color: white;" >Configuración</a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-item dropdown-submenu">
                                <p>Configurar Web Services</p>
                                <form  onsubmit="return validawebservice('nombre', 'ip', 'puerto');" action="" name="ws" method="post" autocomplete="off">
                                    <br>
                                    <label>Nombre&nbsp;del&nbsp;servicio
                                        <input type="" name="nombre" id="nombre"  class="form-control">
                                    </label>
                                    <br>
                                    <label>Ip&nbsp;del&nbsp;servicio
                                        <input type="" name="ip" id="ip" class="form-control">
                                    </label>
                                    <br>
                                    <label>Puerto&nbsp;del&nbsp;servicio
                                        <input type="" name="puerto" id="puerto"  class="form-control">
                                    </label>
                                    <br>
                                    <input type="submit" class="btn btn-danger text-white" value="Guardar">
                                </form>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item" style="list-style:none">
                        <a class="nav-link" href="#" style="color: white">Salir</a>
                    </li>
                </div>


            </nav>
        </header>
        <div id="principal">
            <div class="container-fluid" style="background-color: #EDEDED;"><!-- Seccion central (Visualizar tarea) -->
                <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <table style="margin: 0 auto;width:100%;height:100%;">
                        <tr>
                            <td align="center">DESCRIPCI&Oacute;N</td>
                            <td align="center">ID&nbsp;DEL&nbsp;EMPLEADO</td>
                            <td align="center">&Aacute;REA</td>
                            <td align="center">FECHA</td>
                            <td align="center">HORA</td>
                        </tr>
                        <tr>
                        <%
                            for(int i = 0 ; i < lista.size() ; i++){
                                if(i%5==0 && i!=0){out.print("</tr><tr>");}
                                out.print("<td align='center'>"+lista.get(i)+"</td>");
                            }
                            request.getSession().removeAttribute("lista");
                        %>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>