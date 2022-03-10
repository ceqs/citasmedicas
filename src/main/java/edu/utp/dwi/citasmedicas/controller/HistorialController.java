package edu.utp.dwi.citasmedicas.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import edu.utp.dwi.citasmedicas.dao.HistorialDAO;
import edu.utp.dwi.citasmedicas.model.Usuario;
import javax.servlet.http.HttpSession;

public class HistorialController extends HttpServlet {

    HistorialDAO daoHistorial = new HistorialDAO();

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");        
        int op = Integer.parseInt(request.getParameter("opc"));
        switch (op) {
            case 1:
                seleMedxEsp(request, response);
                break;
            case 2:
                listar(request, response);
                break; 
        }  
    }
    
    protected void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Gson gson = new Gson();
            
            String str_fecI = request.getParameter("txtfechaI");
            String str_fecF = request.getParameter("txtfechaF");
            int id_Med = Integer.parseInt(request.getParameter("cboMedico"));
            int id_Esp = Integer.parseInt(request.getParameter("cboEspecial"));
            HttpSession ses = request.getSession();
            Usuario usr = (Usuario)ses.getAttribute("usuario");
            
            int idpaciente = 0;
            if(usr.getPaciente() != null) {
                idpaciente = usr.getPaciente().getIdPaciente();
            }
            out.println(gson.toJson(daoHistorial.getLista(idpaciente, str_fecI, str_fecF, id_Med, id_Esp)));
            out.flush();
            out.close();
        }
    }
    
    protected void seleMedxEsp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int _id = Integer.parseInt(request.getParameter("_id"));

            Gson gson = new Gson();
            out.println(gson.toJson(daoHistorial.getListMedxEsp(_id)));
            out.flush();
            out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
