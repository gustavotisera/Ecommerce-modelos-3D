/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Fecha;

/**
 *
 * @author usuario
 */
public class SendMail extends HttpServlet {

   
    private String username = "";
    private String password = "";
    private String msj = "";
    private String to = "";
    private String Subject = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Fecha fechaSistem = new Fecha();
        String usr = (String) request.getSession().getAttribute("usuario");
        String email =(String) request.getSession().getAttribute("email");
//        int codCompra = (int) request.getSession().getAttribute("codCompra");
        
        username = "";
        password = "";
        msj = "Hola, "+usr+"\n"
                + "Gracias por tu reciente transacción en Unique3D\n"
                + "Los modelos  se han añadido a tu cuenta,\n "
                + "podras verlos en la seccion de MisCompras \n"
                + "\n"
                + "Nombre de la cuenta:	"+usr+"\n"
                + "Codigo de Compra: 5566\n"
                + "Fecha de emisión: "+fechaSistem.FechaBD()+"\n"
                + "Método de pago: Cartera de Unique3D";
        to = email;
        Subject = "Unique3D Support";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject(Subject);
            message.setText(msj);

            Transport.send(message);

            request.getRequestDispatcher("compras.jsp").forward(request, response);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
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
