/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.service.sla;

import co.edu.sena.mesaayuda.model.Priority;
import co.edu.sena.mesaayuda.model.Ticket;

/**
 *
 * @author Admin
 */
public interface StrategyPriority {
       Priority MtDeterminePriority(Ticket ticket);
}
