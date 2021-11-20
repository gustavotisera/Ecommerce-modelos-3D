/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author usuario
 */
public class SendMail {
//        private static void enviarConGMail(String destinatario, String asunto, String cuerpo) {
//    // Esto es lo que va delante de @gmail.com en tu cuenta de correo. Es el remitente también.
////    private String remitente = "pelukapo2012@gmail.com";  //Para la dirección nomcuenta@gmail.com
//
//    
//    props.put("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
//    props.put("mail.smtp.user", remitente);
//    props.put("mail.smtp.clave", "miClaveDeGMail");    //La clave de la cuenta
//    props.put("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
//    props.put("mail.smtp.starttls.enable", "true"); //Para conectar de manera segura al servidor SMTP
//    props.put("mail.smtp.port", "587"); //El puerto SMTP seguro de Google
//
//    Session session = Session.getDefaultInstance(props);
//    MimeMessage message = new MimeMessage(session);
//
//    try {
//        message.setFrom(new InternetAddress(remitente));
//        message.addRecipient(Message.RecipientType.TO, destinatario);   //Se podrían añadir varios de la misma manera
//        message.setSubject(asunto);
//        message.setText(cuerpo);
//        Transport transport = session.getTransport("smtp");
//        transport.connect("smtp.gmail.com", remitente, clave);
//        transport.sendMessage(message, message.getAllRecipients());
//        transport.close();
//    }
//    catch (MessagingException me) {
//        me.printStackTrace();   //Si se produce un error
//    }
//}
        public boolean sendEmail(usuario user) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = "pelukapo2012@gmail.com";
        String password = "pelu41002809";

        try {

          
            Properties pr = new Properties();
            
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
     
 
            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

    		//set from email address
            mess.setFrom(new InternetAddress(fromEmail));
    		//set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
    		
    		//set email subject
            mess.setSubject("User Email Verification");
            
    		//set message text
            mess.setText("Registered successfully.Please verify your account using this code");
            //send the message
            Transport.send(mess);
            
            test=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

}
