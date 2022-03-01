package edu.utp.dwi.citasmedicas.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.google.gson.Gson;
import edu.utp.dwi.citasmedicas.dao.RolDAO;
import edu.utp.dwi.citasmedicas.model.Rol;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author ceqs
 */
@WebServlet(name = "RolController", urlPatterns = {"/rol"})
public class RolController extends HttpServlet {

    RolDAO daoRol = new RolDAO();

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

        try (PrintWriter out = response.getWriter()) {
            int op = Integer.parseInt(request.getParameter("opc"));           
            switch (op) {
                case 1:
                    adicionar(request, response);
                    break;
                case 2:
                    editar(request, response);
                    break;
                case 3:
                    seleccionar(request, response);
                    break;
                case 4:
                    borrar(request, response);
                    break;
                default:
                    listar(request, response);
            }
        }
    }

    protected void adicionar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Rol d = new Rol();
            d.setNomRol(request.getParameter("txtnombre"));
            daoRol.adicionar(d);
        }
    }

    protected void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Rol d = new Rol();
            d.setIdRol(Integer.parseInt(request.getParameter("txtcodigo")));
            d.setNomRol(request.getParameter("txtnombre"));
            daoRol.editar(d);
        }
    }

    protected void borrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int _id = Integer.parseInt(request.getParameter("_id"));

            daoRol.borrar(_id);
            out.println("");
            out.flush();
            out.close();
        }
    }

    protected void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Gson gson = new Gson();
            out.println(gson.toJson(daoRol.getLista()));
            out.flush();
            out.close();
        }
    }

    protected void seleccionar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int _id = Integer.parseInt(request.getParameter("_id"));
            Gson gson = new Gson();
            out.println(gson.toJson(daoRol.getDatos(_id)));
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
