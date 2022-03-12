/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.utp.dwi.citasmedicas.controller;

import com.google.gson.Gson;
import edu.utp.dwi.citasmedicas.dao.CitaDAO;
import edu.utp.dwi.citasmedicas.model.Cita;
import edu.utp.dwi.citasmedicas.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Properties;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Percy
 */
public class CitaController extends HttpServlet {
    
    CitaDAO daoCita = new CitaDAO();

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
            case 3:
                seleHorxMedxEsp(request, response);
                break; 
            case 4:
                grabarCita(request, response);
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
            
            out.println(gson.toJson(daoCita.getLista(str_fecI, str_fecF, id_Med, id_Esp)));
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
            out.println(gson.toJson(daoCita.getListMedxEsp(_id)));
            out.flush();
            out.close();
        }
    }
    
    protected void seleHorxMedxEsp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int _id = Integer.parseInt(request.getParameter("_id"));
            String _fecha = request.getParameter("_fechaI");

            Gson gson = new Gson();
            out.println(gson.toJson(daoCita.getListHorxMedxEsp(_id, _fecha)));
            out.flush();
            out.close();
        }
    }

    protected void grabarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Cita d = new Cita();
            java.sql.Date dateF = Date.valueOf(request.getParameter("txtfechaI"));

            d.setIdMedico(Integer.parseInt(request.getParameter("cboMedico")));
            HttpSession ses = request.getSession();
            Usuario usr = (Usuario)ses.getAttribute("usuario");
            d.setIdPaciente(usr.getPaciente().getIdPaciente());
            d.setIdHorario(Integer.parseInt(request.getParameter("cboHorario")));
            d.setFecha(dateF);            
            daoCita.adicionar(d);
            
            // Enviamos correo
            final AsyncContext contextoAsincrono = request.startAsync();
            contextoAsincrono.setTimeout(12000);
 
            final String fecha = request.getParameter("txtfechaI");
            final String horario = request.getParameter("des_horario");
            final String medico = request.getParameter("des_medico");
            contextoAsincrono.start(new Runnable() {
                @Override
                public void run() {
                    sendEmail(fecha, horario, medico);
                    contextoAsincrono.complete();
                }
            });
            
            request.setAttribute("fecha", fecha);
            request.setAttribute("horario", horario);
            request.setAttribute("medico", medico);
            request.getRequestDispatcher("/Registrado.jsp").forward(request, response);
        }
    }
    
    private void sendEmail(String fecha, String horario, String medico) {
        String remitente = "utp.cgt.apps@gmail.com";

        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.user", remitente);
        props.put("mail.smtp.clave", "XXX");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");

        try {
            Session session = Session.getDefaultInstance(props);
            MimeMessage message = new MimeMessage(session);


            message.setFrom(new InternetAddress(remitente));
            message.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress("utp.cgt.apps@gmail.com"));
            message.setSubject("Su cita ha sido registrada");
            message.setText("Para el " + fecha + " en el horario de : " + horario + ".\n" +
                            "Con el medico: " + medico + "\n" +
                            "\n" +
                            "IMPORTANTE: No olvide llegar 30 minutos antes de su cita.\n");
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", remitente, "XXX");
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (MessagingException me) {
            me.printStackTrace();   //Si se produce un error
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
