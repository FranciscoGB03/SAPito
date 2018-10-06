
package com.sap.contabilidad.clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.Properties;

/**
 *
 * @author fgb
 */
public class ConsultasGenerales {
    /**
     * metodo para mostrar los periodos contables
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static LinkedList consultaGeneral() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <Calen_Contable> l=new LinkedList<Calen_Contable>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM calen_contable order by clave asc");
            while (rs.next()) {
                Calen_Contable cc=new Calen_Contable();
                cc.setId(rs.getInt("id"));
                cc.setClave(rs.getString("clave"));
                cc.setPeriodo(rs.getInt("periodo"));                
                cc.setFechaini(rs.getString("fechaini"));
                cc.setFechafin(rs.getString("fechafin"));
                cc.setEstatus(rs.getString("estatus"));                
                l.add(cc);
            }                    
        conn.close();
        return l;
    }
    /**
     * metodo para desplegar las cuentas contables
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static LinkedList cuentaSat() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <CuentaSat> l=new LinkedList<CuentaSat>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM cuentasat");
            while (rs.next()) {
                CuentaSat cs=new CuentaSat();
                cs.setId(rs.getInt("id"));
                cs.setCuenta(rs.getDouble("codigosat"));
                cs.setDescripcion(rs.getString("descripcion"));                                
                l.add(cs);
            }                    
        conn.close();
        return l;
    }
    public static LinkedList cuentaempresa() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <CuentaEmpresa> l=new LinkedList<CuentaEmpresa>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT ce.id,ce.clave,cs.codigosat,ce.descripcion,ce.naturaleza FROM cuentaempresa as ce, cuentasat as cs where ce.id_sat=cs.id;");
            while (rs.next()) {
                CuentaEmpresa ce=new CuentaEmpresa();
                ce.setId(rs.getInt("id"));             
                ce.setClave(rs.getString("clave"));
                ce.setClavesat(rs.getDouble("codigosat"));
                ce.setDescripcion(rs.getString("descripcion"));
                ce.setNaturaleza(rs.getString("naturaleza"));
                l.add(ce);
            }                    
        conn.close();
        return l;
    }
    /**
     * clase para mostrar como opciones en un combobox
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static LinkedList opcionesProveedor() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <Proveedor> l=new LinkedList<>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id, nombre FROM proveedores");
            while (rs.next()) {
                Proveedor p=new Proveedor();
                p.setId(rs.getInt("id"));             
                p.setNombre(rs.getString("nombre"));                
                l.add(p);
            }                    
        conn.close();
        return l;
    }
    /**
     * Consulta de cuentas de proveedor
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static LinkedList cuentaProveedor() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <CuentaProveedor> l=new LinkedList<CuentaProveedor>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT cp.id,cp.clave,cp.idcuentaempresa,ce.descripcion, p.nombre FROM cuentaempresa as ce,cuentaproveedor as cp, proveedores as p where cp.idproveedor=p.id and cp.idcuentaempresa=ce.id;");
            while (rs.next()) {
                CuentaProveedor cp=new CuentaProveedor();
                cp.setId(rs.getInt("id"));             
                cp.setClave(rs.getString("clave"));
                cp.setNombre(rs.getString("nombre"));
                cp.setCuentaempresa(rs.getString("descripcion"));                
                l.add(cp);
            }                    
        conn.close();
        return l;
    }
    /**
     * opciones para mostar en un combobox
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static LinkedList opcionesCliente() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <Cliente> l=new LinkedList<>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id, nombre FROM cliente");
            while (rs.next()) {
                Cliente p=new Cliente();
                p.setId(rs.getInt("id"));             
                p.setNombre(rs.getString("nombre"));                
                l.add(p);
            }                    
        conn.close();
        return l;
    }
    /**
     * metodo para mostrar las cuentas contables de los clientes
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static LinkedList cuentaCliente() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <CuentaCliente> l=new LinkedList<CuentaCliente>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT cc.id,cc.clave,cc.idcuentaempresa,ce.descripcion, c.nombre FROM cuentaempresa as ce,cuentacliente as cc, cliente as c where cc.idcliente=c.id and cc.idcuentaempresa=ce.id;");
            while (rs.next()) {
                CuentaCliente cc=new CuentaCliente();
                cc.setId(rs.getInt("id"));             
                cc.setClave(rs.getString("clave"));
                cc.setNombre(rs.getString("nombre"));
                cc.setCuentaempresa(rs.getString("descripcion"));                
                l.add(cc);
            }                    
        conn.close();
        return l;
    }
    /**
     * muestra las opciones de areas en un combobox
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static LinkedList opcionesArea() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <Area> l=new LinkedList<>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM area");
            while (rs.next()) {
                Area a=new Area();
                a.setId(rs.getInt("id"));             
                a.setNombre(rs.getString("nombre"));                
                l.add(a);
            }                    
        conn.close();
        return l;
    }
    /**
     * muestra las claves de los asientos generales
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static LinkedList opcionesAsientoGeneral() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <AsientoGeneral> l=new LinkedList<>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT ag.id,ag.clave,ar.nombre,ag.idperiodo,ag.fecha,ag.concepto FROM asientogeneral as ag,area as ar where ag.idarea=ar.id;");
            while (rs.next()) {
                AsientoGeneral ag=new AsientoGeneral();
                ag.setId(rs.getInt("id"));             
                ag.setClave(rs.getString("clave"));                
                ag.setIdarea(rs.getString("nombre"));
                ag.setPeriodo(rs.getInt("idperiodo"));
                ag.setFecha(rs.getString("fecha"));
                ag.setConcepto(rs.getString("concepto"));
                l.add(ag);
            }                    
        conn.close();
        return l;
    }
    /**
     * muestra los numeros de las facturas hechas
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static LinkedList opcionesFactura() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <Factura> l=new LinkedList<>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM factura");
            while (rs.next()) {
                Factura f=new Factura();
                f.setId(rs.getInt("id"));             
                f.setClave(rs.getString("clave"));
                f.setFecha(rs.getString("fecha"));
                f.setTipo(rs.getString("tipo"));
                f.setNombrecli(rs.getString("nombrecli"));
                f.setNombrepro(rs.getString("nombrepro"));
                f.setTotal(rs.getDouble("total"));
                l.add(f);
            }                    
        conn.close();
        return l;
    }
    public static LinkedList asientoContable() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <AsientoContable> l=new LinkedList<AsientoContable>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select ag.id,ag.clave as asientog,ar.nombre as modulo,cal.clave as periodo,ag.fecha,ag.concepto,ad.monto,f.clave as factu,f.nombrecli,f.nombrepro from asientogeneral as ag,area as ar,\n" +
        "calen_contable as cal,\n" +
        "asientodetalle as ad,\n" +
        "factura as f\n" +
        "where ag.idarea=ar.id and ag.idperiodo=cal.id and ag.id=ad.idasientog and ad.idfactu=f.id;");
            while (rs.next()) {
                AsientoContable ac=new AsientoContable();
                ac.setClaveg(rs.getString("asientog"));             
                ac.setModulo(rs.getString("modulo"));
                ac.setPeriodo(rs.getString("periodo"));
                ac.setFecha(rs.getString("fecha"));
                ac.setConcepto(rs.getString("concepto"));
                ac.setMonto(rs.getDouble("monto"));
                ac.setClavefactu(rs.getString("factu"));
                ac.setIdcuentacli(rs.getString("nombrecli"));
                ac.setIdcuentapro(rs.getString("nombrepro"));
                l.add(ac);
            }                    
        conn.close();
        return l;
    }
}
