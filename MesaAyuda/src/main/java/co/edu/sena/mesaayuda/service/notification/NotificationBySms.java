/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.notification;

import co.edu.sena.mesaayuda.model.Notification;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author julil
 */
public class NotificationBySms implements Notificator {

    private static final String Channel = "SMS";
    private static final int MaxLength = 160;
    private static final String SimulatedPhone = "+57 3148155644";
    private static final Logger logger = Logger.getLogger(NotificationBySms.class.getName());

    @Override
    public void MtSendNotification(Notification oNotification) {
        String text = MtTrim(oNotification.getMessage());
        logger.log(Level.INFO, "SMS simulado | Para: {0} ({1}) | Texto: {2}",
                new Object[]{oNotification.getAddressee().getName(), SimulatedPhone, text});
    }

    private String MtTrim(String message) {
        if (message.length() <= MaxLength) {
            return message;
        }
        return message.substring(0, MaxLength - 3) + "...";
    }

    @Override
    public String MtChannel() {
        return Channel;
    }

}
