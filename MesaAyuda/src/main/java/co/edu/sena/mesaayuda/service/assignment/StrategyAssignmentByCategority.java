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
public class StrategyAssignmentByCategority implements StrategyAssignment {

    private final UserRepository userRepository;

    public StrategyAssignmentByCategority(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User MtAssigmentAgent(Ticket oTicket, List<User> Agents) {
        
        List<User> specialized = userRepository.MtListAgentsByCategory(oTicket.getIdCategory());
        
        if(specialized.isEmpty()){
            throw new RuntimeException("No hay agentes disponibles para esa categoria");
            
        }
        
        return specialized.get(0);
    }

}
