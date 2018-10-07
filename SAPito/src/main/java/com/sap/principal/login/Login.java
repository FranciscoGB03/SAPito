package com.sap.principal.login;

import com.sap.conexion.Conexion;
import com.sap.gerencia.clases.usuario;
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

@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String usuario = request.getParameter("user");
            String pass = request.getParameter("password");
            System.out.println("usuario:"+usuario);
            System.out.println("pass:"+pass);
            Conexion c = new Conexion();
            usuario usu = new usuario();
            ArrayList lista = c.consulta("area", "empleado", "id = "+usuario+" and contrasena = '"+pass+"'",1);
            usu.setId_emp(Integer.parseInt(usuario));
            if(!lista.isEmpty()){
                Integer area = Integer.parseInt(lista.get(0).toString());
                System.out.println("area:"+area);
                //c.insertar("descripcion", "log", "'Inicio de sesion para "+usuario+"'");
                switch(area){
                    case 1 :
                        response.sendRedirect("Gerencia/InicioGerencia.jsp");
                        break;
                    case 2 :
                        response.sendRedirect("RH/rh_index.jsp");
                        break;
                    case 3 :
                        response.sendRedirect("Contabilidad/Contabilidad.jsp");
                        break;
                    default:
                        response.sendRedirect("index.jsp");
                        break;
                }
            }else{
                c.insertar("descripcion", "log", "'Inicio de sesion fallido para "+usuario+"'");
                response.sendRedirect("index.jsp");
            }
        }
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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