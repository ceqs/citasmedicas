package edu.utp.dwi.citasmedicas.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import edu.utp.dwi.citasmedicas.dao.GraficoDAO;
import edu.utp.dwi.citasmedicas.model.GraficoCita;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.*;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author ceqs
 */
@WebServlet(name = "GraficoController", urlPatterns = {"/grafico"})
public class GraficoController extends HttpServlet {
    
    GraficoDAO daoGrafico = new GraficoDAO();

    JFreeChart torta(int an) {
        DefaultPieDataset ds = new DefaultPieDataset();
        for(GraficoCita x: daoGrafico.lisMes(an)) {
            ds.setValue(x.Lmes() + "-" + x.getTotal(), x.getTotal());
        }
        
        JFreeChart gf = ChartFactory.createPieChart3D("Anio " + an, ds);
        
        return gf;
    }
    
    JFreeChart barra(int an) {
        DefaultCategoryDataset ds = new DefaultCategoryDataset();
        for(GraficoCita x: daoGrafico.lisMes(an)) {
            ds.setValue(x.getTotal(), "Citas", x.Lmes());
        }
        
        JFreeChart gf = ChartFactory.createBarChart3D("Anio " + an, "Mes", "Cantidad", ds);
        
        return gf;
    }
    
    JFreeChart linea(int an) {
        DefaultCategoryDataset ds = new DefaultCategoryDataset();
        for(GraficoCita x: daoGrafico.lisMes(an)) {
            ds.setValue(x.getTotal(), "Citas", x.Lmes());
        }
        
        JFreeChart gf = ChartFactory.createLineChart("Anio " + an, "Mes", "Cantidad", ds);
        
        return gf;
    }
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
        response.setContentType("image/jpeg");
        
        int an = Integer.parseInt(request.getParameter("anio"));
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        try (OutputStream flujo = response.getOutputStream()) {
            if(tipo == 1)
                ChartUtilities.writeChartAsJPEG(flujo, barra(an), 450, 450);
            if(tipo == 2)
                ChartUtilities.writeChartAsJPEG(flujo, torta(an), 450, 450);
            if(tipo == 3)
                ChartUtilities.writeChartAsJPEG(flujo, linea(an), 450, 450);
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
