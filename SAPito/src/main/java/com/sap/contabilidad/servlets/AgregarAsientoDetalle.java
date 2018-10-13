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
@WebServlet(name = "AgregarAsientoDetalle", urlPatterns = {"/AgregarAsientoDetalle"})
public class AgregarAsientoDetalle extends HttpServlet {

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
        HttpSession sesion=(HttpSession) request.getSession();
        int usu=Integer.valueOf(sesion.getAttribute("usuario").toString());        
        //valor que determina la cuenta
        int tipo= Integer.valueOf(request.getParameter("tipo").toString());
        System.out.println("valor de tipo:"+tipo);
        //campos
        String idasientog=request.getParameter("claveAsiento");
        String idcuentacli=request.getParameter("cuentacli");
        String idcuentapro=request.getParameter("cuentapro");
        String monto=request.getParameter("monto");
        String descripcion=request.getParameter("descripcion");
        String idfactu=request.getParameter("idfactura");
        //valores para la tabla de asientodetalle
        String valores=idasientog+","+idcuentacli+","+monto+",'"+descripcion+"',"+idfactu;
        System.out.println("los valores del cliente son:"+valores);
        String valores2=idasientog+","+idcuentapro+","+monto+",'"+descripcion+"',"+idfactu;
        System.out.println("los valores del proveedor son:"+valores2);
        String tabla="asientodetalle";
        if(tipo==1){
            String camposcli="idasientog,idcuentacli,monto,descripcion,idfactu";
            System.out.println("campos cliente:"+camposcli);
            c.insertar(camposcli, tabla, valores);
        }else{
            String campospro="idasientog,idcuentapro,monto,descripcion,idfactu";
            System.out.println("campos proveedor:"+campospro);
            c.insertar(campospro, tabla, valores2);
        }
        int i = c.insercionRegistro(usu,  "contabilidad", "Agrego asiento a detalle");
        response.sendRedirect("Contabilidad/AsientosContables.jsp");        
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
            Logger.getLogger(AgregarAsientoDetalle.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AgregarAsientoDetalle.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AgregarAsientoDetalle.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AgregarAsientoDetalle.class.getName()).log(Level.SEVERE, null, ex);
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
