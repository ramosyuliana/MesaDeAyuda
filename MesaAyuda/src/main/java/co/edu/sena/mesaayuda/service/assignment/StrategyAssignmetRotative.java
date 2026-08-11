/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.assignment;

import co.edu.sena.mesaayuda.model.Ticket;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.repository.TicketRepository;
import java.util.List;

/**
 *
 * @author Admin
 */
public class StrategyAssignmetRotative implements StrategyAssignment{

    private final TicketRepository ticketRepository;

    public StrategyAssignmetRotative(TicketRepository ticketRepository) {
        this.ticketRepository = ticketRepository;
    }
    
    
    @Override
    public User MtAssigmentAgent(Ticket oTicket, List<User> Agents) {
        if(Agents ==  null || Agents.isEmpty()){
             throw new RuntimeException("No hay agentes disponibles");
        }
        int TotalAsignados = ticketRepository.MtCountAssignments();
        int indice = TotalAsignados%Agents.size();
        
        return Agents.get(indice);
    }
    
}
