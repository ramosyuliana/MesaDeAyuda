/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.notification;

import co.edu.sena.mesaayuda.model.Notification;
import co.edu.sena.mesaayuda.repository.NotificationRepository;

/**
 *
 * @author julil
 */
public class NotificationInApp implements Notificator {

    private static final String Channel = "Aplicacion";

    private final NotificationRepository oRepository;

    public NotificationInApp(NotificationRepository oRepository) {
        this.oRepository = oRepository;
    }

    @Override
    public void MtSendNotification(Notification oNotification) {
        oNotification.setChannel(Channel);
        oNotification.setId(null);
        oRepository.MtSave(oNotification);
    }

    @Override
    public String MtChannel() {
        return Channel;
    }

}
