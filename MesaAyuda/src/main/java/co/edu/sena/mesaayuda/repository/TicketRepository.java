/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.dto.TicketDTO;
import co.edu.sena.mesaayuda.model.Ticket;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author julil
 */
public interface TicketRepository {

    void MtCreate(Ticket oticket);

    void MtEdit(Ticket oticket);

    List<TicketDTO> MtListByAgent(int IdAgent);

    List<TicketDTO> MtListByApplicant(int IdApplicant);

    List<TicketDTO> MtListAll();

    void MtEditAgent(int agent, Ticket oticket);

    void MtEditState(String estado, Ticket oticket);

    int MtCountAssignments();
    
    Ticket MtFindById(int id);
    
    TicketDTO MtFindTicket(int id);
}
