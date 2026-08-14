/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.dto.TicketDTO;
import co.edu.sena.mesaayuda.model.Ticket;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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

    Map<Integer, Integer> MtCountAgentWithoutAssignments();

    Map<String, Integer> MtCountTicketsForState();

    Ticket MtFindById(int id);

    TicketDTO MtFindTicket(int id);

    double MtCanceledTicketRate();

    double MtResolvedTicketRate();

    int MtCountClosedTickets(int idApplicant);

    int MtCountUnresolvedTickets(int idApplicant);

    int MtCountAsignedTickets(int idApplicant);

    List<TicketDTO> MtListTop5ByApplicant(int idApplicant);
    
    int MtCountAssignments();
}
