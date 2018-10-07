package com.sap.rh.servlets;

import com.sap.conexion.Conexion;
import com.sap.gerencia.clases.usuario;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Windows 10 Pro
 */
@WebServlet(urlPatterns = {"/CrearNomina"})
public class CrearNomina extends HttpServlet {

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
        String empleado = request.getParameter("idCrearNomina");
        String cantidad = request.getParameter("cantidadCrearNomina");
        String estado = request.getParameter("estadoCrearNomina");
        String recurso = request.getParameter("recursoCrearNomina");
        String regimen = request.getParameter("regimenCrearNomina");
        String periodicidad = request.getParameter("periodicidadCrearNomina");
        String tipo = request.getParameter("tipoCrearNomina");
        String percepcion = request.getParameter("percepcionCrearNomina");
        Conexion c = new Conexion();
        usuario usu = new usuario();
        ArrayList lista = c.consulta("cuenta", "empleado", "id = "+empleado, 1);
        String cuenta = lista.get(0).toString();
        if(!cuenta.isEmpty()){
            c.insertar("empleado,cantidad,cuenta,estado,origen_recurso,regimen,periodicidad,tipo,percepcion,situacion", "nomina",
                    empleado+","+cantidad+",'"+cuenta+"','"+estado+"','"+recurso+"','"+regimen+"','"+periodicidad+"','"+tipo+"','"+percepcion+"',-1");
        }
        
        int i = c.insercionRegistro(usu.getId_emp(),  "rh", "Crea una nomina");
        
        response.sendRedirect("RH/CrearNomina.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CrearNomina.class.getName()).log(Level.SEVERE, null, ex);
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
