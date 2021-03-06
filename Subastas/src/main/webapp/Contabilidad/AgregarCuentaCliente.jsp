<%@page import="com.sap.contabilidad.clases.Cliente"%>
<%@page import="com.sap.contabilidad.clases.ConsultasGenerales"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.sap.contabilidad.clases.CuentaEmpresa"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Subastas</title>
<!--Enlace a estilos personalizados de COntabilidad-->
<link href="../Recursos/css/contabilidad.css" rel="stylesheet" type="text/css"/>
<!--Validacion de campos-->
<script src="../Recursos/js/Contabilidad.js" type="text/javascript"></script>
<!-- Bootstrap -->
<link href="../Recursos/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="../Recursos/Bootstrap/include/jquery-3.3.1.min.js" type="text/javascript"></script>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../Recursos/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../Recursos/Bootstrap/include/popper.min.js" type="text/javascript"></script>
</head>
<body>    
    <header class="sticky-top">
        <nav class="navbar navbar-expand-lg navbar-light bg-primary">
            <a href="Contabilidad.jsp" class="navbar-brand text-white">Contabilidad</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conta_navbar" aria-controls="conta_navbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="conta_navbar">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="CalendarioContable.jsp" class="nav-link text-white">Calendario&nbsp;Contable</a>
                    </li>                            
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle text-white" id="cuentas" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Cuentas Contables</a>
                        <div class="dropdown-menu bg-primary" aria-labelledby="cuentas">
                            <a class="nav-link text-white" href="CuentasCliente.jsp">Cuentas&nbsp;Clientes</a>
                            <a class="nav-link text-white" href="CuentasProveedor.jsp">Cuentas&nbsp;Proveedores</a>
                            <a class="nav-link text-white" href="CuentasEmpresa.jsp">Cuentas&nbsp;Empresa</a>
                            <a class="nav-link text-white" href="CuentasSat.jsp">Cuentas&nbsp;SAT</a>                                    
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="AsientosContables.jsp" class="nav-link text-white">Asientos&nbsp;Contables</a>
                    </li> 
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle text-white" id="libros" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Libros</a>
                        <div class="dropdown-menu bg-primary" aria-labelledby="libros">
                            <a class="nav-link text-white" href="LibroDiario.jsp">Libro&nbsp;Diario</a>
                            <a class="nav-link text-white" href="LibroMayor.jsp">Libro&nbsp;Mayor</a>                                    
                        </div>
                    </li>                            
                </ul>   
               <form class="form-inline my-2 my-lg-0" action="../index.jsp">                
                    <button class="btn-outline-primary barra text-white my-2 my-sm-0" id="cerrarSesion" type="submit">Cerrar Sesi&oacute;n</button>
                </form>
            </div>
        </nav>
    </header>      
    <br/><br/>
<!--Contenedor principal de la pagina-->
<div class="container-fluid">
    <!--HAciendo una fila para dividir el contenedor en columnas-->
    <div class="row">
        <!--Columna de la izquierda-->
        <div class="col-xs-3 col-md-3 izquierda">            
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="container">
                    <form action="" method="post">
                        <div class="row">                        
                            <div class="col-xs-2">
                                <input id="clave" name="clave" class="form-control" type="text" placeholder="ingresa clave a buscar"/>
                            </div>
                        </div>
                        <div class="row">                        
                            <div class="col-xs-2">
                              <input type="submit" value="buscar"/>       
                            </div>
                        </div>                    
                    </form>
                </div>
                <hr/>
                <table class="tabla">
                	<tr>
                    	<td>
                    		<a href="AgregarCuentaCliente.jsp">Agregar Cuenta Cliente</a>
                        </td>
                    </tr>
                	<tr>
                    	<td>
                    		<a href="EliminarCuentaCliente.jsp">Eliminar Cuenta Cliente</a>
                        </td>
                    </tr>
                </table>
              </div>
            </div>            
        </div>
        <!--Columna Central-->
        <div class="col-xs-6 col-md-6 central table-responsive jumbotron">   
                    <h1 class="titulo">Agregar Cuenta Cliente</h1>                    
                    <form role="form" method="post" action="../AgregarCuentaCliente">
                        <div class="form-group">
                          <label for="claveCuenta">Ingrese una clave:</label>
                          <input type="text" class="form-control" id="claveCuenta" name="claveCuenta" required="required">
                        </div>
                        <div class="form-group">
                          <label for="tipoCuenta">TipoCuenta:</label>
                          <Select  class="form-control" id="tipoCuenta" name="tipoCuenta" required="required">
                              <option value="x">Seleccione...</option>
                              <%
                                LinkedList<CuentaEmpresa> lista =ConsultasGenerales.cuentaempresa();
                                for (int i=0;i<lista.size();i++)
                                {
                                   out.println("<option value='"+lista.get(i).getId()+"'>"+lista.get(i).getDescripcion()+"</option>");                                   
                                }
                              %>  
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="cliente">Seleccione cliente:</label>
                          <Select  class="form-control" id="cliente" name="cliente" required="required">
                              <option value="x">Seleccione...</option>
                            <%
                                LinkedList<Cliente> l =ConsultasGenerales.opcionesCliente();
                                for (int i=0;i<l.size();i++)
                                {                                   
                                   out.println("<option value='"+l.get(i).getId()+"'>"+l.get(i).getNombre()+"</option>");                                   
                                }
                            %> 
                          </select>
                        </div>
                        <button type="reset" class="btn btn-default">Cancelar</button>
                        <button type="submit" class="btn btn-default">Agregar</button>
                    </form>
        </div>
        <!--columna de la derecha-->
        <div class="col-xs-3 col-md-3 derecha table-responsive">
        </div>
    </div>
</div>
</body>
</html>
