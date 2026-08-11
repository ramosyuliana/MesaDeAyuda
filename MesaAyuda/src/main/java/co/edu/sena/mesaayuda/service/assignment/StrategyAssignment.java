/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.service.assignment;

import co.edu.sena.mesaayuda.model.Ticket;
import co.edu.sena.mesaayuda.model.User;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface StrategyAssignment {
    
    User MtAssigmentAgent(Ticket oTicket,List<User> Agents);
}
