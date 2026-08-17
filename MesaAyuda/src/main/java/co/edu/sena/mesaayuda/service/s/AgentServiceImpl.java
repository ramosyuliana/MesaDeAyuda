/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.AgentCreateDTO;
import co.edu.sena.mesaayuda.dto.AgentUpdateDTO;
import co.edu.sena.mesaayuda.mapper.UserMapper;
import co.edu.sena.mesaayuda.model.Agent;
import co.edu.sena.mesaayuda.repository.AgentRepository;
import co.edu.sena.mesaayuda.repository.AgentRepositoryJdbc;
import java.util.List;

/**
 *
 * @author julil
 */
public class AgentServiceImpl implements AgentService {

    private final AgentRepository agentRepository;

    public AgentServiceImpl(AgentRepository agentRepository) {
        this.agentRepository = agentRepository;
    }

    @Override
    public void MtCreate(AgentCreateDTO oAgentDTO) {
        if (oAgentDTO.getIdCategories() == null || oAgentDTO.getIdCategories().isEmpty()) {
            throw new IllegalArgumentException("El agente debe tener al menos una categoría asignada.");
        }
        Agent oAgent = UserMapper.toEntityFromCreateAgent(oAgentDTO);
        agentRepository.MtCreateAgent(oAgent, oAgentDTO.getIdCategories());
    }

    @Override
    public void MtEdit(AgentUpdateDTO oAgentDTO) {
        if (oAgentDTO.getIdCategories() == null || oAgentDTO.getIdCategories().isEmpty()) {
            throw new IllegalArgumentException("El agente debe tener al menos una categoría asignada.");
        }
        Agent oAgent = UserMapper.toEntityFromUpdateAgent(oAgentDTO);
        agentRepository.MtUpdateAgent(oAgent, oAgentDTO.getIdCategories());
    }

    @Override
    public List<Integer> MtFindIdCategories(int idAgent) {
        return agentRepository.MtFindIdCategories(idAgent);
    }

}
