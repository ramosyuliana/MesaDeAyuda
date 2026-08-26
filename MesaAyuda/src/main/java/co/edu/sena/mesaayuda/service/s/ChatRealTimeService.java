/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.ChatRealTimeDTO;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface ChatRealTimeService {
    List<ChatRealTimeDTO> MtListByTicket(int idTicket);
}
