/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.service.notification;

import co.edu.sena.mesaayuda.model.Notification;

/**
 *
 * @author julil
 */
public interface Notificator {
    
    void MtSendNotification(Notification oNotification);
    
    String MtChannel();
    
}
