/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Agent;
import java.util.List;

/**
 *
 * @author julil
 */
public interface AgentRepository {

    void MtCreateAgent(Agent oAgent, List<String> idCategories);

    void MtUpdateAgent(Agent oAgent, List<String> idCategories);

    }
