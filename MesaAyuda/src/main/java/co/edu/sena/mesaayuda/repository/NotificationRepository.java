/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Notification;
import java.util.List;

/**
 *
 * @author julil
 */
public interface NotificationRepository {
    
    Notification MtSave(Notification oNotification);
    
    List<Notification> MtFindByAddressee(Integer idUser);
    
    int MtCountUnread(Integer idUser);
    
    void MtMarkAsRead(Integer idNotification);
}
