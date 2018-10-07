package com.sap.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class Conexion {
    
    public Connection conn;
    
    public Conexion() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }

    /**
     * inicio de conexion de la base de datos con postgres
     * @throws SQLException
     */
    public void openDB() throws SQLException {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SAP", connProp);
    }
        

    /**
    * Cierra la conexión con la base de datos
    * @throws SQLException
    */    
    public void closeDB() throws SQLException {
        conn.close();
    }
    
    public Integer insertar(String campos, String tabla, String valores) throws SQLException {
        openDB();
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO "+tabla+" ("+campos+") VALUES ("+valores+")");
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
    /**
     * 
     * @param campos
     * @param tabla
     * @param condicion
     * @param cantidad
     * @return
     * @throws SQLException 
     */
    public ArrayList consulta(String campos, String tabla, String condicion, int cantidad) throws SQLException {
        openDB();
        ArrayList r=new ArrayList();
        PreparedStatement ps;
        ps=conn.prepareStatement("SELECT "+campos+" FROM "+tabla+" WHERE "+condicion);
        ResultSet rs= ps.executeQuery();        
            while(rs.next()){
                for(int i = 1 ; i <= cantidad ; i++){
                    r.add(rs.getObject(i));
                }
            }        
        
        closeDB();        
        return r;
    }
    /**
     * Consulta general     
     * @param tabla     
     * @return
     * @throws SQLException 
     */
    public ArrayList consultaGeneral(String tabla) throws SQLException {
        openDB();
        ArrayList r=new ArrayList();
        PreparedStatement ps;
        ps=conn.prepareStatement("SELECT * FROM "+tabla+";");      
        ResultSet rs= ps.executeQuery();
        int i=1;
        while(rs.next()){
            r.add(rs.getObject(i));
            i=i+1;
        }
        closeDB();        
        return r;
    }
    /**
     * Metodo para obtener varios campos de una clave
     * @param clave
     * @param campos crear una cadena con todos los campos separados por comas
     * @param tabla
     * @param numcampos
     * @return
     * @throws SQLException 
     */
    public ArrayList consultaVariosCamposUnaClave(String clave,String campos,String tabla,int numcampos) throws SQLException{
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();        
        ps=conn.prepareStatement("SELECT "+campos+" FROM "+tabla+" WHERE clave='"+clave+"'");               
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
        ResultSet rs= ps.executeQuery();
        while (rs.next()) {                
                //System.out.println(rs.getInt(1));
//                r.add(rs.getString(1));
//                r.add(rs.getInt(2));
//                r.add(rs.getString(3));
//                r.add(rs.getString(4));
//                r.add(rs.getString(5));                
                  for (int i = 1; i <=numcampos; i++) {
                      r.add(rs.getObject(i));                      
                  }
            }
            
        closeDB();        
        return r;
    }
        public ArrayList consultaVariosCamposUnaClave2(String condicion,String campos,String tabla,int numcampos) throws SQLException{
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();        
        ps=conn.prepareStatement("SELECT "+campos+" FROM "+tabla+" WHERE "+condicion);               
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
        ResultSet rs= ps.executeQuery();
        while (rs.next()) {                     
                  for (int i = 1; i <=numcampos; i++) {
                      r.add(rs.getObject(i));                      
                  }
            }
            
        closeDB();        
        return r;
    }
    
    public Integer borrar(String tabla, String referencia) throws SQLException {
        openDB();
        PreparedStatement ps;
        ps=conn.prepareStatement("DELETE FROM "+tabla+" WHERE "+referencia);
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
    /**
     * este metodo permite actualizar datos de cualquier tabla
     * @param campos
     * @param tabla
     * @param referencia
     * @return
     * @throws SQLException 
     */
    
    public Integer actualizar(String campos, String tabla, String referencia) throws SQLException {
        openDB();
        PreparedStatement ps;
        ps=conn.prepareStatement("UPDATE "+tabla+" SET "+campos+" WHERE "+referencia);
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
    
    //log
    public int insercionRegistro(int id, String area, String des) throws SQLException{
        openDB();
        int valor=1;
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO log(id_emp,area,des) VALUES ("+id+",'"+area+"','"+des+"');");
        valor= ps.executeUpdate();
        closeDB();        
        return valor;
    }
    
     public ArrayList consulta(String campos, String tabla, String referencia, String condicion, String extra, int cantidad) throws SQLException {
        openDB();
        if(condicion.equals("")){condicion="is not null";}
        ArrayList r=new ArrayList();
        PreparedStatement ps;
        ps=conn.prepareStatement("SELECT "+campos+" FROM "+tabla+" WHERE "+referencia+" "+condicion+" "+extra);
        ResultSet rs= ps.executeQuery();
        while(rs.next()){
            for(int i = 1 ; i <= cantidad ; i++){r.add(rs.getObject(i));}
        }
        closeDB();        
        return r;
    }
    
}
