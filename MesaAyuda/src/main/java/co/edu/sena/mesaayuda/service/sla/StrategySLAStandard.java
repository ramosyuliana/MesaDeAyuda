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
public class StrategySLAStandard implements StrategySLA{

    private final PriorityRepository priorityRepository;

    public StrategySLAStandard(PriorityRepository priorityRepository) {
        this.priorityRepository = priorityRepository;
    }
 
    @Override
    public int MtCalculeHours(Priority oPriority) {
        Priority entity;
        try {
            entity = priorityRepository.MtFindByName(oPriority.getName());
             return entity.getAttentionTime();
        } catch (SQLException ex) {
            System.getLogger(StrategySLAStandard.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
            return 0;
        }
        
    }
    
    
}
