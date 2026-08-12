/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.sla;

import co.edu.sena.mesaayuda.model.Priority;
import co.edu.sena.mesaayuda.repository.PriorityRepository;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class StrategySLAStandard implements StrategySLA {

    private final PriorityRepository priorityRepository;

    public StrategySLAStandard(PriorityRepository priorityRepository) {
        this.priorityRepository = priorityRepository;
    }

    @Override
    public int MtCalculeDays(Priority oPriority) {
        Priority entity;

        entity = priorityRepository.MtFindByName(oPriority.getName());
        return entity.getAttentionTime();

    }
}
