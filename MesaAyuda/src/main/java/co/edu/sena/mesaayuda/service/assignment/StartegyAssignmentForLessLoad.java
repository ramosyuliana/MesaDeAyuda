/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.assignment;

import co.edu.sena.mesaayuda.model.Ticket;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.repository.TicketRepository;
import co.edu.sena.mesaayuda.repository.UserRepository;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author Admin
 */
public class StartegyAssignmentForLessLoad implements StrategyAssignment{

     private final UserRepository userRepository;

    public StartegyAssignmentForLessLoad(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

   
    @Override
    public User MtAssigmentAgent(Ticket oTicket, List<User> Agents) {
        if (Agents == null || Agents.isEmpty()) {
            throw new RuntimeException("No hay agentes disponibles");
        }
        return Agents.stream()
                .min(Comparator.comparingInt(agent -> userRepository.MtCountActiveByAgent(agent.getId())))
                .orElseThrow(() -> new IllegalStateException("No hay agentes disponibles"));
    }

    
}
