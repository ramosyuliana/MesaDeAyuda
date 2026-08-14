/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.NotificationDTO;
import java.util.List;

/**
 *
 * @author julil
 */
public interface NotificationService {
    

    List<NotificationDTO> MtListForAddresse(int idAddresse);

    int MtCountUnread(int idUser);

    void MtMarkAsRead(int idNotification);

}
