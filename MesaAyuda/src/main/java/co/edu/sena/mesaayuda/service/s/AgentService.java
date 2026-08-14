/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.AgentCreateDTO;
import co.edu.sena.mesaayuda.dto.AgentUpdateDTO;
import co.edu.sena.mesaayuda.model.Agent;
import java.util.List;

/**
 *
 * @author julil
 */
public interface AgentService {
    
    void MtCreate(AgentCreateDTO oAgentDTO);
    
    void MtEdit(AgentUpdateDTO oAgentDTO);
    
}
