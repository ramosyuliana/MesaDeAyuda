/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.notification;

import co.edu.sena.mesaayuda.model.Notification;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author julil
 */
public class NotificatorComposite implements Notificator {

    private static final String Channel = "Compuesto";
    private static final Logger logger = Logger.getLogger(NotificatorComposite.class.getName());

    private final List<Notificator> notifiers;

    public NotificatorComposite(List<Notificator> notifiers) {
        if (notifiers == null || notifiers.isEmpty()) {
            throw new IllegalArgumentException("Se requiere al menos un canal de notificacion");
        }
        this.notifiers = Collections.unmodifiableList(new ArrayList<>(notifiers));
    }

    @Override
    public void MtSendNotification(Notification oNotification) {
        for (Notificator oNotifier : notifiers) {
            try {
                oNotifier.MtSendNotification(oNotification);
            } catch (RuntimeException oException) {
                logger.log(Level.WARNING,
                        "Fallo el canal " + oNotifier.MtChannel()
                        + ", se continua con los demas",
                        oException);
            }
        }
    }

    @Override
    public String MtChannel() {
        return Channel;
    }
}
