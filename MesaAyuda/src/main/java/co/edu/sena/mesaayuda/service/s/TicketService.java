/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.TicketCreateDTO;
import co.edu.sena.mesaayuda.dto.TicketDTO;
import co.edu.sena.mesaayuda.model.Ticket;
import co.edu.sena.mesaayuda.model.state.TicketState;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface TicketService {

    void MtCreateTicket(TicketCreateDTO oTicket);

    void MtEditTicket(TicketDTO oTicket);

    void MtEditState(int idTicket, String action,String otpCode);

    void MtReassignAgent(int idTicket);

    List<TicketDTO> MtListByAgent(int IdAgent);

    List<TicketDTO> MtListByApplicant(int IdApplicant);

    List<TicketDTO> MtListAll();

    void MtNotifyStateChange(Ticket oTicket, TicketState oPreviousState);

    TicketDTO MtFindTicket(int id);

    Ticket MtFindById(int id);

    double MtCanceledTicketRate();

    double MtResolvedTicketRate();

    int MtCountClosedTickets(int idApplicant);

    int MtCountUnresolvedTickets(int idApplicant);

    int MtCountAsignedTickets(int idApplicant);

    List<TicketDTO> MtListTop5ByApplicant(int idApplicant);

    Map<String, Integer> MtCountTicketsForState();

    Map<Integer, Integer> MtCountAgentWithoutAssignments();
    
    int MtCountAssignments();

}
