/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.NotificationDTO;
import co.edu.sena.mesaayuda.mapper.NotificationMapper;
import co.edu.sena.mesaayuda.repository.NotificationRepository;
import java.util.List;

/**
 *
 * @author julil
 */
public class NotificationServiceImpl implements NotificationService {

    private final NotificationRepository oNotificationRepository;

    public NotificationServiceImpl(NotificationRepository oNotificationRepository) {
        this.oNotificationRepository = oNotificationRepository;
    }

    @Override
    public List<NotificationDTO> MtListForAddresse(int idUser) {
        return NotificationMapper.aDTO(oNotificationRepository.MtFindByAddressee(idUser));
    }

    @Override
    public int MtCountUnread(int idUser) {
        return oNotificationRepository.MtCountUnread(idUser);
    }

    @Override
    public void MtMarkAsRead(int idNotification) {
        oNotificationRepository.MtMarkAsRead(idNotification);
    }

}
