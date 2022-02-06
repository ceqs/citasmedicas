/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlet;

import dao.Negocio;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Alumno;

/**
 *
 * @author ceqs
 */
@WebServlet(name = "Control", urlPatterns = {"/control"})
public class Control extends HttpServlet {
    Negocio obj = new Negocio();
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
        int opc = Integer.parseInt(request.getParameter("opc"));
        if(opc == 1) {
            lisAlumno(request, response);
        }
        if(opc == 2) {
            lisNotas(request, response);
        }
        if(opc == 3) {
            lisAlumnoNotas(request, response);
        }
        if(opc == 4) {
            edita(request, response);
        }
        if(opc == 5) {
            borra(request, response);
        }
        if(opc == 6) {
            adicion(request, response);
        }
        if(opc == 7) {
            actualiza(request, response);
        }
    }

    protected void lisAlumno(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("cod");
        request.setAttribute("dato", obj.lisAlumno(code));
        request.getRequestDispatcher("/pagAlumno.jsp").forward(request, response);
    }
    
    protected void lisNotas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String coda = request.getParameter("cod");
        request.setAttribute("dato", obj.lisNotas(coda));
        request.setAttribute("ape", request.getParameter("ape"));
        request.setAttribute("nom", request.getParameter("nom"));
        request.getRequestDispatcher("/pagNota.jsp").forward(request, response);
    }
    
    protected void lisAlumnoNotas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String codc = request.getParameter("cod");
        request.setAttribute("dato", obj.lisAlumnosCurso(codc));
        request.getRequestDispatcher("/pagAlumnoNotas.jsp").forward(request, response);
    }
    
    protected void edita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String coda = request.getParameter("cod");
        request.setAttribute("dato", obj.busAlumno(coda));
        request.getRequestDispatcher("/pagEditar.jsp").forward(request, response);
    }
    
    protected void borra(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String coda = request.getParameter("cod");
        obj.anula(coda);
        request.getRequestDispatcher("/genAlumno.jsp").forward(request, response);
    }
    
    protected void adicion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Alumno a = new Alumno();
        a.setNoma(request.getParameter("nombre"));
        a.setApe(request.getParameter("apellido"));
        a.setCode(request.getParameter("cbe"));
        a.setProce(request.getParameter("tipo"));
        obj.adicion(a);
        
        request.getRequestDispatcher("/genAlumno.jsp").forward(request, response);
    }
    
    protected void actualiza(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Alumno a = new Alumno();
        a.setCoda(request.getParameter("codigo"));
        a.setNoma(request.getParameter("nombre"));
        a.setApe(request.getParameter("apellido"));
        a.setCode(request.getParameter("cbe"));
        a.setProce(request.getParameter("tipo"));
        obj.modifica(a);
        
        request.getRequestDispatcher("/genAlumno.jsp").forward(request, response);
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
