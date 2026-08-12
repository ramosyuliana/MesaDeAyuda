/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.notification;

import co.edu.sena.mesaayuda.model.Notification;
import co.edu.sena.mesaayuda.repository.NotificationRepository;
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

    public NotificationByEmail(String sender) {
        this.sender = sender;
    }

    @Override
    public void MtSendNotification(Notification oNotification) {

        String destination = oNotification.getAddressee().getEmail();

        logger.log(Level.INFO, "Correo Simulado | De: {0} | Para: {1} | Asunto: {2}",
                new Object[]{sender, destination, oNotification.getSubject()});
    }

    @Override
    public String MtChannel() {
        return Channel;
    }

}
