/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.notification;

import co.edu.sena.mesaayuda.model.Notification;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author julil
 */
public class NotificationByEmail implements Notificator {

    private static final String Channel = "Email";
    private static final Logger logger = Logger.getLogger(NotificationByEmail.class.getName());

    private final String sender;
    private final String host;
    private final String port;
    private final String username;
    private final String password;

    public NotificationByEmail(String sender, String host, String port, String username, String password) {
        this.sender = sender;
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
    }

    @Override
    public void MtSendNotification(Notification oNotification) {
        try {
            if (oNotification == null) {
                logger.log(Level.SEVERE, "El objeto oNotification es nulo");
                return;
            }

            String destination = oNotification.getAddressee().getEmail();

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host != null ? host : "smtp.gmail.com");
            props.put("mail.smtp.port", port != null ? port : "587");

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            String contenidoPlano = oNotification.getMessage();
            String destinatarioNombre = oNotification.getAddressee().getName();

            String htmlContent = "<div style=\"font-family: Arial, sans-serif; background-color: #f4f6f9; padding: 20px;\">"
                    + "<div style=\"max-width: 600px; background-color: #ffffff; margin: 0 auto; padding: 25px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.05);\">"
                    + "<h2 style=\"color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px;\">Mesa de Ayuda - CIMM</h2>"
                    + "<p style=\"font-size: 16px; color: #333333;\">Hola <strong>" + destinatarioNombre + "</strong>,</p>"
                    // Aquí metemos el mensaje plano en un contenedor bonito
                    + "<div style=\"background-color: #eef2f7; padding: 15px; border-radius: 5px; margin: 20px 0; font-size: 15px; color: #333333;\">"
                    + contenidoPlano
                    + "</div>"
                    + "<p style=\"font-size: 13px; color: #888888; margin-top: 30px; border-top: 1px solid #eeeeee; padding-top: 15px;\">Este es un mensaje automático del sistema MesaAyuda.</p>"
                    + "</div>"
                    + "</div>";

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destination));
            message.setSubject(oNotification.getSubject());
            message.setContent(htmlContent, "text/html; charset=utf-8");

            Transport.send(message);

            logger.log(Level.INFO, "Correo enviado exitosamente | De: {0} | Para: {1}", new Object[]{sender, destination});

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Excepción atrapada al enviar correo: " + e.getClass().getName() + " - " + e.getMessage(), e);
            throw new RuntimeException("Error al enviar notificación por correo", e);
        }
    }

    @Override
    public String MtChannel() {
        return Channel;
    }
}
