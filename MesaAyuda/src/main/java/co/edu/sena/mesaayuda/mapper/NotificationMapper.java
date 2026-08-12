/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.mapper;

import co.edu.sena.mesaayuda.dto.NotificationDTO;
import co.edu.sena.mesaayuda.model.Notification;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author julil
 */
public class NotificationMapper {

    private static final DateTimeFormatter FORMATO
            = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

    private NotificationMapper() {
        // Clase de utilidad: no se instancia
    }

    public static NotificationDTO aDTO(Notification oNotification) {
        String sendDate = oNotification.getSendDate() == null ? "" : oNotification.getSendDate().format(FORMATO);

        return new NotificationDTO(
                oNotification.getId(),
                oNotification.getIdTicket(),
                oNotification.getSubject(),
                oNotification.getMessage(),
                oNotification.getChannel(),
                sendDate,
                oNotification.isRead()
        );
    }

    public static List<NotificationDTO> aDTO(List<Notification> notifications) {
        return notifications.stream().map(NotificationMapper::aDTO).collect(Collectors.toList());

    }
}
