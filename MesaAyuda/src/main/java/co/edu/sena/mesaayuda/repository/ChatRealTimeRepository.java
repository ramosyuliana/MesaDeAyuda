/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.ChatRealTime;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface ChatRealTimeRepository {
    
    void MtCreate(ChatRealTime ochat);
    List<ChatRealTime> MtListByTicket(int idTicket);
}
