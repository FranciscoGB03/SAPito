/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.contabilidad.servlets;

import com.sap.conexion.Conexion;
import com.sap.gerencia.clases.usuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
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
@WebServlet(name = "AgregarPeriodoContable", urlPatterns = {"/AgregarPeriodoContable"})
public class AgregarPeriodoContable extends HttpServlet {

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
        Conexion c=new Conexion();
             
        int resultado=0;        
        String campos="'"+request.getParameter("clavep")+"',"+request.getParameter("ejercicio")+",'"+ request.getParameter("fechaini")+"','"+request.getParameter("fechafin")+"','"+request.getParameter("estado")+"'";
        System.out.println("cadena:"+campos);         
        
        resultado=c.insertar("clave,periodo,fechaini,fechafin,estatus","calen_contable", campos);                            
        System.out.println("el resultado fue:"+resultado);
        
        HttpSession sesion=(HttpSession) request.getSession();
        int usu=Integer.valueOf(sesion.getAttribute("usuario").toString());
        int i = c.insercionRegistro(usu,  "contabilidad", "Agrego periodo contable");
        
        if(resultado!=1){
            request.getSession().setAttribute("motivo", "Error de conexión, intentelo nuevamente!");
            response.sendRedirect("Contabilidad/Error.jsp");            
        }else{            
            response.sendRedirect("Contabilidad/CalendarioContable.jsp");
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
            Logger.getLogger(AgregarPeriodoContable.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AgregarPeriodoContable.class.getName()).log(Level.SEVERE, null, ex);
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
