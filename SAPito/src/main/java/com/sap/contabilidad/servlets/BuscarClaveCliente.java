/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.contabilidad.servlets;

import com.sap.conexion.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fgb
 */
@WebServlet(name = "BuscarClaveCliente", urlPatterns = {"/BuscarClaveCliente"})
public class BuscarClaveCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String cadena="id="+request.getParameter("clavep");  
        System.out.println("cadena:"+cadena);
        Conexion c=new Conexion();        
        HttpSession sesion=(HttpSession) request.getSession();
        int usu=Integer.valueOf(sesion.getAttribute("usuario").toString());
        String tabla="cuentacliente";
        String campos="id,clave,idcuentaempresa,idcliente";
        
        ArrayList l=c.consultaVariosCamposUnaClave2(cadena, campos,tabla, 4);
        int i = c.insercionRegistro(usu ,"contabilidad", "Consulta clave cliente");
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */                  
            out.println("<h1 class='text-center'> Consulta Realizada</h1>");         
            out.println("<table class='tablas table'>");         
            out.println("<tr>");
            out.println("<th>id</th>");
            out.println("<th>clave</th>");
            out.println("<th>idcuentaempresa</th>");
            out.println("<th>idcliente</th>");            
            out.println("</tr>");
            out.println("<tr>");                               
            out.println("<td>"+l.get(0)+"</td>");
            out.println("<td>"+l.get(1)+"</td>");
            out.println("<td>"+l.get(2)+"</td>");
            out.println("<td>"+l.get(3)+"</td>");            
            out.println("</tr>");            
            out.println("</table>");         
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BuscarClaveCliente.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BuscarClaveCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BuscarClaveCliente.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BuscarClaveCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
